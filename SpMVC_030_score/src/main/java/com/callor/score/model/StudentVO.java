package com.callor.score.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class StudentVO {

	private String st_num; // char(8) primary key,
	private String 	st_name; //  varchar(20) not null,
	private String st_dept; //  varchar(20) not null,
	private int st_grade; //  int not null,
	private String st_tel; //  varchar(15) not null,
	private String st_addr; //  varchar(125)
}
