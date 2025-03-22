package com.lexchoice.logoutsettings;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;


@SpringBootApplication //Indicates this is a Spring Boot application

// Logout settings
public class LogoutsettingsApplication {

	public static void main(String[] args) {
		SpringApplication.run(LogoutsettingsApplication.class, args);
	} // Starts the Spring Boot application

}

// This is the main application class for the Spring Boot application.
// It uses @SpringBootApplication to enable Spring Boot auto-configuration.