package com.spring.cinema.service.impl;

import com.spring.cinema.mapper.TheaterMapper;
import com.spring.cinema.model.Theater;
import com.spring.cinema.service.user.TheaterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class TheaterServiceImpl implements TheaterService {

    private final TheaterMapper theaterMapper;

    @Autowired
    public TheaterServiceImpl(TheaterMapper theaterMapper) {
        this.theaterMapper = theaterMapper;
    }

    @Override
    public List<Theater> getAllTheaters() {
        try {
            return theaterMapper.getAllTheaters();
        } catch (Exception e) {
            e.printStackTrace(); 
            return Collections.emptyList(); 
        }
    }
}
