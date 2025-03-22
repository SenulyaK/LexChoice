package com.example.enablenotification.enablenotification.dto;

public class NotificationRequest {
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}

// This DTO (Data Transfer Object) represents a notification request,
// containing the message to be sent.