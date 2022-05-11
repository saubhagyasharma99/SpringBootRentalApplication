package com.findaroom.app.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class SecurityFilterInitializer extends AbstractSecurityWebApplicationInitializer{

	

	public SecurityFilterInitializer() {
		super(SecurityFilterConfiguration.class);
	}

	
	
}
