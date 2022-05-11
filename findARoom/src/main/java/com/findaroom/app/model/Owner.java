package com.findaroom.app.model;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="owner_table")
public class Owner extends User{

	
	private LocalDate dob;
	
	

	public Owner() {
		super();
	}



	public Owner(LocalDate dob) {
		super();
		this.dob = dob;
	}



	public LocalDate getDob() {
		return dob;
	}



	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	
	
	
}
