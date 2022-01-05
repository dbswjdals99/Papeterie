<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 배송지관리</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/member.js"></script>
<style>
#content th{
	font-size:14px;
	background:#f2f2f2;
	border-top:1px solid silver;
	border-bottom:1px solid silver;
	padding:14px;
}

#content td{
	font-size:14px;
	border-top:1px solid silver;
	border-bottom:1px solid silver;
	padding-left:20px;
}

#update-table{
	width:700px;
	margin-left:30px;
	margin-top:20px;
}

#update-head{
	width:700px;
	font-size:18px;
	font-weight:bold;	
	margin-left:30px;
	padding-bottom:20px;
	margin-top:20px;
}

input[type="text"]{
	border:1px solid silver;
	padding:5px;
	padding-left:10px;
}

input[type="password"]{
	border:1px solid silver;
	padding:5px;
	padding-left:10px;
}

input[type="submit"]{
	border:1px solid black;
	background:black;
	color:white;
	width:150px;
	height:40px;
	font-weight:bold;
	font-size:16px;
	cursor:pointer;
}

input[type="button"]{
	border:1px solid silver;
	background:white;
	color:black;
	width:150px;
	height:40px;
	font-weight:bold;
	font-size:16px;
	cursor:pointer;
}

#pwd-btn{
	border:1px solid silver;
	background:white;
	color:black;
	width:150px;
	height:30px;
	font-weight:bold;
	font-size:16px;
	cursor:pointer;
}

#pwd-chg{
	display:none;
}

.pwd-text{
	font-weight:bold;
	font-size:14px;
}

.pwd-input{
	margin-bottom:5px;
	margin-left:20px;
}
</style>
<script>
function pwd_view()
{
	document.getElementById("pwd-chg").style.display="inline-block";
}
</script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
		
		<div id="content">
			<div id="update-head">회원정보 변경</div>
			<form method="post" action="member_update_ok" name="mem">
	
				<input type="hidden" name="pwd2" value="${mvo.pwd}">
				<input type="hidden" name="idx" value="${mvo.idx}">
				<table id="update-table">
					<tr>
						<th style="border-top:1px solid black;">아이디</th>
						<td style="border-top:1px solid black;">${mvo.userid}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="button" value="비밀번호 변경" id="pwd-btn" onclick="pwd_view()">&nbsp;&nbsp;&nbsp;
							<div id="pwd-chg">
								<span class="pwd-text">새 비밀번호 : </span><input type="password" name="pwd" class="pwd-input"> 
							</div>
						</td>
					</tr>
					<tr>
						<th width="200">이름</th>
						<td><input type="text" name="uname" value="${mvo.uname}" size="10">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="email" id="email" value="${mvo.email}">
						</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><input type="text" name="phone" value="${mvo.phone}">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" style="border-bottom:none;padding-top:20px;">
							<input type="button" value="이전" onclick="location='../main/index'">
							<input type="submit" value="정보수정">
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>	<!-- id="section" -->
</body>
</html>