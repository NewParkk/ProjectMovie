package com.spring.cinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.cinema.model.Theater;

@Mapper
public interface TheaterMapper {
    List<Theater> getAllTheaters();
    List<Theater> getTheatersByLocation(int locationId);
}
