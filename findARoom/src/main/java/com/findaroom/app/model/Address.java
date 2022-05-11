package com.findaroom.app.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="address_tbl")
public class Address implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7427169750465376996L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="address_id")
    private Long id;
    
    private int number;  //location number
    
    private String street;
    
    private String city;
    
    private String province;
    
    private String zip;
    
    private String country;
    
    private double longitude;
    
    private double latitude;
    
    @OneToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="address")
    @JsonIgnoreProperties("address")
	private User user;

    @OneToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL, mappedBy="address")
    @JsonIgnoreProperties("address")
	private Room room;

	public Address() {
		super();
	}

	public Address(Long id, int number, String street, String city, String province, String zip, String country,
			double longitude, double latitude, User user, Room room) {
		super();
		this.id = id;
		this.number = number;
		this.street = street;
		this.city = city;
		this.province = province;
		this.zip = zip;
		this.country = country;
		this.longitude = longitude;
		this.latitude = latitude;
		this.user = user;
		this.room = room;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
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
