<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<style>
table {
	margin:auto;
	width:400px;
	border:1px solid gray;
	text-align:center;
}
.td_title {
	font-weight:bold;
	font-size:x-large;
}
</style>
<script>
	function join() {
		if ($("#id").val().trim() == "") {
			alert("아이디를 입력해 주세요");
			$("#id").focus();
			return false;
		}
		var con = true;
		var data = $("#joinform").serialize();
		console.log(data);
		$.ajax({
			url : "/dog/user/idCheck.do",
			data : {id:$("#id").val()},
			type : "POST",
			async : false,
			success : function(data) {
				//console.log(data);
				if (data.trim() == "0") {
				} else {
					alert("중복된 아이디입니다.");
					$("#id").val("");
					$("#id").focus();
					con = false;
				}
			}
		});
		if (con == false) {
			return false;
		}
		if ($("#password").val().trim() == "") {
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		}
		if ($("#name").val().trim() == "") {
			alert("이름을 입력해 주세요");
			$("#name").focus();
			return false;
		}
		if ($("#age").val().trim() == "") {
			alert("나이를 입력해 주세요");
			$("#age").focus();
			return false;
		}
		if ($("#email").val().trim() == "") {
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return false;
		}
		
		$("#joinform").submit();
	}
	
	$(function() {
		$("#duplicateCheck").click(function() {
			if ($("#id").val().trim() == "") {
				alert("아이디를 입력해 주세요");
			} else {
				$.ajax({
					url : "/dog/user/idCheck.do",
					data : {id:$("#id").val()},
					type : "POST",
					success : function(data) {
						//console.log(data);
						if (data.trim() == "0") {
							alert("사용 가능");
							$("#id").attr("readonly", "readonly");
						} else {
							alert("사용 불가");
						}
					}
				});
			}
		});
	});

</script>
</head>
<body>
<form name="joinform" id="joinform" action="joinProcess.do" method="post">
<table>
	<tr>
		<td colspan="2" class="td_title">
			회원가입 페이지
		</td>
	</tr>
	<tr>
		<td><label for="id">아이디 : </label></td>
		<td><input type="text" name="id" id="id"><input type="button" id="duplicateCheck" value="아이디 중복체크"></td>
	</tr>
	<tr>
		<td><label for="password">비밀번호 : </label></td>
		<td><input type="password" name="password" id="password"></td>
	</tr>
	<tr>
		<td><label for="name">이름 : </label></td>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<td><label for="age">나이 : </label></td>
		<td><input type="number" name="age" id="age"></td>
	</tr>
	<tr>
		<td><label for="gender1">성별 : </label></td>
		<td>
			<input type="radio" name="gender" value="1" checked id="gender1">남자
			<input type="radio" name="gender" value="2" id="gender2">여자
		</td>
	</tr>
	<tr>
		<td><label for="email">이메일주소 : </label></td>
		<td><input type="text" name="email" id="email"></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="javascript:join();">회원가입</a>
			&nbsp;
			<a href="javascript:joinform.reset();">다시작성</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>