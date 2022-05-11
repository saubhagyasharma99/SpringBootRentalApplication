package com.findaroom.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findaroom.app.model.Booking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

@Repository
public interface BookingDao extends JpaRepository<Booking, Integer>{

	
	public List<Booking> findByUser(User user);
	
	public List<Booking> findByRoom(Room room);
	
	
	
}
