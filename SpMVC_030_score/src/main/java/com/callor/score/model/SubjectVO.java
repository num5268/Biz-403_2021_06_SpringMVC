package com.callor.score.model;

import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SubjectVO {
	private String sb_code; //	CHAR(4)		
	private String sb_name; //	VARCHAR(20)	
	private String sb_prof; //	VARCHAR(20)		

}
