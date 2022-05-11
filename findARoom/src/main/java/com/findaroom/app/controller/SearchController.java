package com.findaroom.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.findaroom.app.model.Room;
import com.findaroom.app.service.RoomService;

@Controller
public class SearchController {

	@Autowired
	private RoomService roomService;
	
	@GetMapping({"/search"})
	public String openSearch() {
		return "search";
	}
	
	@PostMapping("/search")
	public String filter( Model model,
			@RequestParam(value = "type", defaultValue="none") String type,
			@RequestParam(value = "price", defaultValue="0.0") String  price,
			@RequestParam(value = "location", defaultValue="none") String location
			) {
		
		double min = 0.0, max=0.0;
		
		List<Room> allRooms = roomService.getAllAvailable();
		// get all available rooms
		
		
		List<Room> rooms = new ArrayList<Room>();
		
		for(Room r: allRooms) {
			
			if(!type.equals("none")  && type.equals(r.getType())) {

				rooms.add(r);
			}
			else if( !location.equals("none") 
					&& 
					  location.equals(r.getAddress().getCity()) ) {
				rooms.add(r);
			}
			
		}
		
		if(!price.equals("0.0")) {
			String[] priceRange = price.split("-");
			min = Double.parseDouble(priceRange[0]);
			max = Double.parseDouble(priceRange[1]);

			rooms.addAll(roomService.getRoomByPrice(min, max));
		}
		
		model.addAttribute("roomlist", rooms);
		return "search";
	}
}
