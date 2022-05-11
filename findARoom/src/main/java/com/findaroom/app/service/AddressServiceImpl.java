package com.findaroom.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.findaroom.app.dao.AddressDao;
import com.findaroom.app.model.Address;

@Service
@Repository
public class AddressServiceImpl implements AddressService{

	@Autowired
	AddressDao addressDao;
	
	@Override
	public void addAddress(Address address) {
		// save address of user, owner or place
		addressDao.save(address);
	}

	@Override
	public void updateAddress(Address address) {
		// update by self or by admin 
		addressDao.save(address);
	}

	@Override
	public void deleteAddress(Address address) {
		// TODO Auto-generated method stub
		addressDao.delete(address);
	}

	@Override
	public List<Address> getAllAddress() {
		// TODO Auto-generated method stub
		return addressDao.findAll();
	}

	@Override
	public Address getAddressById(long id) {
		// TODO Auto-generated method stub
		return addressDao.findById(id).orElse(new Address());
	}

	
}
