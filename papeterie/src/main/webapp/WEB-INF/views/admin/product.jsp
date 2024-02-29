<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap.min.css">
<style>
#content{
height:auto;
}

#product-btn-add{
	position:absolute;
	width: 100px;
	height: 35px;
	border: 1px solid silver;
	cursor: pointer;
	font-size: 12px;
	background: white;
	color: black;
	margin-bottom: 10px;
	font-weight:bold;
	left:700px;
	top:145px;
}

#soldout{
	font-size:12px;
	font-weight:bold;
	color:tomato;
}
</style>
<script>
function product_delete(my)
{
	if(!confirm("정말로 삭제하시겠습니까?"))
	{
	
	}
	else
	{
		location="product_delete?id="+my;	
	}
}
</script>
<style>
	#example td{
		padding-top:25px;
	}
	
	.sorting{
		text-align:center;
	}
	
	.box:hover{
		opacity:0.5;
	}
</style>
</head>
<body>
<!-- 본문 내용 -->
<div id="content">
<div id="content-head">
	<span id="content-head-text">Product Management</span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th width="30">번호</th>
				<th width="70" >상품이미지</th>
				<th>상품제목</th>
				<th width="60">상품가격</th>
				<th width="60">상품분류</th>
				<th width="60">상품번호</th>
				<th>상품등록일</th>
				<th width="150">상세 &nbsp;/&nbsp; 수정 &nbsp;/&nbsp; 삭제</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="gsvo" varStatus="status">
            <tr>
                <td align="center">${fn:length(list) - status.index}</td>
				<td align="center" style="padding-top:8px;"><img src="${gsvo.img}" width="50"></td>
				<td>
					${gsvo.title} &nbsp;
					<c:if test="${gsvo.option == '-1'}">
						<span id="soldout">(품절)</span>
					</c:if>
				</td>
				<td align="center">${gsvo.price} 원</td>
				<td align="center">${gsvo.category}</td>
				<td align="center">${gsvo.pcode}</td>
				<td align="center" style="padding-top:17px;">${gsvo.regdate}</td>
				<td align="center">
					<box-icon class="box" name='link-external' size="md" onclick="location='/papeterie/goods/goods_view?pcode=${gsvo.pcode}'" style="cursor:pointer;"></box-icon> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<box-icon class="box" type='solid' name='receipt' size="md" onclick="location='product_update?idx=${gsvo.idx}'" style="cursor:pointer;"></box-icon> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<box-icon class="box" type='solid' name='trash' size="md" onclick="product_delete(${gsvo.idx})" style="cursor:pointer;"></box-icon>
				</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div><input type="button" value="상품 추가" id="product-btn-add" onclick="location='/papeterie/admin/product_add'"></div>
</div>
</body>
</html>