package com.findaroom.app.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.findaroom.app.model.Address;

@Repository
public interface AddressDao extends JpaRepository<Address, Long>{

	
	
}
