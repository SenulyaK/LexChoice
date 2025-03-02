package repository;

import model.UserProfile;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserProfileRepository {
    private final Map<String, UserProfile> userProfiles = new HashMap<>();

    public UserProfile findById(String id) {
        return userProfiles.get(id);
    }

    public void save(UserProfile userProfile) {
        userProfiles.put(userProfile.getId(), userProfile);
    }

    public void update(String id, UserProfile userProfile) {
        userProfiles.put(id, userProfile);
    }
}
