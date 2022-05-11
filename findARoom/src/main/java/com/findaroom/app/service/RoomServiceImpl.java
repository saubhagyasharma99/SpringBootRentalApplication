package com.findaroom.app.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.findaroom.app.dao.BookingDao;
import com.findaroom.app.dao.RoomDao;
import com.findaroom.app.model.Booking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

@Service
@Transactional
public class RoomServiceImpl implements RoomService{

	@Autowired
	RoomDao roomDao;
	
	@Autowired
	BookingDao bookingDao;
	
	@Override
	public Room addRoom(Room room) {
		
		return roomDao.save(room);
	}

	@Override
	public List<Room> getAllRooms() {
		
		return roomDao.findAll();
	}

	@Override
	public Room getRoomById(int id) {
		
		return roomDao.findById(id).orElse(new Room());
	}

	@Override
	public List<Room> getRoomByUser(User user) {
		
		return roomDao.findByUser(user);
	}

//	@Override
//	public List<Room> getRoomByBooking(Booking booking) {
//		
//		return roomDao.findByBooking(booking);
//	}

	@Override
	public Room updateRoom(Room room) {
		
		return roomDao.save(room);
	}

	@Override
	public Room deleteRoom(Room room) {
		roomDao.delete(room);
		return room;
	}
	
	
	
	@Override
	public List<Room> getRoomByPrice(double min, double max ) {
		
		return roomDao.findByPriceBetween(min, max);
	}

	@Override
	public List<Room> getAllAvailable() {
		
		return roomDao.findByStatus("1");
	}

	@Override
	public List<Room> getRoomAddedAfter(LocalDate date) {
		
		return roomDao.findByAddedOnAfter(date.minusDays(10));
	}

	
	
	
	
}
