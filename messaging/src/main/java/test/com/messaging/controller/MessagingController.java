package test.com.messaging.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import test.com.messaging.model.MessagingVO;
import test.com.messaging.service.MessagingService;

@Controller
@Slf4j
public class MessagingController {

	
	@Autowired
	MessagingService service;
	
	@ResponseBody
	@RequestMapping(value="/json_messaging_selectAll.do",method = RequestMethod.GET)
	public List<MessagingVO> json_messaging_selectAll(MessagingVO vo){
		List<MessagingVO> vos = service.selectAll(vo);
		log.info("vos....{}", vos);
		return vos;
	}
	
	@RequestMapping(value = "/message_InsertOK.do", method = RequestMethod.GET)
	public String message_InsertOK(MessagingVO vo) {
		System.out.println("insert vo : "+vo.toString());
	int result = service.inset(vo);
	return "redirect:home.do"; 
		
	}
}
