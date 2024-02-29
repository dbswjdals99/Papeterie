<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/papeterie/resources/css/gongji.css">
<script>
function delete_ok()
{
	if(!confirm("정말로 삭제하시겠습니까?"))
	{
		
	}
	else
	{
		location="delete?id=${gvo.id}"
	}
}
</script>
</head>
<body>

<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> 공지사항 </h2>
	
	<!-- 콘텐츠 내용 -->
	<table class="table content-table">
		<tr>
			<th colspan="2" id="content-title">${gvo.title}</th>
		</tr>
		<tr>
			<td><span class="content-bold">${gvo.name}</span> &nbsp;|&nbsp; ${gvo.writeday}</td>
			<td align="right"><span class="content-bold">조회수</span> : ${gvo.readnum}</td>
		</tr>
		<tr>
			<td colspan="2" height="400" id="content-content">${gvo.content}</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
	</table>
	
	<!-- 유저아이디가 관리자가 아닐시 삭제, 수정버튼이 안나옴. -->
	<div id="btn_text">
		<c:if test="${userid == 'admin'}">
			<input type="button" value="삭제" id="content-btn" onclick="delete_ok()">
			<input type="button" value="수정" id="content-btn" onclick="location='update?id=${gvo.id}'">
		</c:if>
		<input type="button" value="목록" id="content-btn" onclick="location='list'">
	</div>
</div>
</body>
</html>