package com.backend.domain.space;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class Room {
    private int id;
    private int spaceId;
    private int optionsId; // 필요시 Options 클래스와 연관관계 설정
    private String title;
    private String subtitle;
    private String description;
    private BigDecimal price;
    private int capacity;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    private List<RoomOptions> options;
}