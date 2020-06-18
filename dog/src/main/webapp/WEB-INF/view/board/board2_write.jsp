<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC게시판</title>
<style type="text/css">
#registForm{
	width:500px;
	height:610px;
	border:1px solid red;
	margin:auto;
} 

h2{
	text-align:center;
	}
	
table{
	margin:auto;
	width:450px;
	}
.td_left{
	width:150px;
	background: skyblue;
}

#commandCell{
	text-align:center;
}
</style>
</head>
<body>
	<!-- 게시판 등록 -->
	<section id="writeForm">
	<h2>게시판글등록</h2>
	<!-- action:전송위치(생략 자신페이지), method:전송방법(생략 겟방식), enctype:파일첨부필요(생략 파일첨부안함) -->
	<form action="insert.do" method="post" enctype="multipart/form-data" name="boardForm">
	<table>
	<tr>
	<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
	<td class="td_right"><input type="text" name="board_name" id="BOARD_NAME" required="required" /></td>
	</tr>
	<tr>
	<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
	<td class="td_right"><input type="password" name="board_pass" id="BOARD_PASS" required="required" /></td>
	</tr>
	<tr>
	<td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
	<td class="td_right"><input type="text" name="board_subject" id="BOARD_SUBJECT" required="required" /></td>
	</tr>
	<tr>
	<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
	<td> <textarea id="BOARD_CONTENT" name="board_content" cols="40" rows="15" required="required"></textarea></td>
	</tr>
	<tr>
	<td class="td_left"><label for="BOARD_FILE">파일 첨부</label></td>
	<td class="td_right"><input name="board_file_frm" type="file" id= "BOARD_FILE" required="required" /></td>
	</tr>
	</table>
	<section id="commandCell">
		<input type="submit" value="등록">&nbsp;&nbsp;
		<input type="reset" value="다시쓰기"/>
			</section>
	</form>
	</section>
</body>
</html>