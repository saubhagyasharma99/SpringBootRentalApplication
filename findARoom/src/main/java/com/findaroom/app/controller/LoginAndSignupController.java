package com.findaroom.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.findaroom.app.model.Roles;
import com.findaroom.app.model.User;
import com.findaroom.app.service.UserService;

@Controller
public class LoginAndSignupController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PasswordEncoder passwordEncoder;

	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@GetMapping("/signup")
	public String signupUser() {
		return "signup";
	}

	@PostMapping("/signup")
	public String userSignup(@ModelAttribute("user") User user, 
			BindingResult bindingResult) {
		System.out.println("pass: "+ user.getPassword());
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		System.out.println("pass: "+ user.getPassword());
		
		if(user.getAuthority().equals("ADMIN")) {
			user.setActive("0");
		}
		else if(user.getAuthority().equals("OWNER")) {
			user.setActive("1");
		}
		else if(user.getAuthority().equals("USER")) {
			user.setActive("1");
		}
		
		
		
		Roles roles = new Roles();
		roles.setRole("ROLE_"+user.getAuthority());
		roles.setUser(user);
		user.setRoles(roles);
		
		userService.saveUser(user);
		return "redirect:/login";
	}
	
	
}
