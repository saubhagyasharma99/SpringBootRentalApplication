package com.findaroom.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.trace.http.HttpTrace.Principal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.findaroom.app.model.Roles;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;
import com.findaroom.app.service.BookingService;
import com.findaroom.app.service.RoomService;
import com.findaroom.app.service.UserService;

@Controller
public class AdminController {

	@Autowired
	UserService userService;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	BookingService bookingService;

	@GetMapping("/admin/home")
	public String userHome(Principal p, Model model) {
		// admins home page displays admin information
		model.addAttribute("userinfo", userService.getUserByUsername(p.getName()));
		return "admin/adminhome";
	}
	
	@GetMapping("/admin/user/show")
	public String usersView(Model model) {
		// shows all users registered with our system
		model.addAttribute("userlist", userService.getAllUsers());
		return "admin/users";
	}
	
	@GetMapping("/admin/user/detail/{id}")
	public String userDetial(Model model, @PathVariable("id") int id) {
		// shows detail of a specific admin as a user when clicked from list of admin
		model.addAttribute("user", userService.getUserById(id));
		model.addAttribute("userlist", userService.getAllUsers());
		return "admin/userdetail";
	}
	
	@GetMapping("/admin/user/update")
	public String userEdit(Model model) {
		model.addAttribute("userlist", userService.getAllUsers());
		return "admin/userupdate";
	}
	
	@PostMapping("/admin/user/edit")
	public String editPage(Model model, @RequestParam("uid") int uid) {
		model.addAttribute("userlist", userService.getAllUsers());
		model.addAttribute("userinfo", userService.getUserById(uid));
		return "admin/userupdate";
	}
	
	@PostMapping("/admin/user/update")
	public String userUpdate(@ModelAttribute("user") User user) {
		if(user.getId()!=0) {
			User updateUser = userService.getUserById(user.getId());
			Roles roles = updateUser.getRoles();
			roles.setRole(user.getAuthority());
			user.setRoles(roles);
			user.setActive(user.getActive());
			userService.updateUser(updateUser);
		}

		return "redirect:/admin/user/view";
	}
	
	
	@GetMapping("/admin/user/enable/{id}")
	public String userEnabler( @PathVariable("id") int id) {
		// enable a user so user can login in to a system
		User user = userService.getUserById(id);
		user.setActive("1");
		userService.updateUser(user);
		return "redirect:/admin/user/show";
	}
	
	@GetMapping("/admin/user/disable/{id}")
	public String userDisabler( @PathVariable("id") int id) {
		// disable a user so block the user form logging into the system
		User user = userService.getUserById(id);
		user.setActive("0");
		userService.updateUser(user);
		return "redirect:/admin/user/show";
	}
	
	@GetMapping("/admin/room/show")
	public String roomsView(Model model) {
		// displays all rooms available with a syatem
		model.addAttribute("roomlist", roomService.getAllRooms());
		return "admin/rooms";
	}
	
	@GetMapping("/admin/room/available")
	public String roomsAvailable(Model model) {
		// shows only all available rooms
		model.addAttribute("roomlist", roomService.getAllAvailable());
		return "admin/rooms";
	}
	
	@GetMapping("/admin/room/detail/{rid}")
	public String roomDetail(@PathVariable("rid") int id, Model model) {
		// shows a detail of rooms with given id
		model.addAttribute("room", roomService.getRoomById(id));
		return "admin/roomdetail";
	}
	
	@GetMapping("/admin/room/enable/{rid}")
	public String roomEnabled(@PathVariable("rid") int id) {
		// enable a room added by owner so a user can view and book it 
		Room room = roomService.getRoomById(id);
		room.setStatus("1");
		if(roomService.updateRoom(room).getId()!=0) {
			return "redirect:/admin/room/show?enabled=true";
		}
		return "redirect:/admin/room/show?enabled=false";
	}
	
	@GetMapping("/admin/room/disable/{rid}")
	public String roomDisbled(@PathVariable("rid") int id) {
		// disable a room added by owner after success booking confirmation 
		// so a user cannot view and book it again
		Room room = roomService.getRoomById(id);
		room.setStatus("0");
		if(roomService.updateRoom(room).getId()!=0) {
			return "redirect:/admin/room/show?disabled=true";
		}
		return "redirect:/admin/room/show?disabled=false";
	}
	
	@GetMapping("/admin/room/doverify/{rid}")
	public String roomVerified(@PathVariable("rid") int id) {
		// verify through another way
		Room room = roomService.getRoomById(id);
		room.setVerify("1");
		if(roomService.updateRoom(room).getId()!=0) {
			return "redirect:/admin/room/show?verified=true";
		}
		return "redirect:/admin/room/show?verified=false";
	}
	
	@GetMapping("/admin/room/unverify/{rid}")
	public String roomUnVerified(@PathVariable("rid") int id) {
		// unverify in another way
		Room room = roomService.getRoomById(id);
		room.setVerify("0");
		if(roomService.updateRoom(room).getId()!=0) {
			return "redirect:/admin/room/show?unverified=true";
		}
		return "redirect:/admin/room/show?unverified=false";
	}
	
	
	@GetMapping("/admin/booking/show")
	public String bookingsView(Model model) {
		// show all bookings
		model.addAttribute("bookinglist", bookingService.getAllBooking());
		return "admin/bookings";
	}
	
	
	@GetMapping("/admin/room/verify")
	public String verifyRoomPage(Model model) {
		// verify room page
		model.addAttribute("roomlist", roomService.getAllRooms());
		return "admin/roomverification";
	}
	
	@GetMapping("/admin/room/verify/{rid}")
	public String verifyThisRoom(Model model, @PathVariable("rid") int id) {
		// verify specified room by a=dmin after adding by owner
		model.addAttribute("roomlist", roomService.getAllRooms());
		model.addAttribute("newroom", roomService.getRoomById(id));
		return "admin/roomverification";
	}
	
	@PostMapping("/admin/room/verify")
	public String verifyRoom(@RequestParam("id") int id,
			@RequestParam("verify") String verify) {
		
		Room room = roomService.getRoomById(id);
		room.setVerify(verify);
		if(roomService.updateRoom(room).getId()!=0) {
			return "redirect:/admin/room/show?verified=true";
		}
		return "redirect:/admin/room/show?verified=fasle";
	}
	
	
	@GetMapping("/admin/room/bookings/{rid}")
	public String bookingsOfRooms(Model model, @PathVariable("rid") int id) {
		// show bookings of a room when clicked from rooms page
		model.addAttribute("bookinglist", bookingService.getBooingOfRoom(roomService.getRoomById(id)));
	//	model.addAttribute("confirmedlist", confirmBookingService.getBookingOfRoom(roomService.getRoomById(id)));
		
		return "admin/bookingconfirm";
	}
	
	@GetMapping("/admin/room/update")
	public String updateRoomAdmin(Model model) {
		// show bookings of a room when clicked from rooms page
		model.addAttribute("roomlist", roomService.getAllRooms());
	
		return "admin/roomupdate";
	}
	
	@PostMapping("/admin/room/edit")
	public String editRoomAdmin(Model model, @RequestParam("rid") int id) {
		// show bookings of a room when clicked from rooms page
		model.addAttribute("roomlist", roomService.getAllRooms());
		model.addAttribute("roominfo", roomService.getRoomById(id));
		return "admin/roomupdate";
	}
	
	@PostMapping("/admin/room/update")
	public String roomUpdateAdmin( @ModelAttribute("room") Room room) {
		// show bookings of a room when clicked from rooms page
		if(room.getId()!= 0) {
		Room updateRoom  = roomService.getRoomById(room.getId());
			updateRoom.setType(room.getType());	
			updateRoom.setArea(room.getArea());
			updateRoom.setDescription(room.getDescription());
			updateRoom.setPrice(room.getPrice());
			updateRoom.setStatus(room.getStatus());
			updateRoom.setVerify(room.getVerify());
			
			
				
		}		
		return "redirect:/";
	}
	
	
}
