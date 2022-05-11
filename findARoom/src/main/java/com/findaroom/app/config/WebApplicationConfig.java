package com.findaroom.app.config;

import javax.servlet.MultipartConfigElement;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebApplicationConfig implements WebMvcConfigurer {
		
		
		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		        .addResourceHandler("/images/**")
		        .addResourceLocations("file:///c:/users/dilli/desktop/photo upload/photos/room_images/")
		        .setCachePeriod(3600);
		}
		
		@SuppressWarnings("deprecation")
		@Bean
		public MultipartConfigElement multipartConfigElement() {
		  MultipartConfigFactory factory = new MultipartConfigFactory();
		  factory.setMaxFileSize("10MB");
		  factory.setMaxRequestSize("10MB");
		  return factory.createMultipartConfig();
		}
		

}
