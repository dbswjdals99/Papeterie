<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 장바구니</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/cart.css">
<script src="/resources/js/cart.js"></script>
</head>
<body>

	<div id="section">
		
		<form action="cart_proc" method="post" id="cartFrm" name="cartFrm">
			<input type="hidden" name="mode" value="">
			<span>${cusername}</span><br>
			<span id="page_title">장바구니</span> <span id="page_sub"><strong>01장바구니 ></strong> 02주문서작성/결제 > 03주문완료</span>
			<hr>
			<div id="cart_table">
				<span><strong>장바구니 목록</strong></span>
				<table>
					<tr>
						<th id="goods_check"><input type="checkbox" id="allCheck" checked="checked"></th>
						<th id="goods_id">상품/옵션 정보</th>
						<th id="goods_default">수량</th>
						<th id="goods_default">상품금액</th>
						<th id="goods_discount">할인/적립</th>
						<th id="goods_default">합계 금액</th>
						<th id="goods_default">배송비</th>
					</tr>
					<c:forEach items="${list}" var="cvo">
						<c:set var="i" value="${i + 1}"></c:set>
					<tr>
						<td><input type="checkbox" name="cartchk" id="${cvo.pcode}" value="${cvo.idx}" checked="checked" onclick="calc_price()"></td>
						<td class="goods_id_td"><img id="goods_img" src="${cvo.img}"> ${cvo.title}</td>
						<td>
							<img alt="" src="/resources/img/ic_remove_circle_24px.svg" onclick="subitem('${cvo.idx}')" style="cursor:pointer;">
							<span id="itemcount">${cvo.count}</span> 개
							<img alt="" src="/resources/img/ic_add_circle_24px.svg" onclick="additem('${cvo.idx}')" style="cursor:pointer;">
						</td>
						<td><fmt:formatNumber value="${cvo.price}"/> 원</td>
						<td class="goods_td">10%포인트 적립</td>
						<td class="goods_td"><fmt:formatNumber value="${cvo.price * cvo.count}"/> 원</td>
						<c:if test="${i == 1}">
						<td class="goods_td" rowspan="${listsize}">2,500원</td>
						</c:if>
					</tr>
					</c:forEach>			
				</table>
			</div>
			<div id="goods_total_price">
				<div id="price_main">
					총 <span id="price_main_cnt"></span>개의 상품금액<br> <strong><span id="price_main_total"></span> 원</strong>
				</div>
				<div class="price_img">
					<img src="/resources/img/purchase_plus.png">
				</div>
				<div id="price_ship">
					배송비<br> <strong><span id="price_main_ship"></span> 원</strong>
				</div>
				<div class="price_img">
					<img src="/resources/img/purchase_right_arrow.png">
				</div>
				<div id="price_total">
					합계<br> <strong><span id="price_total_plus"></span> 원</strong>
				</div>
			</div>
	
			<div class="btn_order_box">
				<span class="btn_left_box">
					<button type="button" class="btn_order_choice_del btn-left" onclick="cart_process('cartDelete');">선택 상품 삭제</button>
					<c:if test="${userid == null}">
					<button type="button" class="btn_order_choice_wish btn-left" onclick="location='../member/login'">선택 상품 찜</button>
					</c:if>
					<c:if test="${userid != null}">
					<button type="button" class="btn_order_choice_wish btn-left" onclick="cart_process('cartToWish');">선택 상품 찜</button>
					</c:if>
				</span> <span class="btn_right_box">
					<button type="button" class="btn_order_choice_buy btn-right" onclick="cart_process('orderSelect');">선택 상품 주문</button>
					<button type="button" class="btn_order_whole_buy btn-right2" onclick="order_all();">전체 상품 주문</button>
				</span>
			</div>
		</form>
		
	</div>	<!-- <div id="section"> -->
</body>
</html>