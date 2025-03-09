package com.lexchoice.userprofile.controller;

import com.lexchoice.userprofile.dto.UpdateUserProfileDTO;
import com.lexchoice.userprofile.model.UserProfile;
import com.lexchoice.userprofile.service.UserProfileSettingsService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user/settings")
public class UserProfileSettingsController {

    private final UserProfileSettingsService userProfileSettingsService;

    public UserProfileSettingsController(UserProfileSettingsService userProfileSettingsService) {
        this.userProfileSettingsService = userProfileSettingsService;
    }

    @PutMapping("/update")
    public ResponseEntity<UserProfile> updateProfile(Authentication authentication,
                                                     @RequestBody UpdateUserProfileDTO updatedProfile) {
        Long userId = Long.parseLong(authentication.getName()); // Extract user ID from JWT
        UserProfile updatedUser = userProfileSettingsService.updateUserProfile(userId, updatedProfile);
        return ResponseEntity.ok(updatedUser);
    }
}
