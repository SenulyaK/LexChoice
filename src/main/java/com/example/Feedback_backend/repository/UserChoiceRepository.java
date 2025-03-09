package com.example.Feedback_backend.repository;

import com.example.Feedback_backend.model.UserChoice;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UserChoiceRepository extends JpaRepository<UserChoice, Long> {
    List<UserChoice> findByUserId(String userId);
}
