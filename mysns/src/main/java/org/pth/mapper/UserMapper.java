package org.pth.mapper;

import org.pth.domain.AuthVO;
import org.pth.domain.UserVO;

public interface UserMapper {
	public int insert(UserVO vo);
	
	public int insertAuth(AuthVO vo);
	
	public UserVO read(Long user_no);
	
	public UserVO readByEmail(String email);
	
	public int delete(Long user_no);
	
	public int update(UserVO vo);
	
	public int updatePwd(UserVO vo);
}
