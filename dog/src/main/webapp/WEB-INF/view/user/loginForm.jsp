<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%
String client_id = "QI9nhKdLYdgGZ21jz2ay";
String redirectURI = URLEncoder.encode("http://localhost:8080/naverCallback.jsp");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);

String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--부트 스트랩 관련 파일-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link rel="stylesheet" type="text/css" href="css/login/loginForm.css">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="js/login/loginFormScript.js"></script>
    <script>
    function loginWithNaver(){
    	window.open('<%=apiURL%>', '_blank', 'width=400, height=400,scrollbar=no,status=no');
	}
   
    $(function() {
	    $("#password").keyup(function(e){
	    	if(e.keyCode == 13)  $(".loginbutton").trigger("click");
	    });
   	});
    
    </script>
</head>
<body>

    <div class="wrap">
    <div class="header"></div>
    <div class="title">
	<span class="t1">
	<a href="/goMain.do" class="join-title">MINGO</a>
	</span>  
	<span class="t2">로그인</span>
	<p class="t3">MINGO에 오신것을 진심을 환영합니다.</p>    
     <div class="social_login">
     	<div class="login_area">
	        <div class="naver_login">
	            <a class="click" href="javascript:loginWithNaver()">
	            	<div class="join-person-persontitle" >
	                	<img src="/img/joinImg/naver.png"  id= naver_id_login width="50px" height="50px">
	                </div>
	            </a>
	        </div>
	       <div class="kakao_login">
	            <a class="click" href="javascript:loginWithKakao()">
	              <div class="join-person-persontitle">
	              	<img src="/img/joinImg/kakao.png" id= kakao_id_login width="50px" height="50px">
	              </div>
	          	</a>
	       </div> 
	    </div>
    </div>
 
	<form id="login" action = "/loginProcess.do" method="post">
        <div class="main">
            <label class="email1">
                <span class="email2">
                    아이디&nbsp;
                </span>
                    <div class="emailaddress">
                <input name="email" id="email" required autocomplete="new-password" 
                placeholder="이메일을 입력해주세요." class="emailaddress">    
                
                </div>
            </label>
        </div>
        <br>
       
        <div class="main">
                <label class="pass1">
                    <span class="pass2">
                       비밀번호&nbsp;
                    </span>
                    <div class="first-pass">
                       <div class="input-pass">
                       <input name="password" id="password" type="password" minlength="10" maxlength="20" 
                       required placeholder="비밀번호를 입력해주세요 " class="password">
                    </div>
                </div>
                </label>   
		</div>
		</form>
		<br>
		<br>
		
			<div class="button1-select">
	            <button type="button" class="loginbutton" onclick = "javascript:loginForm();">로그인</button>
	            <button type="button" class="joinbutton" onclick = "location.href='/join_step1.do'">회원가입</button>
	        </div>
	        <br>
	      <div class="find">
          		<a href="/findId_step1.do">아이디 찾기</a>&nbsp;| &nbsp;<a href="/findPwd_step1.do">비밀번호 찾기</a> | &nbsp;<a href="/adminLoginForm.do">관리자 로그인</a>
    		</div>  
			<div class="footer">
		        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
		    </div>
			</div>
		</div>
	
	
		
	
</body>
</html>