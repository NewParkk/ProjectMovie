package com.spring.cinema.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Movie {
    private Integer movieId;
    private String movieName;
    private String movieStory;
    private String movieDate;
    private String movieImgUrl;

}