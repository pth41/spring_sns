package org.pth.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PostVO {
	private Long post_no;
	private Long user_no;
	private String email;
	private String content;
	private Date regDate;
	private Date modDate;
	
	private List<PostAttachVO> attachList;
}
