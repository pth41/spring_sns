package org.pth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {
	private Long post_no;
	private Long user_no;	//�ۼ���
	private String content;
	private Date regDate;
	private Date modDate;
	private String img_filename;
}
