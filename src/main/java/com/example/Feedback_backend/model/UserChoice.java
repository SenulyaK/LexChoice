package com.example.Feedback_backend.model;
import jakarta.persistence.*;

@Entity
@Table(name = "user_choices")
public class UserChoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String userId;

    @Column(nullable = false)
    private String storyId;

    @Column(nullable = false)
    private String choiceId;

    @Column(nullable = false)
    private boolean isCorrectChoice;

    // Getters and Setters
}
