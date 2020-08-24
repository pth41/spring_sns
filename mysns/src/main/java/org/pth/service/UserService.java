package org.pth.service;

import org.pth.domain.UserVO;

public interface UserService {
	public int register(UserVO vo);
	
	public UserVO get(Long user_no);
	
	public UserVO getByEmail(String email);
	
	public int modify(UserVO vo);
	
	public int remove(Long user_no);
}
