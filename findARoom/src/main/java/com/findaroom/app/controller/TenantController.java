package com.findaroom.app.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.findaroom.app.model.Address;
import com.findaroom.app.model.Booking;
import com.findaroom.app.model.PayModel;
import com.findaroom.app.model.Room;
import com.findaroom.app.model.User;
import com.findaroom.app.service.AddressService;
import com.findaroom.app.service.BookingService;
import com.findaroom.app.service.RoomService;
import com.findaroom.app.service.UserService;

@Controller
public class TenantController {

	@Autowired
	UserService userService;
	
	@Autowired
	RoomService roomSerivce;
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	AddressService addressService;

	// User resources
	@GetMapping("/user/home")
	public String userHome(Principal p, Model model) {
		model.addAttribute("userinfo", userService.getUserByUsername(p.getName()));
		List<Room> rooms;
		rooms = roomSerivce.getRoomByPrice(0, 2000);
		if(rooms.size()>0)
		model.addAttribute("roomInfo1", rooms.get(0));
		rooms = roomSerivce.getRoomByPrice(2001, 5000);
		if(rooms.size()>0)
		model.addAttribute("roomInfo2", rooms.get(0));
		
		rooms = roomSerivce.getRoomByPrice(5001, 100000);
		if(rooms.size()>0)
		model.addAttribute("roomInfo3", rooms.get(0));
		return "tenantprofile";
	}
	
	
	
	@GetMapping("/user/address/add")
	public String userAddressAdd(@RequestParam(defaultValue="false") boolean booking,
								Principal p, Model model) {
		User user = userService.getUserByUsername(p.getName());
		model.addAttribute("userinfo", user);
		if(booking) {
		model.addAttribute("isaBooking", booking);
		}
		model.addAttribute("address", new Address());
		return "user_address";
	}
	
	
	@PostMapping("/user/address/add")
	public String userAddedAddress(@RequestParam(defaultValue="false") boolean booking,
								Principal p,
								@ModelAttribute("address") Address address) {
		User user = userService.getUserByUsername(p.getName());
		user.setAddress(address);
		addressService.addAddress(address);
		if(booking) {
			return "redirect:/user/book/success?booked=true"; 
			// after successfully adding a user address during booking
		}
		
		return "redirect:/user/home";
		// regular user adding or updating address
	}
	
	@GetMapping("/user/address/update/{id}")
	public String userAddressUpdate(@RequestParam(defaultValue="false") boolean booking,
			@PathVariable("id") int id, Principal p, Model model) {
		model.addAttribute("userinfo", userService.getUserByUsername(p.getName()));
		
		model.addAttribute("address", addressService.getAddressById(id));
		return "user_address";
	}
	
	
	@GetMapping("/user/book/success")
	public String bookingSuccess(@RequestParam(defaultValue="true") boolean booked,
			Model model, Principal p) {
		User user =  userService.getUserByUsername(p.getName());
		model.addAttribute("userinfo", user);
		model.addAttribute("booking", bookingService.getBookingByUser(user));
		if(booked) {
			model.addAttribute("msg", "Room booking successful!");
		}
		else {
			model.addAttribute("msg", "You already booked this room");
			
		}
		return "bookingsuccess";
	}
	
	
	@PostMapping(value="/user/booking/pay/{bid}")
    public String orderPaymeny(@RequestParam("grand_total") double amount,
            @PathVariable("bid") int id,
            Model model,
            Principal p)
    {
        PayModel payModel = new PayModel();
        payModel.setAmount(amount);
        payModel.setTaxAmount((amount* payModel.getTaxRate())/100);
        payModel.setProductSC((amount*payModel.getPscRate())/100);
        payModel.setProductDC((amount*payModel.getPdcRate())/100);
//        payModel.setMerchantId("ofos_346dshh-234");
//        payModel.setMerchantName("OFOS_PVT_LTD");
        payModel.setTotalAmount(payModel.getAmount()
                                    + payModel.getTaxAmount()
                                    + payModel.getProductSC()
                                    + payModel.getProductDC());
        
        User customer = userService.getUserByUsername(p.getName());
        Booking booking = bookingService.getBookingById(id);
        model.addAttribute("booking", booking);
        model.addAttribute("customer", customer);
        model.addAttribute("payment", payModel);
        return "epay";
    }
	
	
	
	/*
	 * 
	 * 	Esewa API
		https://developer.esewa.com.np
		Username: test4@esewa.com.np
		Password: test12
	 */
	@GetMapping("/user/booking/esewa_payment_success")
	public String paymentSuccess(@RequestParam("q") String status, Model model) {
		if(status.equals("su")) {
			model.addAttribute("msg", "Booking ordered successfully!");
		}
		else {
			model.addAttribute("msg", "Booking order unsuccessful!");
		}
		return "epay_success";
	}

	
}
