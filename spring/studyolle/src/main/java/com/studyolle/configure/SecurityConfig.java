package com.studyolle.configure;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeRequests((authz) -> authz
                .mvcMatchers("/", "/login", "/sign-up", "/check-email", "/check-email-token", "/email-login",
                        "/check-email-login", "/login-link").permitAll()
                .mvcMatchers(HttpMethod.GET, "/profile").permitAll()
                .anyRequest().authenticated()
        );
        return http.build();
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring()
                .mvcMatchers("/node_modules/**")
                .requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }
}
