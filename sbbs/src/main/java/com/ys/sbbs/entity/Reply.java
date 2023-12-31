package com.ys.sbbs.entity;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class Reply {
	private int rid;
	private String comment;
	private LocalDateTime regTime;
	private int isMine;
	private String uid;
	private int bid;
	private String uname;
	
	public Reply (String comment, int isMine, String uid, int bid) {
		this.comment = comment;
		this.isMine = isMine;
		this.uid = uid;
		this.bid = bid;
	}
	
}
