<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
	String sql = "INSERT INTO notice(num, title, contents, name, reg_date) values(?, ?, ?,now()) ";
	PreparedStatement pstmt = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/board");
		conn = ds.getConnection();
		pstmt=conn.prepareStatement(sql);//미리 sql을 넣어주기만 함.

		
		
			pstmt.setString(1,request.getParameter("title"));//문자 String 숫자 Int (1,"test") 1은 ? 첫번째
			pstmt.setString(2,request.getParameter("contents"));
			pstmt.setString(3,request.getParameter("name"));
			
			pstmt.executeUpdate(); //실행
				//out.println("<h3>레코드를 등록하였습니다.</h3>");
			response.sendRedirect("index.jsp");
		
		}catch (Exception e){
			out.println("<h3>등록에 실패하였습니다.</h3>");
			e.printStackTrace();
	}
	finally{
		try{
			pstmt.close();
			conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>