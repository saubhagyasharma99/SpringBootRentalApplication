package com.findaroom.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.findaroom.app.dao.BookingDao;
import com.findaroom.app.model.Booking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

@Service
@Transactional
public class BookingServiceImpl implements BookingService{
	
	@Autowired
	BookingDao bookingDao;

	@Override
	public Booking addBooking(Booking booking) {
		
		return bookingDao.save(booking);
	}

	@Override
	public List<Booking> getAllBooking() {
		
		return bookingDao.findAll();
	}

	@Override
	public Booking getBookingById(int id) {
		
		return bookingDao.findById(id).orElse(new Booking());
	}

	@Override
	public List<Booking> getBookingByUser(User user) {
		
		return bookingDao.findByUser(user);
	}

	@Override
	public List<Booking> getBooingOfRoom(Room room) {
		return bookingDao.findByRoom(room);
	}

	@Override
	public List<Booking> getBookingByOwner(User user) {
		 ArrayList<Booking> bookings = new ArrayList<>();
		 for(Booking b : bookingDao.findAll()) {
			 if(b.getRoom().getUser().getId() == user.getId()) {
				 bookings.add(b);
			 }
		 }
		return bookings;
	}

	@Override
	public Booking updateBooking(Booking booking) {
		// TODO Auto-generated method stub
		return bookingDao.save(booking);
	}

	@Override
	public Booking deleteBooking(Booking booking) {
		try {
		bookingDao.delete(booking);
		}catch(Exception ex) {
			System.out.println("Could not delete: ");
			return null;
		}
		return booking;
	}

	@Override
	public boolean roomBookedByUser(Room room, User user) {
		boolean booked = false;
		List<Booking> bookingList = bookingDao.findByUser(user);
		for(Booking book : bookingList) {
			if(book.getRoom().getId() == room.getId()) {
				booked = true;
				break;
			}
		}
		return booked;
	}

	@Override
	public Booking returnLastBooking(User user) {
		List<Booking> bookings  = bookingDao.findByUser(user);
		int latestOne = 0;
		for(Booking book: bookings) {
			if(book.getId()>= latestOne) {
				latestOne = book.getId();
			}
		}
			return bookingDao.findById(latestOne).orElse(new Booking());
		
	}
	

}
