package org.pth.mapper;

import org.pth.domain.UserVO;

public interface UserMapper {
	public int insert(UserVO vo);
	
	public UserVO read(Long user_no);
	
	public int delete(Long user_no);
	
	public int update(UserVO vo);
}
