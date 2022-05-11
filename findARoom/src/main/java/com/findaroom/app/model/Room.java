package com.findaroom.app.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="Room_table")
public class Room implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1172557362610858274L;

	@Id@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="room_id")
	private int id;
	
	private String type;
	
	private double area;
	
	private String description;
	
	private String status;
	
	private String verify;
	
	private double price;
	
	@Transient
	private String location;
	
	private LocalDate addedOn;
	
	private String images;
	
	private String rooms;      // bedroom-5, bathroom-3 etc
	
	// facility
	private boolean water;
	
	private boolean parking;
	
	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="room")
	@JsonIgnoreProperties("room")
    private List<Booking> booking;
	 
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name="address_id", nullable=false)
	@JsonIgnoreProperties("room")
	private Address address;
	
	 @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		@JoinColumn(name="user_id", nullable=false)
	 @JsonIgnoreProperties("room")
		private User user;
		// owner of a room
	 
	public Room() {
		super();
	}

	public Room(int id, String type, double area, String description, String status, String verify, double price,
			LocalDate addedOn, String images, String rooms, boolean water, boolean parking,
			List<Booking> booking, Address address, User user, String location) {
		super();
		this.id = id;
		this.type = type;
		this.area = area;
		this.description = description;
		this.status = status;
		this.verify = verify;
		this.price = price;
		this.addedOn = addedOn;
		this.images = images;
		this.rooms = rooms;
		this.water = water;
		this.parking = parking;
		this.booking = booking;
		this.address = address;
		this.user = user;
		this.location = location;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public LocalDate getAddedOn() {
		return addedOn;
	}

	public void setAddedOn(LocalDate addedOn) {
		this.addedOn = addedOn;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getRooms() {
		return rooms;
	}

	public void setRooms(String rooms) {
		this.rooms = rooms;
	}

	public boolean isWater() {
		return water;
	}

	public void setWater(boolean water) {
		this.water = water;
	}

	public boolean isParking() {
		return parking;
	}

	public void setParking(boolean parking) {
		this.parking = parking;
	}

	public List<Booking> getBooking() {
		return booking;
	}

	public void setBooking(List<Booking> booking) {
		this.booking = booking;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	
	@Override
	public String toString() {
		return "Room [id=" + id + ", type=" + type + ", area=" + area + ", description=" + description + ", status="
				+ status + ", verify=" + verify + ", price=" + price + ", addedOn=" + addedOn + ", images=" + images
				+ ", rooms=" + rooms + ", water=" + water + ", parking=" + parking + ", booking=" + booking
				+ ", address=" + address + ", user=" + user + "]";
	}

	
	
	
}
