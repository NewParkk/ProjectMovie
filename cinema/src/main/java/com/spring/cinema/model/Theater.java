package com.spring.cinema.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Theater {
    private  int theaterId;
    private  String theaterLoc;
	private float lat;
	private float lon;
}
