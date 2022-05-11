package com.findaroom.app.model;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Confirmed_booking_tbl")
public class ConfirmedBooking {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="booking_id")
	private int id;
	
	
	private LocalDate bookedOn;
	
	private LocalDate confirmedOn;

	private String profession;
	
	private int occupancy;
	
	private String remark;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name="user_id", nullable=false)
	private User user;
	// tenant who books a room
	
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name="room_id", nullable=false)
	private Room room;
	
	public ConfirmedBooking() {
		super();
	}

	public ConfirmedBooking(int id, LocalDate bookedOn, LocalDate confirmedOn, String profession, int occupancy, String remark, User user, Room room) {
		super();
		this.id = id;
		this.bookedOn = bookedOn;
		this.confirmedOn = confirmedOn;
		this.profession = profession;
		this.occupancy = occupancy;
		this.remark = remark;
		this.user = user;
		this.room = room;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getBookedOn() {
		return bookedOn;
	}

	public void setBookedOn(LocalDate bookedOn) {
		this.bookedOn = bookedOn;
	}

	
	
	public LocalDate getConfirmedOn() {
		return confirmedOn;
	}

	public void setConfirmedOn(LocalDate confirmedOn) {
		this.confirmedOn = confirmedOn;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public int getOccupancy() {
		return occupancy;
	}

	public void setOccupancy(int occupancy) {
		this.occupancy = occupancy;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	
	
	
}
