package com.backend.domain.space;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class HostsSpacesRelationship {
    private int id;
    private int hostId;
    private int spaceId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}