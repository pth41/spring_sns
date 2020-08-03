package org.pth.mapper;

import org.pth.domain.PostVO;

public interface PostMapper {
	public int insert(PostVO vo);
	
	public PostVO read(Long post_no);
	
	public int delete(Long post_no);
	
	public int update(PostVO vo);
}
