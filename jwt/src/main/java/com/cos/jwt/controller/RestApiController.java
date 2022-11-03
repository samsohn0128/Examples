package com.cos.jwt.controller;

import com.cos.jwt.auth.PrincipalDetails;
import com.cos.jwt.model.User;
import com.cos.jwt.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class RestApiController {
    private final BCryptPasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    @GetMapping
    public String index() {
        return "<h1>This is index!!!</h1>";
    }

    @GetMapping("/home")
    public String home() {
        return "<h1>home!!</h1>";
    }

    @PostMapping("/token")
    public String token() {
        return "<h1>token!!</h1>";
    }

    @PostMapping("/join")
    public String join(@RequestBody User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles("ROLE_USER");
        userRepository.save(user);
        return "회원가입 완료";
    }

    @GetMapping("/api/v1/user")
    public String user(Authentication authentication) {
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
        User user = principalDetails.getUser();
        System.out.println("user = " + user);
        return "This is user~";
    }

    @GetMapping("/api/v1/manager")
    public String manager() {
        return "This is manager~";
    }

    @GetMapping("/api/v1/admin")
    public String admin() {
        return "This is admin~";
    }
}
