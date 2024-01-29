package com.spring.cinema.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private Integer id;
	private String username;
	private String password;
	private String name;
	private String email;
	private Boolean isAdmin;
	private LocalDateTime createdAt;
}