<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 주문상세보기</title>
<link rel="stylesheet" href="/papeterie/resources/css/style.css">
<link rel="stylesheet" href="/papeterie/resources/css/member.css">
<link rel="stylesheet" href="/papeterie/resources/css/mypage.css">
<script src="/papeterie/resources/js/mypage.js"></script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
 		
		<div id="content">
			<div style="margin-left: 20px; margin-top: 20px; display: block; font-weight:bold; font-size:18px;">상세보기</div>
			
 			<form name="frmPopup">
			<input type="hidden" name="pcode">
			<input type="hidden" name="order_code">
			</form>
			
			<div>
				<div style="width:700px;margin-left:20px;margin-top:20px;border-top:1px solid black;padding-top:20px;"><span class="orderContent" style="margin-right:310px;">배송지 정보</span> <span class="orderContent">결제방법</span></div>
				<div id="dd_left">
					받으시는분 <strong>${avo.rname}</strong><br>
					(${avo.zip})<br>${avo.addr1} ${avo.addr2}
				</div>
				<div id="dd_right" style="margin-bottom:60px;">
					<c:choose>
						<c:when test="${ovo.pay_type == 1}">
						신용카드<br>	<!-- 신한, 우리, 농협, 하나 : 일시불, 1, 2, 3, 4개월 -->
							<c:if test="${ovo.card == 1}">신한카드</c:if>
							<c:if test="${ovo.card == 2}">우리카드</c:if>
							<c:if test="${ovo.card == 3}">농협카드</c:if>
							<c:if test="${ovo.card == 4}">하나카드</c:if>
							<c:if test="${ovo.halbu == 0}">일시불</c:if>
							<c:if test="${ovo.halbu != 0}"> : ${ovo.halbu} 개월</c:if>
						</c:when>
						<c:when test="${ovo.pay_type == 2}">
						간편결재<br>	<!-- skt, kt, lg, 알뜰 : 폰번호 -->
							<c:if test="${ovo.com == 1}">SKT</c:if>
							<c:if test="${ovo.com == 2}">KT</c:if>
							<c:if test="${ovo.com == 3}">LG</c:if>
							<c:if test="${ovo.com == 4}">알뜰폰</c:if>
							 : ${ovo.phone}
						</c:when>
						<c:otherwise>
						계좌이체<br>	<!-- 신한, 우리, 농협, 하나  -->
							<c:if test="${ovo.bank == 1}">신한은행</c:if>
							<c:if test="${ovo.bank == 2}">우리은행</c:if>
							<c:if test="${ovo.bank == 3}">농협은행</c:if>
							<c:if test="${ovo.bank == 4}">하나은행</c:if>
						</c:otherwise>
					</c:choose> 
				</div>

				<table class="orderITEM">
					<c:set var="i" value="0" scope="page"></c:set>
					<c:forEach items="${olist}" var="mvo">
					<c:if test="${i == 0}">
					<tr>
						<td class="td1"><div class="orderNO"><strong>주문번호 &nbsp; : &nbsp; ${mvo.order_code}</strong></div></td>
						<td class="td3" colspan="2"><div class="orderDATE">주문일시 : ${mvo.regdate}</div></td>
					</tr>
					<c:set var="i" value="${i + 1}"></c:set>
					</c:if>
					<tr>
						<td class="td2" colspan="2"><div class="item_desc"><img src="${mvo.img}" width="35"> &nbsp; <span>${mvo.title}</span></div></td>
						<td>
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
									배송중
									<input type="button" value="배송확인" onclick="open_pop('${mvo.pcode}')">
									</c:when>
									<c:when test="${mvo.state == 6}">
									배송완료
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