package com.findaroom.app.service;

import java.util.List;


import com.findaroom.app.model.ConfirmedBooking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

public interface ConfirmBookingService {

	public ConfirmedBooking addBooking(ConfirmedBooking booking);
	
	public List<ConfirmedBooking> getAllBooking();
	
	public ConfirmedBooking getBookingById(int id);
	
	public List<ConfirmedBooking> getBookingByUser(User user);
	
	public List<ConfirmedBooking> getBooingOfRoom(Room room);
	
	public List<ConfirmedBooking> getBookingByOwner(User user);
	
	public ConfirmedBooking updateBooking(ConfirmedBooking booking);
	
	public ConfirmedBooking deleteBooking(ConfirmedBooking booking);

	public boolean roomBookedByUser(Room room, User user);
	
}
