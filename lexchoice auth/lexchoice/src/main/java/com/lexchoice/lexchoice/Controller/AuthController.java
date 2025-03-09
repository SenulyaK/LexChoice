package com.lexchoice.lexchoice.controller;

import com.lexchoice.lexchoice.model.User;
import com.lexchoice.lexchoice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public Map<String, String> registerUser(@RequestBody User user) {
        userService.registerUser(user);
        Map<String, String> response = new HashMap<>();
        response.put("message", "User registered successfully!");
        return response;
    }

    @PostMapping("/login")
    public Map<String, String> loginUser(@RequestBody Map<String, String> credentials) {
        String token = userService.loginUser(credentials.get("email"), credentials.get("password"));
        Map<String, String> response = new HashMap<>();
        if (token != null) {
            response.put("token", token);
            response.put("message", "Login successful!");
        } else {
            response.put("message", "Invalid credentials");
        }
        return response;
    }
}
