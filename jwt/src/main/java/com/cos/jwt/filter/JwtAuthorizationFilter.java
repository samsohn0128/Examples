package com.cos.jwt.filter;


import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.cos.jwt.auth.PrincipalDetails;
import com.cos.jwt.model.User;
import com.cos.jwt.repository.UserRepository;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JwtAuthorizationFilter extends BasicAuthenticationFilter {
    private UserRepository userRepository;

    public JwtAuthorizationFilter(AuthenticationManager authenticationManager, UserRepository userRepository) {
        super(authenticationManager);
        this.userRepository = userRepository;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("This is JwtAuthorizationFilter");

        String jwtHeader = request.getHeader("Authorization");
        if (jwtHeader == null || !jwtHeader.startsWith("Bearer ")) {
            System.out.println("jwtHeader is null or not starts with Bearer");
            chain.doFilter(request, response);
            return;
        }

        String jwtToken = request.getHeader("Authorization").replace("Bearer ", "");
        String username = JWT.require(Algorithm.HMAC512("boong")).build()
                .verify(jwtToken)
                .getClaim("username").asString();
        if (username != null) {
            System.out.println("username = " + username);
            System.out.println("Successfully verified!!");
            User user = userRepository.findByUsername(username);
            System.out.println("user = " + user);
            PrincipalDetails principalDetails = new PrincipalDetails(user);
            principalDetails.getAuthorities().forEach(role -> System.out.println("role = " + role.getAuthority()));
            // JWT Token ????????? ?????? ???????????? Authentication ????????? ?????? ??????
            // ???????????? ?????? ????????? ????????? ????????? ????????????(credentials)??? null, ?????? ??????
            Authentication authentication = new UsernamePasswordAuthenticationToken(
                    principalDetails, null, principalDetails.getAuthorities());

            // ????????? Security Session??? ???????????? authentication ??????
            SecurityContextHolder.getContext().setAuthentication(authentication);
            chain.doFilter(request, response);
        }
    }
}
