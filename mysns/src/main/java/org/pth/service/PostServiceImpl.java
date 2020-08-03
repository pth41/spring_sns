package org.pth.service;

import org.pth.domain.PostVO;
import org.pth.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PostServiceImpl implements PostService {
	
	@Setter(onMethod_ = @Autowired)
	private PostMapper mapper;
	
	@Override
	public int register(PostVO vo) {
		log.info("Post_register...."+vo);
		
		return mapper.insert(vo);
	}
	
	@Override
	public PostVO get(Long post_no) {
		log.info("Post_get...."+post_no);
		
		return mapper.read(post_no);
	}
	
	@Override
	public int modify(PostVO vo) {
		log.info("Post_modify...."+vo);
		
		return mapper.update(vo);
	}
	
	@Override
	public int remove(Long post_no) {
		log.info("Post_remove...."+post_no);
		
		return mapper.delete(post_no);
	}
}
