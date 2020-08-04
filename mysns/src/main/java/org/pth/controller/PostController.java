package org.pth.controller;

import org.pth.domain.PostVO;
import org.pth.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/posts/")
@RestController
@Log4j
@AllArgsConstructor
public class PostController {
	
	@Setter(onMethod_ = @Autowired)
	private PostService service;
	
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody PostVO vo) {
		log.info("PostVO: "+vo);
		
		int insertCount = service.register(vo);
		
		log.info("Post INSERT COUNT: "+insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{post_no}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<PostVO> get(@PathVariable("post_no") Long post_no) {
		log.info("post_get: "+post_no);
		
		return new ResponseEntity<>(service.get(post_no), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{post_no}",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("post_no") Long post_no) {
		log.info("user_remove: "+post_no);
		
		return service.remove(post_no) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{post_no}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody PostVO vo, @PathVariable("post_no") Long post_no) {
		vo.setUser_no(post_no);
		log.info("post_no: "+post_no);
		log.info("post_modify: "+vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
