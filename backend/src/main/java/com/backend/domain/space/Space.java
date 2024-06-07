package com.backend.domain.space;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Space {
    private int id;
    private String name;
    private String description;
    private String address;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
