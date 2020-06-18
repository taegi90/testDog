<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board2.Board2VO"%>
<%
Board2VO vo = (Board2VO) request.getAttribute("data");
String nowPage = (String) request.getAttribute("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC게시판</title>
<style type="text/css">
#articleForm {
	width: 500px;
	height: 500px;
	border: 1px solid;
	margin: auto;
}

h2 {
	text-align: center;
}

#basicInfoArea {
	height: 40;
	text-align: center;
}

#articleContentArea {
	background: orange;
	height: 350;
	text-align: center;
	margin: 20px;
	overflow: auto;
}

#commandList {
	margin: auto;
	width: 500px;
	text-align: center;
}
</style>
	
</head>
<body>
	<!-- 게시판수정 -->
	<section id="articleForm">
		<h2>글 내용 상세보기</h2>
		<section id="basicInfoArea">
			제목 :
			<%=vo.getBoard_subject()%>
			첨부파일 :
			<%
			if (!(vo.getBoard_file() == null)) {
		%>
			<a href="file_down?downFile=<%=vo.getBoard_file()%>"><%=vo.getBoard_file()%>
			</a>
			<%
				}
			%>

		</section>
		<section id="articleContentArea">
			<%=vo.getBoard_content()%>
		</section>
	</section>
	<section id="commandList">
		<a
			href="replyForm.do?board_num=<%=vo.getBoard_num()%>&page=<%=nowPage%>">[답변]</a>
		<a href="edit.do?board_num=<%=vo.getBoard_num()%>&page=<%=nowPage%>">[수정]</a>
		<a
			href="deleteForm.do?board_num=<%=vo.getBoard_num()%>&page=<%=nowPage%>">[삭제]</a>
		<a href="index.do?page=<%=nowPage%>">[목록]</a> &nbsp;&nbsp;
	</section>
</body>

</html>