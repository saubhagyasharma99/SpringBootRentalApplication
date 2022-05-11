package com.findaroom.app.service;

import java.util.List;

import com.findaroom.app.model.Address;

public interface AddressService {

	public void addAddress(Address address);
	
	public void updateAddress(Address address);
	
	public void deleteAddress(Address address);
	
	public List<Address> getAllAddress();
	
	public Address getAddressById(long id);
	
	
}
