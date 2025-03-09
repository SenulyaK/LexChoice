package com.lexchoice.lexchoice.security;


import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;

@Component
public class JwtUtil {
    private static final String SECRET_KEY = "55aa5fe6186298839ed5d4ccb54597412e6d0b4880d74ad09d630e4f828d50acc5f7feb54574c6ab1e9013f0dc237793cb6fd81163ca6b8aab0e1dc7038adb80681d95e0858a802f936fc462fbd2dd2d1ccb8bacc8a416c00393e5a87cbbb001677d8a6a74bbc6e8b87a46576777ccf30e0af55dcf6e1942e5e245315f59a08df10f3cb954ea8933af4ff92ed343e99c58eb46ec641fbcadd1f277b6362d267bbc736bd19eb561fb383c6cb6b00100e995d39d63f4911a614c8be426901d7f17e3cb5ce5535be010ac4fc26ea7891e71fd21086a82d3d46ba0568f2fb44524c43a442634f79ec786808adb8324d9f3feedbdf00376a541d2450cd2c0a720f897"; 
    private static final long EXPIRATION_TIME = 86400000; // 1 day

    private final Key key = Keys.hmacShaKeyFor(SECRET_KEY.getBytes());

    public String generateToken(String email) {
        return Jwts.builder()
                .setSubject(email)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    public String extractEmail(String token) {
        return Jwts.parserBuilder().setSigningKey(key).build()
                .parseClaimsJws(token).getBody().getSubject();
    }

    public boolean validateToken(String token) {
        try {
            Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);
            return true;
        } catch (JwtException | IllegalArgumentException e) {
            return false;
        }
    }
}
