package org.pth.mapper;

import org.pth.domain.ReplyVO;

public interface ReplyMapper {
	public int insert();
	
	public ReplyVO read(Long reply_no);
	
	public int delete(Long reply_no);
	
	public int update(ReplyVO vo);

}
