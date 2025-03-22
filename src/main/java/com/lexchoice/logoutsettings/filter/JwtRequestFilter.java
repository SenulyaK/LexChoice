package com.lexchoice.logoutsettings.filter;



import com.lexchoice.logoutsettings.service.TokenBlacklistService;
import com.lexchoice.logoutsettings.util.JwtUtil;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component //Indicates that this class is a Spring component

public class JwtRequestFilter extends OncePerRequestFilter {

    private final TokenBlacklistService tokenBlacklistService;
    private final JwtUtil jwtUtil;
    private final UserDetailsService userDetailsService;

    public JwtRequestFilter(TokenBlacklistService tokenBlacklistService, JwtUtil jwtUtil, UserDetailsService userDetailsService) {
        this.tokenBlacklistService = tokenBlacklistService;
        this.jwtUtil = jwtUtil;
        this.userDetailsService = userDetailsService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        final String authorizationHeader = request.getHeader("Authorization");

        //Check if token is blacklisted

        if (authorizationHeader != null && authorizationHeader.startsWith("Bearer ")) {
            String token = authorizationHeader.substring(7);

            // Check if token is blacklisted

            if (tokenBlacklistService.isTokenBlacklisted(token)) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Token has been revoked"); //Returns a 401 Unauthorized if the token is blacklisted

                return;
            }

            try {
                String username = jwtUtil.extractUsername(token);

                if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                    UserDetails userDetails = userDetailsService.loadUserByUsername(username);

                    if (jwtUtil.validateToken(token, userDetails)) {
                        UsernamePasswordAuthenticationToken authToken =
                                new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                        authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                        SecurityContextHolder.getContext().setAuthentication(authToken);
                    } else {
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid or expired token"); //Returns a 401 Unauthorized if the token is invalid or expired


                        return;
                    }
                }
            } catch (Exception e) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid or expired token");
                return;
            }
        }

        // Continue filter chain only if token is valid

        chain.doFilter(request, response); //Continues the filter chain

    }
}


// This filter intercepts incoming requests to validate JWT tokens.
// It checks if the token is blacklisted, extracts the username, and validates the token.
// If valid, it sets the authentication context.