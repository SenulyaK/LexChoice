package com.lexchoice.lexchoice;

import com.lexchoice.lexchoice.security.FirebaseAuthFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final FirebaseAuthFilter firebaseAuthFilter;

    public SecurityConfig(FirebaseAuthFilter firebaseAuthFilter) {  // ✅ Inject FirebaseAuthFilter
        this.firebaseAuthFilter = firebaseAuthFilter;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .csrf(csrf -> csrf.disable())  // ✅ Correct way to disable CSRF in Spring Security 6
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/public/**").permitAll()  // ✅ Allow public endpoints
                        .anyRequest().authenticated()  // ✅ Protect all other endpoints
                )
                .addFilterBefore(firebaseAuthFilter, UsernamePasswordAuthenticationFilter.class)  // ✅ Ensures FirebaseAuthFilter runs before authentication
                .build();
    }
}
