<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "board2.Board2VO" %>
<%
   Board2VO vo = (Board2VO)request.getAttribute("vo");
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC게시판</title>
<style>

#passForm{
	width:500px;
	border:1px solid red;
	margin:auto;
}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	

function check(){
	if ($("#board_pass").val() == ""){
		alert("비밀번호를 입력해주세요");
		return false;
		}
	}

	function check2(){
		if ($("#board_pass").val() == ""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		$("#deleteForm").submit();
	}
</script>
</head>
<body>
<section id="passForm">
	<form name="delete.do" name="deleteForm"  method="post" id="deleteForm" onsubmit="return check();">
	<input type="hidden" name="page" value="<%=vo.getPage() %>"/>
	<input type="hidden" name="board_num" value="<%=vo.getBoard_num() %>" />
	<table>
	<tr>
		<td>
			<label>글 비밀번호 :</label>
		</td>
		<td>
		<input name="board_pass" type="password" id="BOARD_PASS">
		</td>
	</tr>
	<tr>
		<td>
		<input type="submit" value="삭제"/>
		&nbsp;&nbsp;
		<input type="submit" value="삭제" onClick="check2();"/>
		&nbsp;&nbsp;
		<input type="button" value="돌아가기" onClick="javascript:history.go(-1)"/>
		</td>
		</tr>
	</table>
	</form>
	</section>
</body>
</html>