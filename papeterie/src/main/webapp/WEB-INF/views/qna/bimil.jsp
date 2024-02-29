<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	String id = request.getParameter("id");
	String fail = request.getParameter("fail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/papeterie/resources/css/qna.css">
<script>
	window.onload = function(){
		if(<%=fail%>=="1")
		{
			document.getElementById("pwdfail").innerText="비밀번호가 일치하지 않습니다.";
			document.getElementById("pwdfail").style.color="red";
		}
	}
</script>
</head>
<body>
<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> Q&A </h2>
	
	<!-- 비밀글 창 -->
	<form method="post" action="bimil_ok">
	<input type="hidden" name="id" value="<%=id%>">
	<div id="bimil-h2">비밀글 보기</div>
	<div id="bimil-head">
		<div class="bimil-text">이 글은 비밀글입니다. 비밀번호를 입력하여 주세요.<br>
								관리자는 확인버튼만 누르시면 됩니다.</div>
		<div id="bimil-content">
		<span class="bimil-passowrd">password : </span> <input type="password" name="pwd" id="bimil-inputpwd"><br><br>
		<span id="pwdfail"></span><br>
			<c:if test="${userid != 'admin'}">
				<input type="submit" value="확인" id="bimil-sub">
			</c:if>
			<c:if test="${userid == 'admin'}">
				<input type="button" value="확인" id="bimil-sub" onclick="location='readnum?id=<%=id%>'">
			</c:if>
		</div>
	</div>
	</form>
</div>
</body>
</html>