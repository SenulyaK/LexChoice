package com.example.Feedback_backend.model;
import jakarta.persistence.*;

@Entity
@Table(name = "user_choices")
public class UserChoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Automatically increments ID
    private Long id;

    @Column(nullable = false)
    private String userId; //Stores the ID of the user who made the choice

    @Column(nullable = false)
    private String storyId;  //Stores the ID of the story associated with the choice

    @Column(nullable = false)
    private String choiceId;  //Stores the ID of the choice the user made

    @Column(nullable = false)
    private boolean isCorrectChoice;  //Indicates if the choice was correct or not

    // Getters and Setters
}
