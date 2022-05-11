package com.findaroom.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.findaroom.app.dao.RoomDao;
import com.findaroom.app.model.Room;

@RestController
@RequestMapping("/api/room")
public class RoomRestController {
	// open browser and type URL: "http://localhost:8080/api/room" to get data from rest api 
	
	@Autowired
	RoomDao roomDao;

	@GetMapping
	public ResponseEntity<List<Room>> getAllRooms(){
		List<Room> rooms = roomDao.findAll();
		
		return ResponseEntity.ok().body(rooms);
	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Room> getRoomById(@PathVariable("id") int id) {
		Room room = roomDao.findById(id).orElse(new Room());
		return ResponseEntity.ok().body(room);
	}
	
	@PostMapping
	public Room saveRoom(@RequestBody Room room) {
		
		return roomDao.save(room);
	}
	
	@PutMapping
	public Room updateRoom(@RequestBody Room room) {
		
		return roomDao.save(room);
	}
	
	@DeleteMapping("/{id}")
	public Room deleteRoom(@PathVariable("id") int id) {
		Room room = roomDao.findById(id).orElse(new Room());
		roomDao.delete(room);
		return room;
	}
	
}
