package service;

import exception.UserNotFoundException;
import model.UserProfile;
import repository.UserProfileRepository;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class UserProfileService {
    private final UserProfileRepository userProfileRepository;

    public UserProfileService(UserProfileRepository userProfileRepository) {
        this.userProfileRepository = userProfileRepository;
    }

    public UserProfile getUserById(String userId) {
        UserProfile user = userProfileRepository.findById(userId);
        if (user == null) {
            throw new UserNotFoundException("User not found with ID: " + userId);
        }
        return user;
    }

    public void updateUsername(String userId, String newUsername) {
        UserProfile user = getUserById(userId);
        user.setUsername(newUsername);
        userProfileRepository.update(userId, user);
    }

    public void updateEmail(String userId, String newEmail) {
        UserProfile user = getUserById(userId);
        user.setEmail(newEmail);
        userProfileRepository.update(userId, user);
    }

    public void updatePassword(String userId, String newPassword) {
        UserProfile user = getUserById(userId);
        user.setPassword(newPassword);
        userProfileRepository.update(userId, user);
    }

    public String createUserProfile(String username, String email, String password) {
        String userId = UUID.randomUUID().toString();
        UserProfile userProfile = new UserProfile(userId, username, email, password);
        userProfileRepository.save(userProfile);
        return userId;
    }
}

