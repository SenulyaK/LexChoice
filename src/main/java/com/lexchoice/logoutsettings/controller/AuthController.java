package com.lexchoice.logoutsettings.controller;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    private final TokenBlacklistService tokenBlacklistService;

    public AuthController(TokenBlacklistService tokenBlacklistService) {
        this.tokenBlacklistService = tokenBlacklistService;
    }

    @PostMapping("/logout")
    public ResponseEntity<String> logout(@RequestHeader("Authorization") String authHeader) {
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return ResponseEntity.badRequest().body("Invalid token");
        }
        String token = authHeader.substring(7);
        tokenBlacklistService.blacklistToken(token);
        return ResponseEntity.ok("Logged out successfully");
    }
}

