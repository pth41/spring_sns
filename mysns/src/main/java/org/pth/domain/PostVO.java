package org.pth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {
	private Long post_no;
	private Long user_no;	//ÀÛ¼ºÀÚ
	private String content;
	private Date regDate;
	private Date modDate;
	private String img_filename;
}
