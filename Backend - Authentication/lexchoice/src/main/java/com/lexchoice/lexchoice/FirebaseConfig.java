package com.lexchoice.lexchoice;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseAuth;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Configuration
public class FirebaseConfig {

    @Bean
    public FirebaseApp firebaseApp() throws IOException {
        InputStream serviceAccount = getClass().getClassLoader()
                .getResourceAsStream("firebase_config.json");  // ✅ Ensure file name matches

        if (serviceAccount == null) {
            throw new IllegalStateException("Firebase private key file not found.");
        }

        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .build();

        // ✅ Check if FirebaseApp is already initialized to avoid duplicate initialization
        List<FirebaseApp> firebaseApps = FirebaseApp.getApps();
        if (firebaseApps.isEmpty()) {
            return FirebaseApp.initializeApp(options);
        } else {
            return firebaseApps.get(0);
        }
    }

    @Bean
    public FirebaseAuth firebaseAuth(FirebaseApp firebaseApp) {
        return FirebaseAuth.getInstance();  // ✅ Ensure FirebaseApp is initialized before calling this
    }
}
