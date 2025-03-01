package com.lexchoice.lexchoice.controlller;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.UserRecord;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    private final FirebaseAuth firebaseAuth;

    public UserController(FirebaseAuth firebaseAuth) {
        this.firebaseAuth = firebaseAuth;
    }

    // ✅ 1️⃣ User Authentication - Verify Token
    @GetMapping("/profile")
    public ResponseEntity<String> getUserProfile(@RequestHeader("Authorization") String token) {
        try {
            FirebaseToken decodedToken = firebaseAuth.verifyIdToken(token.replace("Bearer ", ""));
            String uid = decodedToken.getUid();
            return ResponseEntity.ok("Authenticated user ID: " + uid);
        } catch (FirebaseAuthException e) {
            return ResponseEntity.status(401).body("Invalid Token");
        }
    }

    // ✅ 2️⃣ User Creation - Add a new user to Firebase
    @PostMapping("/create")
    public ResponseEntity<String> createUser(@RequestBody Map<String, String> user) {
        String email = user.get("email");
        String password = user.get("password");

        if (email == null || password == null || password.length() < 6) {
            return ResponseEntity.badRequest().body("Invalid email or password. Password must be at least 6 characters.");
        }

        try {
            UserRecord.CreateRequest request = new UserRecord.CreateRequest()
                    .setEmail(email)
                    .setPassword(password);

            UserRecord userRecord = firebaseAuth.createUser(request);
            return ResponseEntity.ok("User created successfully. UID: " + userRecord.getUid());
        } catch (FirebaseAuthException e) {
            return ResponseEntity.badRequest().body("Error creating user: " + e.getMessage());
        }
    }
}
