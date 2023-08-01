package test.com.messaging.model;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class MessagingVO {
 private int	mnum;
private String	sender;
private String 	receiver;
private DATE	mdate;
private String content;
}
