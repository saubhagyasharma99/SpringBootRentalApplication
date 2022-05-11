package com.findaroom.app.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.findaroom.app.model.User;
import com.findaroom.app.service.UserService;

@Controller("/admin")
public class UserController {
	
	@Autowired
	UserService userService;

	@PostMapping("/admin/delete")
	public String deleteAdmin(@RequestParam("adminId") int id) {
		// this request must be send using a form submission
		
		User user = userService.getUserById(id);
		if(user != null && user.getId()!= 0 && userService.deleteUser(id)) {
			return "return:/admin/user/view";
		}
		return "return:/admin/user/view?delete_failed";
	}
	
	@PostMapping("/owner/delete")
	public String deleteOwner(@RequestParam("ownerId") int id) {
		// this request must be send using a form submission
		// to delete only a owner and related entities if necessary
		User user = userService.getUserById(id);
		if(user != null && user.getId()!= 0 && userService.deleteUser(id)) {
			return "return:/admin/user/view";
		}
		return "return:/admin/user/view?delete_failed";
	}
	
	@PostMapping("/user/delete")
	public String deleteUser(@RequestParam("userId") int id) {
		// this request must be send using a form submission
		// to delete only a user and related entities if necessary
		User user = userService.getUserById(id);
		if(user != null && user.getId()!= 0 && userService.deleteUser(id)) {
			return "return:/admin/user/view";
		}
		return "return:/admin/user/view?delete_failed";
	}
	
}
