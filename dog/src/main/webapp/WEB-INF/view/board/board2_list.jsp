<%@page import="board2.Board2VO"%>
<%@page import="util.Page"%>
<%@page import="java.util.List"%>
<%@page import="user.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int listcount = (Integer)request.getAttribute("listcount"); // 전체 갯수 (model에 저장한 "listcount")
List<Board2VO> list = (List<Board2VO>)request.getAttribute("list"); // 목록 (model에 저장한 "list")
Board2VO vo = (Board2VO)request.getAttribute("vo");	// vo객체 (model 저장한 "vo")
int totalpage = (Integer)request.getAttribute("totalpage"); // 전체페이지수 (model에 저장한 "totalpage")

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
#listForm {
	width:600px;
	border:1px solid red;
	margin:auto;
}
h2 {
	text-align:center;
}
table {
	margin : auto;
	width:600px;
}
#tr_top {
	background:orange;
	text-align:center;
}
#pageList {
	margin:auto;
	width:500px;
	text-align:center;
}
#emptyArea {
	margin:auto;
	width:500px;
	text-align:center;
}
</style>
</head>
<body>
<section id="listForm">
<%
UserVO session_member = (UserVO)session.getAttribute("member");
%>
<% if(session_member == null ){ %>
<a href="/dog/user/join.do">로그인</a>
<%} else { %>
<%=session_member.getName() %>님 반갑습니다.<a href="logout.jsp">로그아웃</a>
<% } %>

<h2>글목록<a href="write.do">게시판 글쓰기</a></h2>
<table>
	
	<tr id="tr_top">
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>날짜</td>
		<td>조회수</td>
	</tr>
<%
for (int i=0; i<list.size(); i++) {
%>	
	<tr>
		<td><%=list.get(i).getBoard_num() %></td>
		<td>
		<% for (int j=0; j<list.get(i).getBoard_re_lev(); j++) { %>
		&nbsp;&nbsp;  
		<% } %>
		 ▶ 
			<a href="view.do?board_num=<%=list.get(i).getBoard_num()%>&page=<%=vo.getPage()%>">
			<%=list.get(i).getBoard_subject() %>
			</a>
		</td>
		<td><%=list.get(i).getBoard_name() %></td>
		<td><%=list.get(i).getBoard_date() %></td>
		<td><%=list.get(i).getBoard_readcount() %></td>
	</tr>
<%
}
%>	
</table>
</section>
<%=Page.getPageList(vo.getPage(), totalpage, "index.do") %>

</body>
</html>