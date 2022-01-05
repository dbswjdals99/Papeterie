<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>porder</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap.min.css">
<style>

.table{
width:600px;
margin:auto;
margin-top:50px;
}

.table>tbody>tr>td{
padding:10px;
padding-left:30px;
}

.table>tbody>tr>th{
text-align:center;
background:gray;
color:white;
padding:10px;
}

.table td{
background:white;
}

#porder-content-product{
display:inline-block;
width:300px;
margin-bottom:40px;
}

.porder-content-text{
text-align:center;
margin-bottom:5px;
}
</style>
</head>
<body>
<!-- 본문 내용 -->
<div id="content3">
<div id="content-head">
	<span id="content-head-text">Porder Content</span>
</div>
<div id="">
	<table class="table porder-content-table">
		<tr>
			<th width="100">주문번호</th>
			<td>${ovo.order_code}</td>
		</tr>
		<tr>
			<th>주문자</th>
			<td>${ovo.userid}</td>
		</tr>
		<tr>
			<th>주문상품</th>
			<td align="center" style="padding:50px;">
				<c:forEach items="${list}" var="gvo">
					<div id="porder-content-product">
						<div class="porder-content-text"><img src="${gvo.img}" width="100"></div>
						<div class="porder-content-text">${gvo.title}</div>
						<div class="porder-content-text">${gvo.price} 원</div>
					</div>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>배송비</th>
			<td>${ovo.ship_price}</td>
		</tr>
		<tr>
			<th>결제수단</th>
			<td>
				<c:if test="${ovo.pay_type == 0}">
					계좌이체
				</c:if>
				<c:if test="${ovo.pay_type == 1}">
					신용카드
				</c:if>
				<c:if test="${ovo.pay_type == 2}">
					간편결제
				</c:if>
			</td>
		</tr>
		<c:if test="${ovo.pay_type == 0}">
		<tr>
			<th>은행회사</th>
			<td>
				<c:if test="${ovo.bank == 1}">
					신한은행
				</c:if>
				<c:if test="${ovo.bank == 2}">
					우리은행
				</c:if>
				<c:if test="${ovo.bank == 3}">
					농협은행
				</c:if>
				<c:if test="${ovo.bank == 4}">
					하나은행
				</c:if>
			</td>
		</tr>
		</c:if>
		<c:if test="${ovo.pay_type == 1}">
		<tr>
			<th>카드회사</th>
			<td>
				<c:if test="${ovo.card == 1}">
					신한카드
				</c:if>
				<c:if test="${ovo.card == 2}">
					우리카드
				</c:if>
				<c:if test="${ovo.card == 3}">
					농협카드
				</c:if>
				<c:if test="${ovo.card == 4}">
					하나카드
				</c:if>
			</td>
		</tr>
		</c:if>
		<c:if test="${ovo.pay_type == 2}">
		<tr>
			<th>통신사</th>
			<td>
				<c:if test="${ovo.com == 1}">
					SKT
				</c:if>
				<c:if test="${ovo.com == 2}">
					KT
				</c:if>
				<c:if test="${ovo.com == 3}">
					LG
				</c:if>
				<c:if test="${ovo.com == 4}">
					알뜰통신
				</c:if>
			</td>
		</tr>
		</c:if>
		<c:if test="${ovo.pay_type == 2}">
		<tr>
			<th>휴대폰번호</th>
			<td>
				${ovo.phone }
			</td>
		</tr>
		</c:if>
		<tr>
			<th>배송지</th>
			<td>${ovo.addr1} ${ovo.addr2}</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>