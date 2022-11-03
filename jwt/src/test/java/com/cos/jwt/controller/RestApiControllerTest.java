package com.cos.jwt.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class RestApiControllerTest {
    @Autowired
    MockMvc mockMvc;

    @Test
    public void 토큰_인증_실패() throws Exception {
        mockMvc.perform(post("/token")
                        .header("Authorization", "wrong"))
                .andExpect(status().isOk())
                .andExpect(content().string("Not Authorized\n"));
    }

    @Test
    public void 토큰_인증_성공() throws Exception {
        mockMvc.perform(post("/token")
                        .header("Authorization", "boong"))
                .andExpect(status().isOk())
                .andExpect(content().string("<h1>token!!</h1>"));
    }

}