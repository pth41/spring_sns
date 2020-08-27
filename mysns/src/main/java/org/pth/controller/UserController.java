package org.pth.controller;

import org.pth.domain.UserVO;
import org.pth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/users/")
@RestController
@Log4j
@AllArgsConstructor
public class UserController {
	
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	@GetMapping("/signup")
	public ModelAndView signup() throws Exception {
		return new ModelAndView("users/signup");
	}
	
	@GetMapping("/edit")
	public ModelAndView edit() throws Exception {
		return new ModelAndView("users/edit");
	}
	
	@GetMapping("/profile/*")
	public ModelAndView profile() throws Exception {
		return new ModelAndView("users/profile");
	}
	
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody UserVO vo) {
		log.info("UserVO: "+vo);
		
		int insertCount = service.register(vo);
		
		log.info("User INSERT COUNT: "+insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{user_no}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<UserVO> get(@PathVariable("user_no") Long user_no) {
		log.info("user_get: "+user_no);
		
		return new ResponseEntity<>(service.get(user_no), HttpStatus.OK);
	}
	
	@GetMapping(value = "/profiles/{email}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<UserVO> getByEmail(@PathVariable("email") String email) {
		log.info("user_getByEmail: "+email);
		
		return new ResponseEntity<>(service.getByEmail(email), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{user_no}",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("user_no") Long user_no) {
		log.info("user_remove: "+user_no);
		
		return service.remove(user_no) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{user_no}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody UserVO vo, @PathVariable("user_no") Long user_no) {
		vo.setUser_no(user_no);
		log.info("user_no: "+user_no);
		log.info("user_modify: "+vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
