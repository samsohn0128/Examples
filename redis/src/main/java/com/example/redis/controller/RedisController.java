package com.example.redis.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
public class RedisController {
    private final HttpSession httpSession;

    @GetMapping
    public String redis() {
        httpSession.setAttribute("this is key", "this is value");
        return httpSession.getId();
    }
}
