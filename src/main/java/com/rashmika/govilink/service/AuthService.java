package com.rashmika.govilink.service;

import com.rashmika.govilink.dto.LoginRequest;
import com.rashmika.govilink.dto.LoginResponse;
import com.rashmika.govilink.entity.User;
import com.rashmika.govilink.exception.AuthenticationException;
import com.rashmika.govilink.repository.UserRepository;
import com.rashmika.govilink.security.UserPrincipal;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public LoginResponse login(LoginRequest request){
        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(()->new AuthenticationException("Invalid email"));

        if (passwordEncoder.matches(request.getPassword(),user.getPasswordHash())){
            throw new AuthenticationException("Invalid password");
        }

        UserPrincipal principal = UserPrincipal.create(user);
        String token = UUID.randomUUID().toString();

        return LoginResponse.builder()
                .token(token)
                .userId(user.getId())
                .email(user.getEmail())
                .name(user.getName())
                .role(user.getRole().name())
                .build();
    }

}
