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
<script>
	function pcode(my)
	{
		document.getElementById("pcode1").value = my;
	}
</script>
</head>
<body>
<!-- 본문 내용 -->
<div id="content">
<div id="content-head">
	<span id="content-head-text">Product Add</span>
</div>
<div id="">
<form method="post" action="product_add_ok" enctype="multipart/form-data">
	<table class="table product-table">
		<tr>
			<th width="120">상품제목</th>
			<td><input type="text" name="title" class="inputtext" size="40"></td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td><input type="text" name="price" class="inputtext" size="5"> 원</td>
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
				<select name="category" class="inputsel" onchange="pcode(this.value)">
					<option value="p01">p01</option>
					<option value="p02">p02</option>
					<option value="p03">p03</option>
					<option value="p04">p04</option>
					<option value="p05">p05</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>상품코드</th>
			<td>
				<select name="pcode1" id="pcode1" class="inputsel" style='background-color:white'onFocus='this.initialSelect = this.selectedIndex;'onChange='this.selectedIndex = this.initialSelect;'>
					<option value="p01">p01</option>
					<option value="p02">p02</option>
					<option value="p03">p03</option>
					<option value="p04">p04</option>
					<option value="p05">p05</option>
				</select>
				<input type="text" name="pcode2" class="inputtext" size="1">
				&nbsp; 상품번호의 숫자만 입력해주세요.
			</td>
		</tr>
		<tr>
			<th>상품상세정보</th>
			<td><input type="file" name="content"></td>
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