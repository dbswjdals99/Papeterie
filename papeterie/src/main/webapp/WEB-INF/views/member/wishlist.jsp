<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 찜목록</title>
<link rel="stylesheet" href="/papeterie/resources/css/style.css">
<link rel="stylesheet" href="/papeterie/resources/css/member.css">
<link rel="stylesheet" href="/papeterie/resources/css/wishlist.css?var=1">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/papeterie/resources/js/member.js"></script>
<script>
</script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
		
		<div id="content">
			<div  id="wisi-head">찜목록</div>
			<BR>
			<table id="">
				<tr>
					<th width="60">번호</th>
					<th width="400">상품정보</th>
					<th width="100">상품금액</th>
					<th width="60">삭제</th>
				</tr>
				<c:if test="${wlist.size() == 0 }">
					<tr>
						<td align="center" colspan="4"><img src="/papeterie/resources/img/empty.png" width="300"></td>
					</tr>
				</c:if>
				<c:forEach items="${wlist}" var="wvo">
				<c:set var="i" value="${i + 1}"></c:set>
				<tr>
					<td align="center">${i}</td>
					<td>
						<a href="/papeterie/goods/goods_view?pcode=${wvo.pcode}" style="color:black;" id="goods-title"><img id="goods_img" src="${wvo.img}"> &nbsp; ${wvo.title}</a>
						<a href="/papeterie/goods/goods_view?pcode=${wvo.pcode}" target="_blank"><img src="/papeterie/resources/img/ic_open_in_new_24px.svg" alt="새창으로 열기" title="새창으로 열기"></a>
					</td>
					<td align="center"><fmt:formatNumber value="${wvo.price}"/> 원</td>
					<td align="center">
						<a href="del_wishlist?idx=${wvo.idx}"><img src="/papeterie/resources/img/ic_delete.svg" alt="삭제" title="삭제"></a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>	<!-- id="content" -->
		


	</div>	<!-- id="section" -->
</body>
</html>