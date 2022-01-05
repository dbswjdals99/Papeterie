<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 완료</title>
<link rel="stylesheet" href="/resources/css/purchase_finish.css">
<script src="/resources/js/purchase_finish.js"></script>

</head>
<body>
	<div id="section">
		<span id="page_title">주문/결제 완료</span> <span id="page_sub">01장바구니 > 02주문서작성/결제 > <strong style="color:black;">03주문완료</strong></span>
		<hr>
	<div id="receipt">
		<div id="receipt_head">
			<img src="/resources/img/papeterie.png" id="receipt_logo"/><span>주문/결제 확인서</span>
		</div>
		<div id="receipt_middle">
		<div id="product_table">
			<ul>
				<li>주문번호 : ${ovo.order_code}</li>
				<li>
					결제수단 : ${pay_type}<br>
					<c:if test="${ovo.pay_type == 0}">
					&nbsp ↪ 은행 : ${bank} 계좌번호 : ****************
					</c:if>
					<c:if test="${ovo.pay_type == 1}">
					&nbsp ↪ 카드사 : ${card} - ${halbu}
					</c:if>
					<c:if test="${ovo.pay_type == 2}">
					&nbsp ↪ 통신사 : ${com} - 결제 번호 : ${ovo.phone}
					</c:if>
				</li>
				<li>주문날짜 : ${buydate}</li>
				<li>주문시간 : ${buytime}</li>
			</ul>
			<table>
				<tr>
					<th class="product_title">상 품 명</th>
					<th>상품 수량</th>
					<th class="product_price">상품 가격</th>
					<th class="product_total">상품 총 가격</th>
				</tr>
				<c:forEach items="${list}" var="pvo">
				<tr>
					<td class="product_title">
						<img src="${pvo.img}">
						${pvo.title}
					</td>
					<td class="product_count">${pvo.count}</td>
					<td><fmt:formatNumber value="${pvo.price}"/>원</td>
					<td>
						<fmt:formatNumber value="${pvo.price*pvo.count}"/>원<br>
						<span>+<fmt:formatNumber value="${(pvo.price*pvo.count)*0.1}"/>point</span>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td class="product_title">배송비</td>
					<td>&nbsp</td>
					<td>&nbsp</td>
					<td><fmt:formatNumber value="${ovo.ship_price}"/>원</td>
				</tr>
			</table>
		</div>
		<div class="total_price"> 
			총 주문/결제 금액 &nbsp&nbsp<strong><fmt:formatNumber value="${ovo.price+ovo.ship_price}"/>원</strong><br> 
			<span>총 적립 포인트 : +<fmt:formatNumber value="${(ovo.price)*0.1}"/>point</span>
		</div>
		</div>
		<div id="receipt_bottom">
			<a href="../main/index"><div class="bottom_link">메인화면</div></a>
			<a href="../member/mypage"><div class="bottom_link">마이페이지</div></a>
		</div>
	</div>
	</div>
</body>
</html>