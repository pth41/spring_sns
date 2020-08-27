package org.pth.mapper;

import java.util.List;

import org.pth.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long reply_no);
	
	public int delete(Long reply_no);
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getList(Long post_no);
}
