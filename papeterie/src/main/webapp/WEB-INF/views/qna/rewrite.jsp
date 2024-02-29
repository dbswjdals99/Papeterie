<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pwd = request.getParameter("pwd");
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/papeterie/resources/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/papeterie/resources/css/qna.css">
<script src="/papeterie/resources/js/qna.js"></script>
</head>
<body>

<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> 답변 작성 </h2>
	
	<!-- 작성 폼 -->
	<form method="post" action="rewrite_ok" name="rewrite">
		<input type="hidden" name="grp" value="${grp}">
		<input type="hidden" name="seq" value="${seq+1}">
		<input type="hidden" name="dep" value="${dep+1}">
		<input type="hidden" name="pwd" value="<%=pwd%>">
		<input type="hidden" name="id" value="<%=id%>">
	<table class="table table-center">
		<tr>
			<th width="150">작성자</th>
			<td>${uname}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" size="40"><span id="write-title"></span></td>
		</tr>
		<tr>
			<th style="padding-top:200px;">내용</th>
			<td>해당글은 비밀글로만 작성이 됩니다.<br><textarea name="content" id="summernote"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"> 
				<input type="button" value="이전" onclick="location='list'" id="write-btn">
				<input type="submit" value="저장" id="write-sub" onclick="return write_check()">
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>