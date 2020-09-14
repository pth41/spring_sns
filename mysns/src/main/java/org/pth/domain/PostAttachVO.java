package org.pth.domain;

import lombok.Data;

@Data
public class PostAttachVO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long post_no;
}
