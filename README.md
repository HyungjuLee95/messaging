# messaging
## 목표 쪽지 기능을 구현해보자.
1) Longpolling을 이용한 방식
2) 웹 소켓을 이용한 방식
   두 가지 방식으로 쪽지 혹은 채팅 기능을 구현
#[part 1. Longpolling을 이용하여 쪽지 기능 구현] <br>
-> 쪽지 기능이라고 칭한 이유는 사실상 LongPolling을 이용하여 이용자로 하여금 채팅처럼 보이게 할 순 있으나, 기존 생각하던 의도와 다르므로 쪽지 기능으로 칭함
<hr>
#공부한 내용

   1) 이용할 내용은 모두 웹브라우져 통신 방식이다.
      
      웹 브라우져 톨신 방식은 크게 polling, LongPolling, Server-sent-event, Streming, WebSocket이 있다.<br>
      
            이용해볼 방식은 LongPolling, webSocket.
         
      polling과 Longpolling 모두 사실상 client가 많아진다면 Server 부담이 커집니다. <br>
      
      어느 정도 시간의 간격을 주어 Polling과의 차별성을 주어 Polling 방식 보다는 서버의 부담이 비교적 덜한 방식으로 진행하려고 하였습니다.<br>


# 목표
  > 1) 유져 간에 쪽지를 보낼 경우, 1: 우선 웹소켓을 이용하지 않고, 롱폴링으로 유사 실시간 쪽지 기능을 구현<br>
   >   >      1-1) 쪽지 발송 및 답장 기능도 구현<br>
   >   >1-2) 쪽지의 내용을 DB에 담고 발송자와 수신자에 관련한 DB table 생성<br>
   
  > 2) 유져 간에 쪽지를 보낼 경우, 2: 웹소켓을 이용하여 실시간 쪽지 기능을 구현 or 웹소켓을 이용하여 간단한 채팅 기능 구현

#Messaging Repository에서는 1)의 경우를 코드로 구현해본다.

#생각할 것<br>
   1) DB 구성
   ```
DB의 경우에는 생각해보았을 때 <br>
[수신자, 발신자, 내용, 날짜 ]의 항목은 필수적으로 들어갈 것으로 판단
```
   2) 정보 전달 방삭 : Json으로 정보 전달

      #이제 코드를 구현해보자.
<hr>

#DB table 
```
CREATE TABLE MESSAGING 
(
  MNUM NUMBER NOT NULL 
, SENDER VARCHAR2(20 BYTE) NOT NULL 
, RECEIVER VARCHAR2(20 BYTE) NOT NULL 
, MDATE DATE DEFAULT sysdate NOT NULL 
, CONSTRAINT MESSAGING_PK PRIMARY KEY 
  (
    MNUM 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX MESSAGING_PK ON MESSAGING (MNUM ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

COMMENT ON COLUMN MESSAGING.MNUM IS '메시지 고유 번호';

COMMENT ON COLUMN MESSAGING.SENDER IS '발신자';

COMMENT ON COLUMN MESSAGING.RECEIVER IS '수신자';

COMMENT ON COLUMN MESSAGING.MDATE IS '수신 발신 시간
';

#sequence
CREATE SEQUENCE SEQ_MESSAGING INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;



```
      
      


