package com.example.enablenotification.enablenotification.controller;

import com.example.enablenotification.enablenotification.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController // Indicates that this class is a REST controller, handling HTTP requests.
@RequestMapping("/api/notifications") // Base URL for all endpoints in this controller, providing a common prefix.
public class NotificationController {

    @Autowired // Automatically injects an instance of NotificationService.
    private NotificationService notificationService;

    @PostMapping("/send") // Maps HTTP POST requests to the /send endpoint.
    public String sendNotification(@RequestBody String message) { // Accepts the notification message as the request body.
        try {
            notificationService.sendNotification(message); // Calls the service to send the notification.
            return "Notification sent successfully!"; // Returns a success message.
        } catch (Exception e) {
            return "Error sending notification: " + e.getMessage(); // Returns an error message if sending fails.
        }
    }
}


