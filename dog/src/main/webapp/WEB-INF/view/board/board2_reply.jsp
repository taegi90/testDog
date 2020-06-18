<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import ="board2.*" %>
 <%
    Board2VO article = (Board2VO)request.getAttribute("data");
 Board2VO vo = (Board2VO)request.getAttribute("vo");
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC게시판</title>
<script language="javascript">
</script>
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
	width: 150px;
	background: orange;
	
	}
.td_right{
	width: 300px;
	background: skyblue;
	}
#commandCell{
	text-align:center;
	}
	
</style>
</head>
<body>
<!-- 게시판 답변 -->


	<section id="writeForm">
	<h2>게시판 답변등록하기</h2>
	<form action="replyProcess.do" method="post" name="boardform">
	<input type="hidden" name="page" value="<%=vo.getPage() %>"/>
	<input type="hidden" name="board_num" value="<%=article.getBoard_num() %>">
	<input type="hidden" name="board_re_ref" value="<%=article.getBoard_re_ref() %>">
	<input type="hidden" name="board_re_lev" value="<%=article.getBoard_re_lev() %>">
	<input type="hidden" name="board_re_seq" value="<%=article.getBoard_re_seq() %>">
	<table>
	<tr>
		<td class="td_left"><label for="BOARD_NAME">글쓴이</label></td>
		<td class="td_right"><input type="text" name="Board_name" id="BOARD_NAME" /></td>
		</tr>
		<tr>
		<td class="td_left"><label for="BOARD_PASS">비밀번호</label></td>
		<td class="td_right"><input type="password" name="Board_pass" id="BOARD_PASS" /></td>
		</tr>
		<tr>
		<td class="td_left"><label for="BOARD_SUBJECT">제목</label></td>
		<td class="td_right"><input type="text" name="Board_subject" id="BOARD_SUBJECT" value="re: <%=article.getBoard_subject()%>"/></td>
		</tr>
		<tr>
		<td class="td_left"><label for="BOARD_CONTENT">내용</label></td>
		<td><textarea name="Board_content" id="BOARD_CONTENT" cols="40" rows="15"></textarea></td>
		</tr>
		</table>
		<section id="commandCell">
		<input type="submit" value="답변글등록" /> &nbsp;&nbsp;
		<input type="reset" value="다시작성" />
		</section>
	
	</form>
	</section>
</body>
</html>