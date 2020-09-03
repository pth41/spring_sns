package org.pth.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	private Long user_no;
	private String email;
	private String password;
	private String name;
	private String username;
	private String phoneNum;
	private String description;
	private Date regDate;
	private String img_filename;
	
	private boolean enabled;
	private List<AuthVO> authList;
}
