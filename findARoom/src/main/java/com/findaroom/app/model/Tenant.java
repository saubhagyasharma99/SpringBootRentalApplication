package com.findaroom.app.model;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="tenant_table")
public class Tenant extends User{

	private long phone;
	
	private LocalDate dob;
	
	

	public Tenant() {
		super();
	}

	public Tenant(long phone, LocalDate dob) {
		super();
		this.phone = phone;
		this.dob = dob;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}
	
	
	
	
	
}
