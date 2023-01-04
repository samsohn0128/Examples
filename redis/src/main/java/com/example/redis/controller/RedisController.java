package com.example.redis.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
public class RedisController {
    private final HttpSession httpSession;

    @Value("${jwt.secret}")
    private String secret;

    @GetMapping
    public String redis() {
        httpSession.setAttribute("testKey", "testValue");
        System.out.println("secret = " + secret);
        return httpSession.getId() + " : " + httpSession.getAttribute("testKey");
    }
}
