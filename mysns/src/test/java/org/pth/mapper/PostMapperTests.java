package org.pth.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.pth.domain.PostVO;
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
public class PostMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private PostMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCount() {
		String email = "test";
		
		int cnt = mapper.getCount(email);
		
		log.info("post count: "+cnt);
	}
	
	/*@Test
	public void testCreate() {
		Long tergetUser_no = 11L;
		PostVO vo = new PostVO();
		vo.setContent("새 글");
		vo.setUser_no(tergetUser_no);
		vo.setEmail("글쓴이");
		mapper.insert(vo);
		log.info(vo);
	}
	
	@Test
	public void testRead() {
		Long tergetPost_no = 21L;
		
		PostVO vo = mapper.read(tergetPost_no);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long tergetPost_no = 22L;
		
		mapper.delete(tergetPost_no);
	}
	
	@Test
	public void testUpdate() {
		Long tergetPost_no = 21L;
		
		PostVO vo = mapper.read(tergetPost_no);
		
		vo.setContent("Update Content");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: "+count);
	}*/
}
