package org.pth.service;

import org.pth.domain.AuthVO;
import org.pth.domain.UserVO;
import org.pth.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Override
	public int register(UserVO vo) {
		log.info("User_register...."+vo);
		
		vo.setPassword(pwencoder.encode(vo.getPassword())); //password encoder 처리
		
		int insertCount = mapper.insert(vo);
		
		if(insertCount == 1) {
			mapper.insertAuth(new AuthVO(vo.getEmail(), "ROLE_USER")); //계정에 권한 부여
		}
		
		return insertCount;
	}
	
	@Override
	public UserVO get(Long user_no) {
		log.info("User_get...."+user_no);
		
		return mapper.read(user_no);
	}
	
	@Override
	public UserVO getByEmail(String email) {
		log.info("User_getByEmail..."+email);
		
		return mapper.readByEmail(email);
	}
	
	@Override
	public int modify(UserVO vo) {
		log.info("User_modify...."+vo);
		
		int modifyCount = mapper.update(vo);
		
		return modifyCount;
	}
	
	@Override
	public int changePwd(UserVO vo) {
		log.info("User_modify...."+vo);
		
		vo.setPassword(pwencoder.encode(vo.getPassword())); //password encoder 처리
		
		int changePwdCount = mapper.updatePwd(vo);
		
		return changePwdCount;
	}
	
	@Override
	public int remove(Long user_no) {
		log.info("User_remove...."+user_no);
		
		return mapper.delete(user_no);
	}
}
