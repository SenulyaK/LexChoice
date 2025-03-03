package contoller;

import dto.UserProfileDTO;
import model.UserProfile;
import service.UserProfileService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
public class UserProfileController {
    private final UserProfileService userProfileService;

    public UserProfileController(UserProfileService userProfileService) {
        this.userProfileService = userProfileService;
    }

    @GetMapping("/{userId}")
    public UserProfileDTO getUserProfile(@PathVariable String userId) {
        UserProfile userProfile = userProfileService.getUserById(userId);
        return new UserProfileDTO(userProfile.getUsername(), userProfile.getEmail());
    }

    @PutMapping("/{userId}/username")
    public void updateUsername(@PathVariable String userId, @RequestParam String newUsername) {
        userProfileService.updateUsername(userId, newUsername);
    }

    @PutMapping("/{userId}/email")
    public void updateEmail(@PathVariable String userId, @RequestParam String newEmail) {
        userProfileService.updateEmail(userId, newEmail);
    }

    @PutMapping("/{userId}/password")
    public void updatePassword(@PathVariable String userId, @RequestParam String newPassword) {
        userProfileService.updatePassword(userId, newPassword);
    }

    @PostMapping("/create")
    public String createUserProfile(@RequestParam String username, @RequestParam String email, @RequestParam String password) {
        return userProfileService.createUserProfile(username, email, password);
    }
}

