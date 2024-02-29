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
 		
		<div id="content">
			<div id="review-head" style="display:inline-block;margin-bottom:20px;">상품문의</div>
			<div id="qna_write"><input type="button" value="상품 문의하기" id="qna_write_btn" onclick="location='/papeterie/qna/write'"></div>
			<BR>
			<table id="">
				<tr>
					<th width="150">문의날짜</th>
					<th width="150">카테고리</th>
					<th width="400">제목</th>
					<th width="100">문의상태</th>
				</tr>
				<c:if test="${list.size() == 0 }">
					<tr>
						<td align="center" colspan="4"><img src="/papeterie/resources/img/empty.png" width="300"></td>
					</tr>
				</c:if>
				<c:forEach items="${list}" var="qvo">
				<tr>
					<td>${qvo.writeday}</td>
					<td>
						<c:if test="${qvo.category == 1}">
							제품문의
						</c:if>
						<c:if test="${qvo.category == 2}">
							배송문의
						</c:if>
						<c:if test="${qvo.category == 3}">
							이벤트문의
						</c:if>
						<c:if test="${qvo.category == 4}">
							교환/반품/환불
						</c:if>
						<c:if test="${qvo.category == 5}">
							기타문의
						</c:if>
					</td>
					<td><a href="/papeterie/qna/content?id=${qvo.id}">${qvo.title}</a></td>
					<td>
						<c:if test="${qvo.dapbun == 1}">
							<span>답변완료</span>
						</c:if>
						<c:if test="${qvo.dapbun == 0}">
							<span style="color:gray;">답변대기</span>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>	<!-- id="content" -->
		


	</div>	<!-- id="section" -->
</body>
</html>