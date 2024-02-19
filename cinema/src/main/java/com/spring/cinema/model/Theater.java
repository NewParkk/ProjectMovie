package com.spring.cinema.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Theater {
    private  int theaterId;
    private  int movieId;
    private  String theaterLoc;
    private  int theaterLocDetail;
}
