package com.findaroom.app.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.findaroom.app.model.Booking;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;

@Repository
public interface RoomDao extends JpaRepository<Room, Integer>{

	public List<Room> findByUser(User user);
	
	public List<Room> findByStatus(String status);
	
//	public List<Room> findByBooking(Booking booking);
//	decided to make one way relation from Booking to Room
	
	@Query("From Room r where r.price between ?1 and ?2")
	public List<Room> findByPriceBetween(double min, double max);
	
	@Query("FROM Room r WHERE r.addedOn > ?1")
	List<Room> findByAddedOnAfter(LocalDate before);

	
}
