package com.lexchoice.logoutsettings.filter;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JwtRequestFilter extends OncePerRequestFilter {

    private final TokenBlacklistService tokenBlacklistService;
    private final JwtUtil jwtUtil;
    private final UserDetailsService userDetailsService;

    public JwtRequestFilter(TokenBlacklistService tokenBlacklistService, JwtUtil jwtUtil, UserDetailsService userDetailsService) {
        this.tokenBlacklistService = tokenBlacklistService;
        this.jwtUtil = jwtUtil;
        this.userDetailsService = userDetailsService;
    }