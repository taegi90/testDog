<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board2.Board2VO"%>
<%
	Board2VO article = (Board2VO) request.getAttribute("vo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC게시판</title>
<script type="text/javascript">
	function modifyboard() {
		if (confirm("수정하시겠습니까?")){
			modifyform.submit();	
		}
		
	}
</script>
<style type="text/css">
#registForm {
	width: 500px;
	height: 600px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	width: 150px;
	background: orange;
}

.td_right {
	width: 300px;
	background: skyblue;
}

#commandCell {
	text-align: center;
}
</style>
</head>
<body>
	<!-- 게시판 답변 -->


	<section id="writeForm">
		<h2>게시판 글 수정하기</h2>
		<form action="update.do" method="post" name="modifyform">
			<input type="hidden" name="board_num" value="<%=article.getBoard_num()%>" /> 
			<input type="hidden" name="page" value="<%=request.getParameter("page")%>" />
			<table>
				<tr>
				<tr>
					<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
					<td class="td_right"><input type="text" name="board_name"
						id="BOARD_NAME" value="<%=article.getBoard_name()%>"/></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
					<td class="td_right"><input type="password" name="board_pass"
						id="BOARD_PASS" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
					<td class="td_right"><input type="text" name="board_subject"
						id="BOARD_SUBJECT" value="<%=article.getBoard_subject()%>" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
					<td><textarea name="board_content" id="BOARD_CONTENT"
							cols="40" rows="15" ><%=article.getBoard_content()%></textarea></td>
				</tr>
			</table>
			<section id="commandCell">
				<a href="javascript:modifyboard()">[수정]</a> &nbsp;&nbsp; <a
					href="javascript:history.go(-1)">[뒤로]</a>
			</section>
		</form>
	</section>
</body>
</html>