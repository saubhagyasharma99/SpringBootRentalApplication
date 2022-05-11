package com.findaroom.app.controller;


import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.findaroom.app.service.RoomService;

@Controller
public class HomeController {
	
	@Autowired
	RoomService roomService;

	@GetMapping({"/","/home"})
	public String openHome(Authentication auth, Model model) {
		if(auth!=null) {
		System.out.println(auth.getName());
		System.out.println(auth.getAuthorities().toString());
		}
		
		model.addAttribute("roomlist", roomService.getAllAvailable());
		return "index";
	}

	@GetMapping("/about")
	public String openAbout() {
		return "about";
	}
	
	@GetMapping("/contact")
	public String openContact() {
		return "contact";
	}
	
	
	@GetMapping("/room_galary")
	public String openGalary(Model model) {
		model.addAttribute("roomsLatest", roomService.getRoomAddedAfter(LocalDate.now()));
		model.addAttribute("roomsFeatured", roomService.getAllAvailable());
		model.addAttribute("roomsTop", roomService.getRoomByPrice(5000, 1000000));
		return "roomgalary";
		
	}
	 
	
}
