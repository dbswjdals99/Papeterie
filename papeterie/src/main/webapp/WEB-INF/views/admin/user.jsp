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
<style>
	td{
	text-align:center;
	}
	.sorting{
	text-align:center;
	}
</style>
</head>
<body>
<!-- 본문 내용 -->
<div id="content">
<div id="content-head">
	<span id="content-head-text">User Management</span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th width="30">번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>포인트</th>
				<th>가입일</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="mvo" varStatus="status">
            <tr>
                <td >${fn:length(list) - status.index}</td>
				<td>${mvo.userid}</td>
				<td>${mvo.uname}</td>
				<td>${mvo.email}</td>
				<td>${mvo.phone}</td>
				<td>${mvo.spoint}</td>
				<td>${mvo.regdate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>