<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/papeterie/resources/css/qna.css">
<script>
function delete_ok()
{
	if(!confirm("정말로 삭제하시겠습니까?"))
	{
		
	}
	else
	{
		location="delete?id=${qvo.id}"
	}
}
</script>
</head>
<body>

<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> Q&A</h2>
	
	<!-- 콘텐츠 내용 -->
	<table class="table content-table">
		<tr>
			<th colspan="2" id="content-title">${qvo.title}</th>
		</tr>
		<tr>
			<td><span class="content-bold">${qvo.name}</span> &nbsp;|&nbsp; ${qvo.writeday}</td>
			<td align="right"><span class="content-bold">조회수</span> : ${qvo.readnum}</td>
		</tr>
		<tr>
			<td colspan="2" height="400" id="content-content">${qvo.content}</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
	</table>
	
	
	<div id="btn_text">
		<c:if test="${userid == qvo.userid && userid != null || userid == 'admin'}">
			<input type="button" value="삭제" id="content-btn" onclick="delete_ok()">
			<input type="button" value="수정" id="content-btn" onclick="location='update?id=${qvo.id}'">
		</c:if>
		
		<!-- 유저아이디가 관리자이면 답변달기 버튼나옴. -->
		<c:if test="${userid == 'admin' }">
			<input type="button" value="답글작성" id="content-btn" onclick="location='rewrite?grp=${qvo.grp}&seq=${qvo.seq}&depth=${qvo.dep}&pwd=${qvo.pwd}&id=${qvo.id}'">
		</c:if>
		<input type="button" value="목록" id="content-btn" onclick="location='list'">
	</div>
</div>
</body>
</html>