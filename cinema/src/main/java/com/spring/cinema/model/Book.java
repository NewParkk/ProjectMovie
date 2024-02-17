package com.spring.cinema.model;

import java.util.Date;

import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {
    private Integer movieBookingId;
    private String userId;
    private String movieName;
    private String theaterName;
    private String movieInfo;
    private Date movieInfoDate;
    private Date movieInfoTime;

}
