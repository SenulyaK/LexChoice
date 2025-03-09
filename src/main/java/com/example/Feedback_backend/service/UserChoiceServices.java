package com.example.Feedback_backend.service;


import com.example.Feedback_backend.model.UserChoice;
import com.example.Feedback_backend.repository.UserChoiceRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserChoiceServices {
    private UserChoiceRepository userChoiceRepository;

    public void UserChoiceService(UserChoiceRepository userChoiceRepository) {
        this.userChoiceRepository = userChoiceRepository;
    }

    public List<UserChoice> getUserChoices(String userId) {
        return userChoiceRepository.findByUserId(userId);
    }

}
