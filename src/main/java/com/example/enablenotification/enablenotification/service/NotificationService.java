package com.example.enablenotification.enablenotification.service;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import java.util.ArrayList;
import java.util.List;

@Service // Indicates that this class is a Spring service.
public class NotificationService extends TextWebSocketHandler { // Extends TextWebSocketHandler to handle WebSocket text messages.
    private static final List<WebSocketSession> sessions = new ArrayList<>(); // Stores active WebSocket sessions.

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        sessions.add(session); // Adds a new session to the list when a connection is established.
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        for (WebSocketSession s : sessions) { // Iterates through all active sessions.
            if (s.isOpen()) {
                s.sendMessage(message); // Sends the received message to all open sessions.
            }
        }
    }

    public void sendNotification(String message) throws Exception {
        for (WebSocketSession session : sessions) { // Iterates through all active sessions.
            if (session.isOpen()) {

                session.sendMessage(new TextMessage(message)); // Sends the given message to all open sessions.
            }
        }
    }
}

// This service handles WebSocket connections and message broadcasting.
// It stores active sessions and sends messages to all connected clients.