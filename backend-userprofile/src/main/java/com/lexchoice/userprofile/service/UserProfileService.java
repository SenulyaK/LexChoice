package com.lexchoice.userprofile.service;

import com.lexchoice.backenduserprofile.model.User;
import com.lexchoice.backenduserprofile.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;

@Service
public class UserProfileService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserProfileService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    /**
     * Updates user profile details except for the ID.
     */
    @Transactional
    public User updateUserProfile(Long userId, User updatedUser) {
        Optional<User> existingUserOptional = userRepository.findById(userId);
        if (existingUserOptional.isEmpty()) {
            throw new RuntimeException("User not found");
        }

        User existingUser = existingUserOptional.get();

        // Update fields if provided
        if (updatedUser.getName() != null) {
            existingUser.setName(updatedUser.getName());
        }
        if (updatedUser.getEmail() != null) {
            existingUser.setEmail(updatedUser.getEmail());
        }
        if (updatedUser.getProfilePicture() != null) {
            existingUser.setProfilePicture(updatedUser.getProfilePicture());
        }
        if (updatedUser.getNotificationEnabled() != null) {
            existingUser.setNotificationEnabled(updatedUser.getNotificationEnabled());
        }
        if (updatedUser.getLanguage() != null) {
            existingUser.setLanguage(updatedUser.getLanguage());
        }

        return userRepository.save(existingUser);
    }

    /**
     * Updates the user's password securely.
     */
    @Transactional
    public void updateUserPassword(Long userId, String newPassword) {
        Optional<User> existingUserOptional = userRepository.findById(userId);
        if (existingUserOptional.isEmpty()) {
            throw new RuntimeException("User not found");
        }

        User existingUser = existingUserOptional.get();
        existingUser.setPassword(passwordEncoder.encode(newPassword));

        userRepository.save(existingUser);
    }
}
