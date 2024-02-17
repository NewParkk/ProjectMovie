package com.spring.cinema.model;


import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class Theater {
    private final int theaterId;
    private final int movieId;
    private final String theaterLoc;
    private final int theaterLocDetail;
}
