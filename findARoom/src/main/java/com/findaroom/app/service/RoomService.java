package com.findaroom.app.service;

import java.time.LocalDate;
import java.util.List;

import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

public interface RoomService {

	public Room addRoom(Room room);
	
	public List<Room> getAllRooms();
	
	public List<Room> getAllAvailable();
	
	public Room getRoomById(int id);
	
	public List<Room> getRoomByPrice(double min, double max);
	
	public List<Room> getRoomByUser(User user);  // get room of owner
	
//	public List<Room> getRoomByBooking(Booking booking);
//	
	public List<Room> getRoomAddedAfter(LocalDate date);
	
	public Room updateRoom(Room room);

	
	public Room deleteRoom(Room room);
	
	
}
