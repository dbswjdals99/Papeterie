<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 리뷰</title>
<link rel="stylesheet" href="/papeterie/resources/css/style.css">
<link rel="stylesheet" href="/papeterie/resources/css/member.css">
<link rel="stylesheet" href="/papeterie/resources/css/review.css?var=1">
<script src="/papeterie/resources/js/member.js?var=2"></script>
<script>
</script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
		
		<form name="frmPopup">
		<input type="hidden" name="idx">
		</form>
		
		<div id="content">
			<div id="review-head">상품후기</div>
			<BR>
			<table id="">
				<tr>
					<th width="60">번호</th>
					<th width="100">별점</th>
					<th width="400">제목</th>
					<th width="100">삭제</th>
				</tr>
				<c:if test="${rlist.size() == 0 }">
					<tr>
						<td align="center" colspan="4"><img src="/papeterie/resources/img/empty.png" width="300"></td>
					</tr>
				</c:if>
				<c:forEach items="${rlist}" var="rvo">
				<c:set var="i" value="${i + 1}"></c:set>
				<tr>
					<td>${i}</td>
					<td>
						<c:choose>
							<c:when test="${rvo.score == 1}">★☆☆☆☆</c:when>
							<c:when test="${rvo.score == 2}">★★☆☆☆</c:when>
							<c:when test="${rvo.score == 3}">★★★☆☆</c:when>
							<c:when test="${rvo.score == 4}">★★★★☆</c:when>
							<c:when test="${rvo.score == 5}">★★★★★</c:when>
							<c:otherwise>☆☆☆☆☆</c:otherwise>
						</c:choose> 
					</td>
					<td>
						<c:if test="${rvo.filename != null }">
						<img src="${rvo.filename}" width="35">
						</c:if>
						<a href="javascript:;" onclick="updateopen('${rvo.idx}')" style="color:black;">${rvo.content}</a>
					</td>
					<td>
						<a href="javascript:;"><img src="/papeterie/resources/img/ic_delete.svg" alt="삭제" title="삭제" onclick="del_review('${rvo.idx}')"></a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>	<!-- id="content" -->
		


	</div>	<!-- id="section" -->
</body>
</html>