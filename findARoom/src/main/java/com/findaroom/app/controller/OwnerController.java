package com.findaroom.app.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.findaroom.app.model.Booking;
import com.findaroom.app.model.ConfirmedBooking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;
import com.findaroom.app.service.BookingService;
import com.findaroom.app.service.ConfirmBookingService;
import com.findaroom.app.service.RoomService;
import com.findaroom.app.service.UserService;

@Controller
public class OwnerController {

	@Autowired
	UserService userService;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	BookingService bookingService;

	@Autowired
	ConfirmBookingService confirmBookingService;

	
	@GetMapping("/owner/home")
	public String userHome(Principal p, Model model) {
		System.out.println(p.getName());// owner name display console
		User owner = userService.getUserByUsername(p.getName());
		model.addAttribute("userinfo", userService.getUserByUsername(owner.getUsername()));
		List<Room> rooms =  roomService.getRoomByUser(owner);
		model.addAttribute("rooms", rooms);
		List<Booking> bookings = bookingService.getBookingByOwner(owner);
		
		List<ConfirmedBooking> confirmedBookings = confirmBookingService.getBookingByOwner(owner);
		
		model.addAttribute("bookings", bookings);
		model.addAttribute("confirmed_bookings", confirmedBookings);
		model.addAttribute("total_rooms", rooms.size());
		model.addAttribute("total_bookings", bookings.size());
		model.addAttribute("total_confirmed_bookings", confirmedBookings.size());
		
		return "ownerprofile";
	}
	
	
	
	
}
