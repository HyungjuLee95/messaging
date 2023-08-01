<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
         $.ajax({
            url: "json_messaging_selectAll.do", // json 목록 가져오기
            method: "GET",
            data: {  },
            dataType: "json",
            success: function(response) {
               console.log("ajax on");
               console.log("response", response);
               //불러온 항목 처리 및 가공, 출력(html에 추가)
            
               var html = "";

               for (var i = 0; i < response.length; i++) {
                   var vo = response[i]
                   if('${user_id}'==vo.sender){
                   console.log("vo[i]...{}", vo);
              

                   // 테이블에 행 추가
                   html += '<tr>';
                   html += '<td>' + vo.mnum + '</td>';
                   html += '<td>' + vo.sender + '</td>';
                   html += '<td>' + vo.receiver + '</td>';
                   html += '<td>' + vo.content + '</td>';
                   html += '<td>' + vo.mdate + '</td>';
                   html += '</tr>';
               }
               }

               // 기존의 테이블에 추가
               $(".ajax_area1 table").append(html);
             },
             error: function (xhr, status, error) {
               console.error(error);
             }
         });
   });
</script>


<script type="text/javascript">
   $(document).ready(function() {
         $.ajax({
            url: "json_messaging_selectAll.do", // json 목록 가져오기
            method: "GET",
            data: {  },
            dataType: "json",
            success: function(response) {
               console.log("ajax on");
               console.log("response", response);
               //불러온 항목 처리 및 가공, 출력(html에 추가)
            
               var html = "";

               for (var i = 0; i < response.length; i++) {
                   var vo = response[i]
                   if('${user_id}'==vo.receiver){
                   console.log("vo[i]...{}", vo);
              

                   // 테이블에 행 추가
                   html += '<tr>';
                   html += '<td>' + vo.mnum + '</td>';
                   html += '<td>' + vo.sender + '</td>';
                   html += '<td>' + vo.receiver + '</td>';
                   html += '<td>' + vo.content + '</td>';
                   html += '<td>' + vo.mdate + '</td>';
                   html += '</tr>';
               }
               }

               // 기존의 테이블에 추가
               $(".ajax_area2 table").append(html);
             },
             error: function (xhr, status, error) {
               console.error(error);
             }
         });
   });
</script>
<body>
<div>
	<form action = "message_InsertOK.do">
	<h3>아이디</h3>
	<c:if test="${user_id ne null }">
	</c:if>
			<input type="text" name="sender" readonly="readonly" value="${user_id}">
			<h3>수신자</h3>
			<input type="text" name="receiver" placeholder="수신자를 알려주세요.">
			<h3>쪽지</h3>
			<input type="text" name="content" placeholder="쪽지를 입력해주세요.">
			<a type = "submit" href="message_InsertOK.do" > 전송 </a>

	</form>
	
	
	<h3>수신함</h3>
	<div class="ajax_area1" >
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
	
	<h3>발신함</h3>
	<div class="ajax_area2" >
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

</div>

</body>
</html>