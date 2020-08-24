package org.pth.domain;

import lombok.Data;

@Data
public class AuthVO {
	private String email;
	private String auth;
	
	public AuthVO(String email, String auth) {
		this.email = email;
		this.auth = auth;
	}
	
	public AuthVO() {}
}
