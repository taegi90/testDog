
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--test.equals는 안의값과 같다면 출력      그다음 객체 생성      set으로 받고       세션 셋 어트리뷰트는 "멤버",오브젝트 멤버를 씀 세션은 브라우져단위--%>
    <%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    if("test".equals(id)&& "test".equals(password)){
    	user.UserVO member= new user.UserVO(); 
    	
    	member.setId(id);
    	member.setPassword(password);
    	member.setName("홍길동");
    	member.setAge(22);
    	member.setGender(1);
    	session.setAttribute("member", member);
    	out.print("로그인 되었습니다.");
    }else {
    	out.print("아이디와 비밀번호를 확인해주세요.");
    }
    %>