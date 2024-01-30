package com.spring.cinema.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class User {
	private Integer id;
	private String username;
	private String password;
	private String name;
	private String email;
	private Boolean isAdmin;
	private LocalDateTime createdAt;
	
	@Builder
	public User(Integer id, String username, String password, String name, String email, Boolean isAdmin,
			LocalDateTime createdAt) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.email = email;
		this.isAdmin = isAdmin;
		this.createdAt = createdAt;
	}
	
	
}