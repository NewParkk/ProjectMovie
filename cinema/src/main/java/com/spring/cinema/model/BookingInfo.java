package com.spring.cinema.model;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookingInfo {
    private String theaterLoc;
    private String movieName;
    private Date movieInfoDate;
    private String movieInfoTime;
}