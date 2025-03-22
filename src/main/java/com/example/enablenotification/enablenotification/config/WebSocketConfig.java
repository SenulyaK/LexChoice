package com.example.enablenotification.enablenotification.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.enablenotification.enablenotification.service.NotificationService;

@Configuration // Indicates that this class is a configuration class.
@EnableWebSocket // Enables WebSocket support.
public class WebSocketConfig implements WebSocketConfigurer {

    @Autowired // Automatically injects an instance of NotificationService.
    private NotificationService notificationService;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(notificationService, "/ws/notifications") // Registers the NotificationService as a WebSocket handler.
                .setAllowedOrigins("*"); // Allows connections from any origin (for development, restrict in production).
    }
}

// This configuration class sets up WebSocket handling, registering the NotificationService
// to handle connections on the /ws/notifications endpoint.