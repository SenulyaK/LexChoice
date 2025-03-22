package com.lexchoice.logoutsettings.util;



import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import java.security.Key;
import java.util.Date;
import java.util.function.Function;

@Service //Indicates that this class is a service component

public class JwtUtil {
    private final String SECRET_KEY = "your_secret_key_base64_encoded"; // Use a BASE64 encoded key  // Ideally, use an environment variable or configuration property


    private Key getSigningKey() {
        byte[] keyBytes = Decoders.BASE64.decode(SECRET_KEY);
        return Keys.hmacShaKeyFor(keyBytes);
    }

    // Extract the username from the token

    public String extractUsername(String token) {
        return extractClaim(token, Claims::getSubject); //Extracts the subject (username) from the token

    }

    // Extract claims (e.g., expiration, username, etc.)

    public <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        Claims claims = Jwts.parserBuilder()
                .setSigningKey(getSigningKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
        return claimsResolver.apply(claims); //Extracts a specific claims from the token

    }

    // Generate JWT token

    public String generateToken(UserDetails userDetails) {
        return Jwts.builder()
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 10)) // 10 hours
                .signWith(getSigningKey(), SignatureAlgorithm.HS256)
                .compact();   //Generates a JWT token

    }

    // Validate the token

    public boolean validateToken(String token, UserDetails userDetails) {
        return extractUsername(token).equals(userDetails.getUsername()) && !isTokenExpired(token); //Validates the token

    }

    // Check if the token is expired

    private boolean isTokenExpired(String token) {
        return extractClaim(token, Claims::getExpiration).before(new Date()); //Checks if the token is expired

    }
}

// This utility class provides methods for generating, validating, and extracting information from JWT tokens.
// It uses a secret key to sign the tokens and includes methods for extracting claims and checking expiration.