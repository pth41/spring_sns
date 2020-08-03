package org.pth.service;

import org.pth.domain.PostVO;

public interface PostService {
	public int register(PostVO vo);
	
	public PostVO get(Long post_no);
	
	public int modify(PostVO vo);
	
	public int remove(Long post_no);
}
