package com.spring.cinema.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;

import lombok.AllArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class User {

	private String userId;
	
	private String userName;
	
	private String userPassword;

	private Integer userBirth;
	
	private String  userGender;
	 
	private Boolean userAdmin;
	
	private String  userEmail;
}