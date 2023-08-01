<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action = "message_InsertOK.do">
	<h3>아이디</h3>
			<input type="text" name="sender" placeholder="당신의 아이디를 알려주세요.">
			<h3>수신자</h3>
			<input type="text" name="receiver" placeholder="수신자를 알려주세요.">
			<h3>쪽지</h3>
			<input type="text" name="content" placeholder="쪽지를 입력해주세요.">
			<button type="submit">전송</button>

	</form>
	
	
	<h3>수신함</h3>
	<table border=1>
		<tr>
			<td> mnum</td>
			<td> sender</td>
			<td> receiver</td>
			<td> CONTENT</td>
			<td> mdate</td>
			
		</tr>
	</table>

</div>

</body>
</html>