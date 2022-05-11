package com.findaroom.app.service;

import java.util.List;

import com.findaroom.app.model.Booking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

public interface BookingService {

	public Booking addBooking(Booking booking);
	
	public List<Booking> getAllBooking();
	
	public Booking getBookingById(int id);
	
	public List<Booking> getBookingByUser(User user);
	
	public List<Booking> getBooingOfRoom(Room room);
	
	public List<Booking> getBookingByOwner(User user);
	
	public Booking updateBooking(Booking booking);
	
	public Booking deleteBooking(Booking booking);

	public boolean roomBookedByUser(Room room, User user);
	
	public Booking returnLastBooking(User user);
	
	
}
