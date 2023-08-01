package test.com.messaging.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import test.com.messaging.model.MessagingDAO;
import test.com.messaging.model.MessagingVO;


@Service
@Slf4j
public class MessagingService {
	
	@Autowired
	MessagingDAO dao;
	
	public List<MessagingVO> selectAll(MessagingVO vo) {
		log.info("...{}", vo);
		return dao.selectAll(vo);
	}

	public List<MessagingVO> sender_selectAll(MessagingVO vo) {
		log.info("...{}", vo);
		return dao.sender_selectAll(vo);
	}

	public List<MessagingVO> receiver_selectAll(MessagingVO vo) {
		log.info("...{}", vo);
		return dao.receiver_selectAll(vo);
	}

}
