package org.pth.service;

import java.util.List;

import org.pth.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long reply_no);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long reply_no);
	
	public List<ReplyVO> getList(Long post_no);
	
	public int countReply(Long post_no);
}
