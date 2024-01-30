package com.spring.cinema.model;

import java.util.Date;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ScreenInfo {
	
	private int screenInfoId;
	private int theaterId;
	private Date screenInfoDate;
	private Date screenInfoTime;
	
	@Builder
	public ScreenInfo(int screenInfoId, int theaterId, Date screenInfoDate, Date screenInfoTime) {
		this.screenInfoId = screenInfoId;
		this.theaterId = theaterId;
		this.screenInfoDate = screenInfoDate;
		this.screenInfoTime = screenInfoTime;
	}
	
}
