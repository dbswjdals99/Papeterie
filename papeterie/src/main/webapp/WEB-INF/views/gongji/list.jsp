<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/papeterie/resources/css/gongji.css">
</head>
<body>

<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> 공지사항 </h2>
	
	<!-- 리스트 목록 -->
	<table class="table list-table">
	<thead>
		<tr>
			<th width="100">번호</th>
			<th>제목</th>
			<th width="300">날짜</th>
			<th width="150">작성자</th>
		</tr>
	</thead>
		<c:forEach items="${list}" var="gvo" varStatus="status">
		<tbody>
		<tr>
			<td class="list-center">${fn:length(list) - status.index}</td>
			<td><a class="list-title" href="readnum?id=${gvo.id}">${gvo.title}</a></td>
			<td class="list-center">${gvo.writeday}</td>
			<td class="list-center">${gvo.name}</td>
		</tr>
		</tbody>
		</c:forEach>
	</table>
	
	<!-- 유저아이디가 관리자가 아닐시 글쓰기 버튼이 안나옴. -->
	<c:if test="${userid == 'admin'}">
		<div id="btn_text">
		  <button type="button" class="btn btn-light" onclick="location='write'">글쓰기</button>
		</div>
	</c:if>
</div>
</body>
</html>