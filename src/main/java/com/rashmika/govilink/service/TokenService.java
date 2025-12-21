package com.rashmika.govilink.service;

import com.rashmika.govilink.security.UserPrincipal;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class TokenService {
    private final Map<String, UserPrincipal> tokenStore = new ConcurrentHashMap<>();

    public String generateToken(UserPrincipal principal) {
        String token = UUID.randomUUID().toString();
        tokenStore.put(token, principal);
        return token;
    }

    public UserPrincipal validateToken(String token) {
        return tokenStore.get(token);
    }

    public void revokeToken(String token) {
        tokenStore.remove(token);
    }
}
