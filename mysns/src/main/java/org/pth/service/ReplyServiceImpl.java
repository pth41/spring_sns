package org.pth.service;

import java.util.List;

import org.pth.domain.ReplyVO;
import org.pth.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		log.info("Reply_register...."+vo);
		
		return mapper.insert(vo);
	}
	
	@Override
	public ReplyVO get(Long reply_no) {
		log.info("Reply_get...."+reply_no);
		
		return mapper.read(reply_no);
	}
	
	@Override
	public int modify(ReplyVO vo) {
		log.info("Reply_modify...."+vo);
		
		return mapper.update(vo);
	}
	
	@Override
	public int remove(Long reply_no) {
		log.info("Reply_remove...."+reply_no);
		
		return mapper.delete(reply_no);
	}
	
	@Override
	public List<ReplyVO> getList(Long post_no) {
		log.info("Reply_getList");
		
		return mapper.getList(post_no);
	}

}
