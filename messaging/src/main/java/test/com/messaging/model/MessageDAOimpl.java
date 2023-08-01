package test.com.messaging.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;


@Repository
@Slf4j
public class MessageDAOimpl implements MessagingDAO {

	@Autowired
	SqlSession sqlsession;
	
	
	@Override
	public List<MessagingVO> selectAll(MessagingVO vo) {
		log.info("...{}", vo);
		return sqlsession.selectList("M_SELECT_ALL", vo);
	}

	@Override
	public List<MessagingVO> sender_selectAll(MessagingVO vo) {
		log.info("...{}", vo);
		return null;
	}

	@Override
	public List<MessagingVO> receiver_selectAll(MessagingVO vo) {
		log.info("...{}", vo);
		return null;
	}

	@Override
	public int inset(MessagingVO vo) {
		log.info("inset...{}", vo);
		return sqlsession.insert("M_INSERT", vo);
	}

	@Override
	public int delete(MessagingVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
