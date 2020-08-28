package org.pth.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.pth.domain.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
			ReplyVO vo = new ReplyVO();
			
			Long tergetPost_no = 61L;
			Long tergetUser_no = 23L;
			
			vo.setPost_no(tergetPost_no);
			vo.setUser_no(tergetUser_no);
			vo.setEmail("tester");
			vo.setReply_content("reply mapper test");
			
			mapper.insert(vo);
	}
}
