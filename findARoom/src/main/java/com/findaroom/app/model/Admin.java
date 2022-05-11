package com.findaroom.app.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="admin_table")
public class Admin extends User{

	
	private LocalDate dob;
	
	private String image;

	public Admin() {
		super();
	}

	public Admin(LocalDate dob, String image) {
		super();
		this.dob = dob;
		this.image = image;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
