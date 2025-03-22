package com.lexchoice.logoutsettings.controller;

import com.lexchoice.logoutsettings.service.TokenBlacklistService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController  //Indicates that this class is a REST controller
@RequestMapping("/api/auth") //Base URL for all endpoints in this controller

//Authentication controller class. Designed to handle user logout requests
public class AuthController {

    private final TokenBlacklistService tokenBlacklistService;

    public AuthController(TokenBlacklistService tokenBlacklistService) {
        this.tokenBlacklistService = tokenBlacklistService;
    }

    //This annotation indicates that this method handles HTTP POST requests to the /logout endpoint within the /api/auth path (as defined by @RequestMapping("/api/auth") on the class).
    @PostMapping("/logout")  //Maps HTTP POST requests to the /logout endpoint

    //This is the method signature. It takes the Authorization header from the request as a parameter. It returns a ResonseEntity<String>, allows for flexible HTTP responses status codes and messages bodies.
    public ResponseEntity<String> logout(@RequestHeader(value = "Authorization", required = false) String authHeader) {

        //This checks if the Authorization header is missing or doesn't start with "Bearer ". If either condition is true, it means the request doesn't have a valid JWT token.
        //Checks if the Authorization header is present and starts with "Bearer"
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {

            //if the token is invalid, then a bad request response is returned.
            return ResponseEntity.badRequest().body("Invalid token");  // Returns a 400 Bad Request if the token is invalid
        }

        //f the header is valid, this line extracts the JWT token by removing the "Bearer " prefix.
        String token = authHeader.substring(7);  //Extracts the token from the Authorization header

        //This line calls the blacklistToken() method of the TokenBlacklistService to add the extracted token to the blacklist. This prevents the token from being used again.
        tokenBlacklistService.blacklistToken(token);  // Adds the token to the blacklist

        //If the logout process is successful, this line returns an HTTP 200 OK response with the message "Logged out successfully".
        return ResponseEntity.ok("Logged out successfully");  // Returns a 200 OK response with a success message
    }
}


//this method receives a JWT token, blacklists it to invalidate it, and then responds with a success message.
// This controller handles logout requests by extracting the JWT token from the Authorization header,
// adding it to the blacklist to invalidate it, and then responding with a success message.