package com.backend.domain.member;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    private String role; // ENUM('USER', 'ADMIN', 'HOST')이므로 String으로 정의합니다.
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // Getters and Setters
}