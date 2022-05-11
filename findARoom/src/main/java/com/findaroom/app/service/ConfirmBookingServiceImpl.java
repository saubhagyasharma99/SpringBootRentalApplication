package com.findaroom.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.findaroom.app.dao.ConfirmBookingDao;
import com.findaroom.app.model.ConfirmedBooking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

@Service
@Transactional
public class ConfirmBookingServiceImpl implements ConfirmBookingService{
	
	@Autowired
	ConfirmBookingDao bookingDao;

	@Override
	public ConfirmedBooking addBooking(ConfirmedBooking booking) {
		
		return bookingDao.save(booking);
	}

	@Override
	public List<ConfirmedBooking> getAllBooking() {
		
		return bookingDao.findAll();
	}

	@Override
	public ConfirmedBooking getBookingById(int id) {
		
		return bookingDao.findById(id).orElse(new ConfirmedBooking());
	}

	@Override
	public List<ConfirmedBooking> getBookingByUser(User user) {
		
		return bookingDao.findByUser(user);
	}

	@Override
	public List<ConfirmedBooking> getBooingOfRoom(Room room) {
		return bookingDao.findByRoom(room);
	}

	@Override
	public List<ConfirmedBooking> getBookingByOwner(User user) {
		 ArrayList<ConfirmedBooking> bookings = new ArrayList<>();
		 for(ConfirmedBooking b : bookingDao.findAll()) {
			 if(b.getRoom().getUser().getId() == user.getId()) {
				 bookings.add(b);
			 }
		 }
		return bookings;
	}

	@Override
	public ConfirmedBooking updateBooking(ConfirmedBooking booking) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ConfirmedBooking deleteBooking(ConfirmedBooking booking) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean roomBookedByUser(Room room, User user) {
		boolean booked = false;
		List<ConfirmedBooking> bookingList = bookingDao.findByUser(user);
		for(ConfirmedBooking book : bookingList) {
			if(book.getRoom().getId() == room.getId()) {
				booked = true;
				break;
			}
		}
		return booked;
	}
	

}
