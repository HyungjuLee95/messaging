package test.com.messaging.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	@Autowired
	HttpSession session;

	@ResponseBody
	@RequestMapping(value = "/json_messaging_selectAll.do", method = RequestMethod.GET)
	public List<MessagingVO> json_messaging_selectAll(MessagingVO vo, HttpSession session) {
		List<MessagingVO> vos = service.selectAll(vo);
		log.info("vos....{}", vos);
		return vos;
	}

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(MessagingVO vo, HttpSession session) {

		return "message";
	}

	@RequestMapping(value = "/connectOK.do", method = RequestMethod.GET)
	public String connectOK(MessagingVO vo) {
		log.info("vo...{}", vo);
		String sender = vo.getSender();
		session.setAttribute("user_id", sender);

		return "message";
	}

	@RequestMapping(value = "/message_InsertOK.do", method = RequestMethod.GET)
	public String message_InsertOK(MessagingVO vo) {
		log.info("vo", vo);
		String userid = (String) session.getAttribute("user_id");
		vo.setSender(userid);

		System.out.println("insert vo : " + vo.toString());
		int result = service.inset(vo);
		return "redirect:main.do?user_id=" + userid;

	}
	
	
	@RequestMapping(value = "/message_deleteOK.do", method = RequestMethod.POST)
	public String message_deleteOK(MessagingVO vo) {
		log.info("vo", vo);
		String userid = (String) session.getAttribute("user_id");
		vo.setSender(userid);

		System.out.println("delete vo : " + vo.toString());
		int result = service.delete(vo);
		return "redirect:main.do?user_id=" + userid;

	}
}
