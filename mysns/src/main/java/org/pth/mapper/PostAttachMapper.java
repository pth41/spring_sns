package org.pth.mapper;

import java.util.List;

import org.pth.domain.PostAttachVO;

public interface PostAttachMapper {
	
	public void insert(PostAttachVO vo);
	
	public void delete(String uuid);
	
	public List<PostAttachVO> findByPostNo(Long post_no);
}
