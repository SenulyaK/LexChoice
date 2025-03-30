package com.lexchoice.userprofile.service;

import com.lexchoice.userprofile.dto.UpdateUserProfileDTO;
import com.lexchoice.userprofile.exception.UserNotFoundException;
import com.lexchoice.userprofile.model.UserProfile;
import com.lexchoice.userprofile.repository.UserProfileRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserProfileSettingsService {

    private final UserProfileRepository userProfileRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserProfileSettingsService(UserProfileRepository userProfileRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userProfileRepository = userProfileRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UserProfile updateUserProfile(Long userId, UpdateUserProfileDTO updatedProfile) {
        Optional<UserProfile> existingUser = userProfileRepository.findById(userId);

        if (existingUser.isEmpty()) {
            throw new UserNotFoundException("User not found with ID: " + userId);
        }

        UserProfile user = existingUser.get();

        if (updatedProfile.getName() != null) user.setName(updatedProfile.getName());
        if (updatedProfile.getEmail() != null) user.setEmail(updatedProfile.getEmail());
        if (updatedProfile.getProfilePicture() != null) user.setProfilePicture(updatedProfile.getProfilePicture());
        if (updatedProfile.getNotificationEnabled() != null) user.setNotificationEnabled(updatedProfile.getNotificationEnabled());
        if (updatedProfile.getLanguage() != null) user.setLanguage(updatedProfile.getLanguage());

        // Update password if provided
        if (updatedProfile.getPassword() != null && !updatedProfile.getPassword().isBlank()) {
            user.setPassword(passwordEncoder.encode(updatedProfile.getPassword()));
        }

        return userProfileRepository.save(user);
    }
}
