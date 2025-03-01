package com.lexchoice.lexchoice.security;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component  // ✅ Marks this as a Spring-managed component
public class FirebaseAuthFilter extends OncePerRequestFilter {

    private final FirebaseAuth firebaseAuth;

    public FirebaseAuthFilter(FirebaseAuth firebaseAuth) {  // ✅ Inject FirebaseAuth bean
        this.firebaseAuth = firebaseAuth;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {

        String token = request.getHeader("Authorization");

        if (token == null || !token.startsWith("Bearer ")) {
            chain.doFilter(request, response);
            return;
        }

        try {
            FirebaseToken decodedToken = firebaseAuth.verifyIdToken(token.replace("Bearer ", ""));
            PreAuthenticatedAuthenticationToken authentication =
                    new PreAuthenticatedAuthenticationToken(decodedToken, null);
            SecurityContextHolder.getContext().setAuthentication(authentication);
        } catch (FirebaseAuthException e) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Unauthorized: Invalid or expired token");
            return;
        }

        chain.doFilter(request, response);
    }
}
