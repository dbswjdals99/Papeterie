<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap.min.css">
<style>
.product-table{
width:1000px;
height:550px;
margin:auto;
margin-top:100px;
}

.table>tbody>tr>td{
padding-top:25px;
padding-left:20px;
}

.table>tbody>tr>th{
padding-top:28px;
text-align:center;
background:gray;
color:white;
height:80px;
}

.table td{
background:white;
}

.inputtext{
border:1px solid silver;
padding:5px;
padding-left:10px;
}

.inputsel{
border:1px solid silver;
height:32px;
}

#submit{
	width: 200px;
	height: 55px;
	border: 1px solid black;
	cursor: pointer;
	font-size: 18px;
	background: black;
	color: white;
	font-weight:bold;
	margin-top:55px;
	padding-top:5px;
}

#button{
	width: 200px;
	height: 55px;
	border: 1px solid silver;
	cursor: pointer;
	font-size: 18px;
	background: white;
	color: black;
	font-weight:bold;
	margin-top:55px;
	padding-top:5px;
}

input:focus {outline:none;}

select:focus {outline:none;}

</style>
</head>
<body>
<!-- 본문 내용 -->
<div id="content">
<div id="content-head">
	<span id="content-head-text">Product Update</span>
</div>
<div id="">
<form method="post" action="product_update_ok">

	<input type="hidden" name="idx" value="${qvo.idx}">

	<table class="table product-table">
		<tr>
			<th width="120">상품제목</th>
			<td><input type="text" name="title" class="inputtext" size="40" value="${qvo.title}"></td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td><input type="text" name="price" class="inputtext" size="5" value="${qvo.price}"> 원</td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td><input type="file" name="img"></td>
		</tr>
		<tr>
			<th>상품옵션</th>
			<td>
				<select class="inputsel">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
				개
			</td>
		</tr>
		<tr>
			<th>상품분류</th>
			<td>
				<select name="category" class="inputsel">
					<option value="p01" <c:if test="${qvo.category == 'p01'}">selected</c:if>>p01</option>
					<option value="p02" <c:if test="${qvo.category == 'p02'}">selected</c:if>>p02</option>
					<option value="p03">p03</option>
					<option value="p04">p04</option>
					<option value="p05">p05</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td>
				<input type="text" name="pcode" class="inputtext" size="5" value="${qvo.pcode}">
			</td>
		</tr>
		<tr>
			<th>상품상세정보</th>
			<td><input type="file" name="content"></td>
		</tr>
		<tr>
			<th>품절</th>
			<td>
				<input type="radio" name="sold" value="-1" <c:if test="${qvo.option == '-1'}">checked</c:if>> <span>품절</span> &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="sold" value="0" <c:if test="${qvo.option == '0'}">checked</c:if>> <span>판매가능</span>
			</td>
		</tr>
	</table>
	<div align="center">
		<input type="button" value="이전" id="button" onclick="location='product'">
		<input type="submit" value="상품등록" id="submit">
	</div>
</form>
</div>
</div>
</body>
</html>