<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 
                    
<body>
	<h1>Hello world!</h1>

	<div>
		<form action="message_InsertOK.do">

			<h3>아이디</h3>
			<input type="text" name="sender" placeholder="당신의 아이디를 알려주세요.">
			<h3>수신자</h3>
			<input type="text" name="receiver" placeholder="수신자를 알려주세요.">
			<h3>쪽지</h3>
			<input type="text" name="message" placeholder="쪽지를 입력해주세요.">
			<button type="submit">전송</button>
		</form>

		<div>
			수신함
			<table border=1;>
				<tr>
					<td>발신자</td>
					<td>수신자</td>
					<td>내용</td>
					<td >날짜</td>
				</tr>
			</table>
		</div>
	</div>




</body>
</html>
