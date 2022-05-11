package com.findaroom.app.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.findaroom.app.model.ConfirmedBooking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

@Repository
public interface ConfirmBookingDao extends JpaRepository<ConfirmedBooking, Integer>{

	
	public List<ConfirmedBooking> findByUser(User user);
	
	public List<ConfirmedBooking> findByRoom(Room room);
	
	
	
}
