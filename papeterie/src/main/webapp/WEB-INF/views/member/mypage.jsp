<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - mypage</title>
<link rel="stylesheet" href="/papeterie/resources/css/style.css">
<link rel="stylesheet" href="/papeterie/resources/css/member.css">
<link rel="stylesheet" href="/papeterie/resources/css/mypage.css">
<script src="/papeterie/resources/js/mypage.js"></script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
 		
		<div id="content">
			<div id="order-head">전체주문내역</div>
			
 			<form name="frmPopup">
			<input type="hidden" name="pcode">
			<input type="hidden" name="order_code">
			</form>
			
			<div>
				<c:set var="prev_code" value="0" scope="page"></c:set>
				<table class="orderITEM" id="mypage-empty">
					<c:if test="${olist.size() == 0 }">
						<tr>
							<th style="border-top:1px solid black;">날짜/주문번호</th>
							<th style="border-top:1px solid black;">상품명/옵션</th>
							<th style="border-top:1px solid black;">상품금액/수량</th>
							<th style="border-top:1px solid black;">주문상태</th>
							<th style="border-top:1px solid black;">주문일시</th>
						</tr>
						<tr>
							<td align="center" colspan="5"><img src="/papeterie/resources/img/empty.png" width="300"></td>
						</tr>
					</c:if>
					<c:forEach items="${olist}" var="mvo">
					<c:if test="${prev_code != mvo.order_code}">
					<tr>
						<td class="td1">
							<div class="orderNO">
								<strong>주문번호 &nbsp; : &nbsp; 
									<a href="order_detail?order_code=${mvo.order_code}" id="orderDetail">${mvo.order_code}</a> &nbsp; 
									<span style="font-size:12px;">(클릭)</span>
								</strong>
							</div>
						</td>
						<td class="td3" colspan="2"><div class="orderDATE">주문일시 : ${mvo.regdate}</div></td>
					</tr>
					<c:set var="prev_code">${mvo.order_code}</c:set>
					</c:if>
					<tr>
						<td class="td2" colspan="2">
							<div class="item_desc">
								<a href="/papeterie/goods/goods_view?pcode=${mvo.pcode}" id="goods-title">
								<img src="${mvo.img}" width="35"> &nbsp; 
								<span>${mvo.title}</span>
								</a>
								<a href="/papeterie/goods/goods_view?pcode=${mvo.pcode}" target="_blank">
									<img src="/papeterie/resources/img/ic_open_in_new_24px.svg" alt="새창으로 열기" title="새창으로 열기">
								</a>
							</div>
						</td>
						<td style="padding-bottom:50px;">
							<div class="review_btn">
								<!-- 주문 상태 : 0 - 주문 완료, 1 - 결재완료, 2 - 입금대기, 3 - 입금확인, 4 - 상품준비중, 5 - 배송중, 6 - 배송완료 -->
								<c:choose>
									<c:when test="${mvo.state == 1}">
									결재완료
									</c:when>
									<c:when test="${mvo.state == 2}">
									입금대기
									</c:when>
									<c:when test="${mvo.state == 3}">
									입금확인
									</c:when>
									<c:when test="${mvo.state == 4}">
									상품준비중
									</c:when>
									<c:when test="${mvo.state == 5}">
									배송중<br>
									<input type="button" value="구매확정" onclick="deliver_ok('${mvo.order_code}')" id="confirm-btn">
									</c:when>
									<c:when test="${mvo.state == 6}">
									배송완료<br>
									<input type="button" value="리뷰쓰기" onclick="open_pop('${mvo.pcode}', '${mvo.order_code}')" id="review-btn">
									</c:when>
									<c:otherwise>
									주문완료 
									</c:otherwise>
								</c:choose> 
							</div>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
 		</div>	<!-- id="content" -->

	</div>	<!-- id="section" -->
</body>
</html>