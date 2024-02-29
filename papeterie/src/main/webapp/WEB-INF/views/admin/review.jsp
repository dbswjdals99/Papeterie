<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="/papeterie/resources/js/member.js?var=2"></script>
<style>
	td{
	text-align:center
	}

	.sorting{
	text-align:center;
	}
	
	#example td{
		padding-top:15px;
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
	<span id="content-head-text">Review Management</span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th width="30">번호</th>
				<th>주문번호</th>
				<th width="50">아이디</th>
				<th width="30">별점</th>
				<th>상품제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th width="80">수정 &nbsp;/&nbsp; 삭제</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="rvo" varStatus="status">
            <tr>
                <td>${fn:length(list) - status.index}</td>
				<td>${rvo.order_code}</td>
				<td>${rvo.userid}</td>
				<td>${rvo.score}점</td>
				<td style="text-align:left;padding-top:8px;"><img src="${rvo.img}" width="30"> &nbsp; ${rvo.title}</td>
				<td style="text-align:left;padding-top:8px;"><img src="${rvo.filename}" width="30"> &nbsp; ${rvo.content}</td>
				<td style="padding-top:8px;">${rvo.regdate}</td>
				<td>
					<box-icon class="box" type='solid' name='receipt' size="md" onclick="updateopen('${rvo.idx}')" style="cursor:pointer;"></box-icon> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<box-icon class="box" type='solid' name='trash' size="md" onclick="del_review('${rvo.idx}')" style="cursor:pointer;"></box-icon>
				</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
<form name="frmPopup">
		<input type="hidden" name="idx">
</form>
</body>
</html>