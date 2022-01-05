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
<script>
function state_chg(my,id)
{
	location="state_ok?state="+my+"&id="+id;	
}
</script>
<style>
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
	<span id="content-head-text">Porder Management</span>
	<span id="test"></span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th width="30" align="center">번호</th>
				<th style="text-align:left;">주문번호</th>
				<th>주문자</th>
				<th>상태</th>
				<th>주문일</th>
				<th width="30">삭제</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="ovo" varStatus="status">
            <tr>
                <td align="center">${fn:length(list) - status.index}</td>
				<td><a href="porder_content?idx=${ovo.idx}&ocode=${ovo.order_code}">${ovo.order_code}</a></td>
				<td align="center">${ovo.userid}</td>
				<td align="center">
					<select name="state" id="state" onchange="state_chg(this.value,${ovo.idx})">
						<option value="0" <c:if test="${ovo.state == 0}">selected</c:if>>주문 완료</option>
						<option value="1" <c:if test="${ovo.state == 1}">selected</c:if>>결제 완료</option>
						<option value="2" <c:if test="${ovo.state == 2}">selected</c:if>>입금 대기</option>
						<option value="3" <c:if test="${ovo.state == 3}">selected</c:if>>입금 확인</option>
						<option value="4" <c:if test="${ovo.state == 4}">selected</c:if>>상품 준비중</option>
						<option value="5" <c:if test="${ovo.state == 5}">selected</c:if>>배송중</option>
						<option value="6" <c:if test="${ovo.state == 6}">selected</c:if>>배송 완료</option>
					</select>
				</td>
				<td align="center">${ovo.regdate}</td>
				<td align="center">
					<box-icon class="box" type='solid' name='trash' size="md" onclick="location='porder_delete?idx=${ovo.idx}'" style="cursor:pointer;"></box-icon>
				</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>