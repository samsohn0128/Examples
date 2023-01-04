package com.cos.jwt.config;

import com.cos.jwt.auth.PrincipalDetailsService;
import com.cos.jwt.filter.JwtAuthenticationFilter;
import com.cos.jwt.filter.JwtAuthorizationFilter;
import com.cos.jwt.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.filter.CorsFilter;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    private final CorsFilter corsFilter;
    private final PrincipalDetailsService principalDetailsService;
    private final UserRepository userRepository;

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http.addFilterBefore(new MyFilter3(), BasicAuthenticationFilter.class);
        http.csrf().disable();

        AuthenticationManagerBuilder builder = http.getSharedObject(AuthenticationManagerBuilder.class);
        builder.userDetailsService(principalDetailsService);
        AuthenticationManager manager = builder.build();

        http
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .addFilter(corsFilter)
                .formLogin().disable()
                .httpBasic().disable()
                .authenticationManager(manager)
                .addFilter(new JwtAuthenticationFilter(manager))
                .addFilter(new JwtAuthorizationFilter(manager, userRepository))
                .authorizeRequests()
                .antMatchers("/api/v1/user/**").access("hasAnyRole('ROLE_USER', 'ROLE_MANAGER', 'ROLE_ADMIN')")
                .antMatchers("/api/v1/manager/**").access("hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')")
                .antMatchers("/api/v1/admin/**").access("hasAnyRole('ROLE_ADMIN')")
                .anyRequest().permitAll();


        return http.build();
    }
}
