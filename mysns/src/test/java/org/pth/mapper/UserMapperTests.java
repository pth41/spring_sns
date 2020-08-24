package org.pth.mapper;

import java.util.stream.IntStream;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.pth.domain.AuthVO;
import org.pth.domain.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class UserMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			UserVO vo = new UserVO();
			
			vo.setEmail("email-"+i);
			vo.setPassword("password-"+i);
			vo.setName("name-"+i);
			vo.setUsername("username-"+i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testInsertUser() {
		UserVO vo = new UserVO();
		
		vo.setName("테스터");
		vo.setUsername("테스터");
		vo.setEmail("tester");
		vo.setPassword(pwencoder.encode("1234"));
		
		mapper.insert(vo);
	}
	
	@Test
	public void testInsertAuth() {
		AuthVO vo = new AuthVO();
		
		vo.setEmail("qkrxogml");
		vo.setAuth("ROLE_USER");
		
		mapper.insertAuth(vo);
	}
	
	@Test
	public void testRead() {
		Long tergetUser_no = 23L;
		
		UserVO vo = mapper.read(tergetUser_no);
		
		log.info(vo);
	}
	
	@Test
	public void tesetReadByEmail() {
		String email = "tester";
		
		UserVO vo = mapper.readByEmail(email);
		
		log.info(vo);
		
		vo.getAuthList().forEach(authVO -> log.info(authVO));
	}
	
	@Test
	public void testDelete() {
		Long targetUser_no = 1L;
		
		mapper.delete(targetUser_no);
	}
	
	@Test
	public void testUpdate() {
		Long targerUser_no = 10L;
		
		UserVO vo = mapper.read(targerUser_no);
		
		vo.setName("Update Name ");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: "+count);
	}
}
