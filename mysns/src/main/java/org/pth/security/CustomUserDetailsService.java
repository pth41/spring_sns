package org.pth.security;

import org.pth.domain.UserVO;
import org.pth.mapper.UserMapper;
import org.pth.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = {@Autowired})
	private UserMapper userMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
		log.warn("Load User By UserEmail : "+userEmail);
		
		UserVO vo = userMapper.readByEmail(userEmail);
		
		log.warn("queried by user mapper: "+ vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
}
