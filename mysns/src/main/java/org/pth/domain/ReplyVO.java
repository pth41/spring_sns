package org.pth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long reply_no;
	private Long post_no;
	private Long user_no;
	private String username;
	private String reply_content;
	private Date regDate;
	private Date modDate;
}
