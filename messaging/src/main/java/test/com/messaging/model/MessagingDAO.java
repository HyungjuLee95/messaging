package test.com.messaging.model;

import java.util.List;

public interface MessagingDAO {
	public List<MessagingVO> selectAll(MessagingVO vo);
	public List<MessagingVO> sender_selectAll(MessagingVO vo);
	public List<MessagingVO> receiver_selectAll(MessagingVO vo);
	
	public int inset(MessagingVO vo);
	public int delete(MessagingVO vo);
	

}
