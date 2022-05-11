package com.findaroom.app.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.findaroom.app.model.Address;
import com.findaroom.app.model.Booking;
import com.findaroom.app.model.ConfirmedBooking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;
import com.findaroom.app.service.AddressService;
import com.findaroom.app.service.BookingService;
import com.findaroom.app.service.ConfirmBookingService;
import com.findaroom.app.service.RoomService;
import com.findaroom.app.service.UserService;

@Controller
public class BookingController {
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	ConfirmBookingService confirmBookingService;
	
	@Autowired
	AddressService addressService;

	// user books a room and confirms a booking afterwards in bookingconform page
	@GetMapping("/user/book/room/{rid}")
	public String bookRoomNow(@PathVariable("rid") int id, 
						Principal p, Model model) {
		Room room = roomService.getRoomById(id);
		User user = userService.getUserByUsername(p.getName());
		if(bookingService.roomBookedByUser(room, user)) {
			return "redirect:/user/book/success?booked=false";
		}
		model.addAttribute("roomInfo", roomService.getRoomById(id));
		model.addAttribute("rooms", roomService.getAllRooms());
		return "bookingconfirm";
	}
	
	// supplies and finalizes booking confirmation process
	@PostMapping("/user/book/confirm")
	public String bookRoomConfirm(@RequestParam("rid") int id, Principal p,
									@RequestParam("remark") String remark,
									@RequestParam("profession") String profession,
									@RequestParam("occupancy") int occupancy) {
		Room roomBooked = roomService.getRoomById(id);
		User user = userService.getUserByUsername(p.getName());
		// add booking information
		Booking booking = new Booking();
		booking.setConfirmed("0");
		booking.setBookedOn(LocalDate.now());
		booking.setUser(user);
		booking.setRoom(roomBooked);
		booking.setRemark(remark);
		booking.setOccupancy(occupancy);
		booking.setProfession(profession);
		
		booking = bookingService.addBooking(booking);
		
		Address userAddress = user.getAddress();
		if(user.getAddress()==null || userAddress.getId()==0) {
			// add user address if not set earlier
			return "redirect:/user/address/add?booking=true";
		}else if(userAddress.getStreet()==null) {
			// update user address if all detail not provided earlier
			return "redirect:/user/address/update/"+ user.getAddress().getId()+"?booking=true";
		}
		return "redirect:/user/book/success?booked=true";
	}
	
	// owner sees a booking of a specified room
	@GetMapping("/owner/room/booking/{rid}")
	public String ShowOwnersBookedRooms(@PathVariable("rid") int id,
					Model model) {
		model.addAttribute("bookings", bookingService.getBooingOfRoom(roomService.getRoomById(id)));
		return "owner_booking";
	}
	
	
	// user sees all the bookings of their own
	@GetMapping("/user/booking/view")
	public String userBookings(Model model, Principal p) {
		model.addAttribute("booklist", bookingService.getBookingByUser(userService.getUserByUsername(p.getName())));
		
		
		return "tenant_booking";
	}
	
	// sees a detail of each booking
	@GetMapping("/user/booking/detail/{bid}")
	public String showBookingDetail(@PathVariable("bid") int id, 
			Model model, Principal p) {
		model.addAttribute("booking", bookingService.getBookingById(id));
		model.addAttribute("booklist", bookingService.getBookingByUser(userService.getUserByUsername(p.getName())));
		
		return "bookingdetail";
	}
	
	
	// cancel users booking 
		@GetMapping("/user/booking/cancel/{bid}")
		public String cancelUserBooking(@PathVariable("bid") int id, Principal p) {
			
			Booking booking = bookingService.getBookingById(id);
			User user = userService.getUserByUsername(p.getName());
			// check if the booking is done by the current user so
			// we may not delete other users booking
			if(booking.getUser().getId() == user.getId()) {
				
				// to safely delete bookings without deleting user or bookings
				Room r = new Room();
				Address a = new Address();
				User u = new User();
				
				r.setAddress(a);
				u.setAddress(a);
				r.setUser(u);
				
				booking.setRoom(r);
				booking.setUser(u);
	
				bookingService.updateBooking(booking);
				// to safely delete bookings without deleting user or bookings
				
				if(null != bookingService.deleteBooking(booking)) {
					return "redirect:/user/booking/view";
				}
			}
			
			return "redirect:/user/booking/view?booking_cancel_failed"; 
		}
		
		
	
	// sees a detail of each booking by room owner
		@GetMapping("/owner/booking/detail/{bid}")
		public String showBookedRoomsToOwner(@PathVariable("bid") int id, 
				Model model, Principal p,
				@RequestParam(defaultValue="false") boolean booking_failed) {
			model.addAttribute("booking", bookingService.getBookingById(id));
			model.addAttribute("booklist", bookingService.getBookingByOwner(userService.getUserByUsername(p.getName())));
			model.addAttribute("booking_failed", booking_failed);
			
			return "bookeddetail";
		}
		
		// Confirm booking of each booking by room owner
				@GetMapping("/owner/booking/confirm/{bid}")
				public String confirmRoomBookingByOwner(@PathVariable("bid") int id) {
					
					// check if confirm booking is possible
					// ie if it has been conformed already the room or the owner
					
					List<ConfirmedBooking> confirmList  = confirmBookingService.getAllBooking();
					Booking booking  = bookingService.getBookingById(id);
					int roomId =booking.getRoom().getId();
					
					boolean alreadyConfirmed = false;
					for(ConfirmedBooking b : confirmList) {
						// check to see if room is already confirmed
						if(b.getRoom().getId() == roomId) {
							alreadyConfirmed = true;
							break;
						}
					}
					
					if(!alreadyConfirmed) {
					
					ConfirmedBooking confirmedBooking  = new ConfirmedBooking();
					confirmedBooking.setBookedOn(booking.getBookedOn());
					confirmedBooking.setConfirmedOn(LocalDate.now());
					confirmedBooking.setOccupancy(booking.getOccupancy());
					confirmedBooking.setProfession(booking.getProfession());
					confirmedBooking.setRemark(booking.getRemark());
					confirmedBooking.setRoom(booking.getRoom());
					confirmedBooking.setUser(booking.getUser());
					
					booking.setConfirmed("1");  // set confirmed to booking
					confirmBookingService.addBooking(confirmedBooking);
					bookingService.updateBooking(booking);
					return "redirect:/owner/home";
					}
					else {
						return "redirect:/owner/booking/detail/{bid}?booking_failed=true";
					}
				}
}
