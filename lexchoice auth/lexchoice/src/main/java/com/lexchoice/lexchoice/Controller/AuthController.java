package com.lexchoice.lexchoice.controller;

import com.lexchoice.lexchoice.model.User;
import com.lexchoice.lexchoice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

    @PostMapping("/register")
    public ResponseEntity<Map<String, String>> registerUser(@RequestBody User user) {
        logger.info("📩 Received REGISTER request: {}", user); // Log request input
        userService.registerUser(user);
        return ResponseEntity.ok(Collections.singletonMap("message", "User registered successfully!"));
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, String>> loginUser(@RequestBody Map<String, String> credentials) {
        logger.info("🔑 Received LOGIN request for email: {}", credentials.get("email")); // Log request input

        String token = userService.loginUser(credentials.get("email"), credentials.get("password"));
        if (token != null) {
            logger.info("✅ Login successful for email: {}", credentials.get("email"));
            return ResponseEntity.ok(Collections.singletonMap("token", token));
        } else {
            logger.warn("❌ Login FAILED for email: {}", credentials.get("email"));
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.singletonMap("message", "Invalid credentials"));
        }
    }
}
