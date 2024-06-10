package com.backend.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpaceMapper {

    @Insert("""
            """)
    void insert();
}
