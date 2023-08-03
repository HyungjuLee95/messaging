package test.com.messaging.model;

import java.sql.Date;

import lombok.Data;

@Data
public class MessagingVO {
 private int	mnum;
private String	sender;
private String 	receiver;
private Date	mdate;
private String content;
}
