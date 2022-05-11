package com.findaroom.app.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.findaroom.app.model.Address;
import com.findaroom.app.model.Booking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;
import com.findaroom.app.service.AddressService;
import com.findaroom.app.service.BookingService;
import com.findaroom.app.service.RoomService;
import com.findaroom.app.service.UploadService;
import com.findaroom.app.service.UserService;

@Controller
public class RoomController {

	@Autowired
	RoomService roomService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	UploadService uploadService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	BookingService bookingService;
	
	// room add page for owner
	@GetMapping("/owner/room/add")
	public String addRoomByOwner() {
		return "room_add";
	}
	
	// owner adds a room
	@PostMapping("/owner/room/add")
	public String saveRoomByOwner(@ModelAttribute("room") Room room,
			@RequestParam("image") MultipartFile[] images,
			@RequestParam("bedroom") String bedroom,
			@RequestParam("bathroom") String bathroom,
			@RequestParam("comment") String comment,
			@RequestParam("location") String location,
			Principal p, RedirectAttributes redirectAttributes
			) {
		
		if(images.length>0) {
			System.out.println(images[0].getOriginalFilename());
			Arrays.asList(images)
	        .stream()
  .forEach(file->uploadService.uploadImage("desktop/photo upload/Photos/Room_images",file)); 
			// set room image upload directory as "Room_images" with 
			// 
			 redirectAttributes.addFlashAttribute("message",
				        "You successfully uploaded all files!");
			 
			 String imageName = "";
			for(MultipartFile image: images) {
				if(imageName!="") {
				imageName += ";" + image.getOriginalFilename();
				}else {
					imageName += image.getOriginalFilename();
				}
			}
			room.setImages(imageName);
			}
		
		
		
		System.out.println(room.toString());
		room.setStatus("1");
		room.setVerify("0");
		room.setAddedOn(LocalDate.now());
		
		
		room.setRooms("Bedroom:"+bedroom+", Bathroom:"+bathroom+", "+comment);
		System.out.println(room.toString());
		
		
		String username = p.getName();
		System.out.println(username);
		User user = userService.getUserByUsername(username);
		
		Address address = new Address();
		room.setAddress(address);
		
		 room.setUser(user);
		
		
		 Room saved =roomService.addRoom(room);
		return "redirect:/owner/room/add/"+location+"/"+saved.getAddress().getId();
	}
	
	// finalizes a room addition process by adding a address of the room
	@GetMapping("/owner/room/add/{location}/{aid}")
	public String orala(@PathVariable("location") String location,
			@PathVariable("aid") int aid,
			Model model) {
		model.addAttribute("aid", aid);
		model.addAttribute("location", location);
		model.addAttribute("address", addressService.getAddressById(aid)); 
		// works for update as well
		return "room_address";
	}
	
	// room address addedd by owner
	@PostMapping("/owner/room/address/{aid}")
	public String oraa(@PathVariable("aid") long aid,
			@RequestParam("location") String location,
			@ModelAttribute("address") Address address) {
		if(aid!=0) {
			address.setId(aid);
		}
		addressService.addAddress(address);
		return "redirect:/owner/home";
	}
	
	// user activity
	
	// user sees room detail to proceed for booking
	@GetMapping("/user/room/detail/{id}")
	public String roomDetail(Model model, @PathVariable("id") int rid) {
		Room room = roomService.getRoomById(rid);
//		if(room.getImages()!=null && room.getImages().length()>1) {
//		room.setImages(room.getImages().substring(0, room.getImages().indexOf(";")));
//		}
		model.addAttribute("roomInfo", room);
		model.addAttribute("rooms", roomService.getAllRooms());
		return "roomdetail";
	}
	
	// user view all rooms 
	@GetMapping("/user/room/view")
	public String viewRooms(Model model, Principal p) {
		model.addAttribute("roomsLatest", roomService.getRoomAddedAfter(LocalDate.now()));
		model.addAttribute("roomsFeatured", roomService.getAllAvailable());
		model.addAttribute("roomsTop", roomService.getRoomByPrice(5000, 1000000));
		
		// get room suggestion according to last booking and
		// booking detail room address room type or room price could
		// be used to generate suggestion list of rooms
		
		// room that is booked last time
		Room room = bookingService
				.returnLastBooking(userService.getUserByUsername(p.getName()))
				.getRoom();
		List<Room> roomsSuggested = new ArrayList<>();
		
		if(room!= null && room.getId()!=0) {
		roomsSuggested.add(room); // add as a first room to see if suggested are proper
		List<Room> allAvailable = roomService.getAllAvailable();
		for(Room r : allAvailable) {
			
			if(r.getType().equals(room.getType())) {
				// adds to suggested list if type matches 
				roomsSuggested.add(r);
			}
			else if((room.getArea()+100)>=r.getArea() && (room.getArea()-100) <= r.getArea()) {
				// adds to suggested list if area is in range of +100 and -100 of last bookings
				roomsSuggested.add(r);
			}
			else if(r.getAddress().getCity()!=null && room.getAddress().getCity().equals(r.getAddress().getCity())) {
				// adds to suggested list if address is a same city 
				roomsSuggested.add(r);
			}
		}
		}
		model.addAttribute("roomsSuggested", roomsSuggested);
		
		
		return "roomgalary";
	}
	
	
	@GetMapping("/owner/room/delete/{bid}")
	public String deleteRoom(@PathVariable("bid") int id, Principal p) {
		
		Room room = roomService.getRoomById(id);
		
			
			if(null != roomService.deleteRoom(room)) {
				return "redirect:/owner";
			}
			return "redirect:/owner";
	
	}
	
	
	
}
