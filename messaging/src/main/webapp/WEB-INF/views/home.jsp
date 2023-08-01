<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
        function longPolling() {
            $.ajax({
                url: "josn_message.do",
                type: "GET",

                success: function (mes) {
                    console.log('mes ajax successed...');
                    console.log('mes data vos:' , mes);
                    console.log(mes);
                    let tag_mes = '';
                    $.each(mes, function (index, mes_one) {
                        console.log('mes_one... ', mes_one);
                        tag_mes += `
                    <li>
                        <div class="note_title">
                            <strong>\${mes_one.sender}</strong>
                            <br>

                            <form action="message_deleteOK.do ">
                                <input type="hidden" name="num" value="\${mes_one.num}">

                                <button style="background-color: transparent;" type="submit">삭제하기</button>
                            </form>
                        </div>
                        <div style="border-bottom: 1px solid gray; width:50%;" class="note_content">
                            \${mes_one.content}
                        </div>
                        <div style="width:30%">
                            <input id="join_comments" style="height:83%; width:100%" type="text" name="content" placeholder="답장을 입력해주세요!">
                        </div>
 <form id="myForm" action="message_insertOK.do">
                                <input type="hidden" name="user_id" value="${user_id}">
                                <input type="hidden" name="receiver" value="\${mes_one.sender}">
                                <input type="hidden" name="sender" value="\${mes_one.receiver}">
                                <input  id="hidden_content_input" style="width:45%" type="hidden" name="content"  value="\${mes_one.content}">
                                <button style="background-color: transparent;" id="submitButton" type="submit">답장하기</button>
                            </form>
                        <div class="note_date">
                            \${mes_one.sending_date}
                        </div>
                    </li>`;
                    });



                                $('.mypage_grid03').html(tag_mes);



                                const submitButton = document.getElementById('submitButton');
                                const joinCommentsInput = document.getElementById('join_comments');
                                const hiddenContentInput = document.getElementById('hidden_content_input');

                                submitButton.addEventListener('click', function (event) {
                                    event.preventDefault();

                                    const inputTextValue = joinCommentsInput.value;
                                    console.log("inputTextValue: ", inputTextValue);

                                    hiddenContentInput.value = inputTextValue;
                                    console.log("hiddenContentInput.value: ", hiddenContentInput.value);

                                    document.getElementById('myForm').submit();
                                });

                                setTimeout(longPolling, 10000);
                            },
                            error: function (xhr, status, error) {
                                console.log('xhr.status:', xhr.status);
                                setTimeout(longPolling, 5000);
                            },
                        });
                    }

                    $(function () {
                        longPolling();
                    });
                    
<body>
	<h1>Hello world!</h1>

	<div>
		<form action="#">

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
