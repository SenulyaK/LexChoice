package com.lexchoice.logoutsettings.service;



import org.springframework.stereotype.Service;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class TokenBlacklistService {
    private final Set<String> blacklistedTokens = ConcurrentHashMap.newKeySet(); // Thread-safe set for storing blacklisted tokens

    public void blacklistToken(String token) {
        blacklistedTokens.add(token);  //Adds a token to the blacklist
    }

    public boolean isTokenBlacklisted(String token) {
        return blacklistedTokens.contains(token); // Checks if a token is in the blacklist.
    }
}

// This service manages a set of blacklisted JWT tokens, providing methods to add tokens to the blacklist
// and check if a token is blacklisted. The use of ConcurrentHashMap.newKeySet() ensures thread safety.