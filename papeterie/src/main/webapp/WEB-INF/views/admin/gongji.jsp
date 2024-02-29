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
<script>
function delete_ok(my)
{
	if(!confirm("정말로 삭제하시겠습니까?"))
	{
		
	}
	else
	{
		location="/papeterie/gongji/delete?id="+my;
	}
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
	<span id="content-head-text">Notice Management</span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th width="30">번호</th>
				<th>이름</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
				<th width="150">상세 &nbsp;/&nbsp; 수정 &nbsp;/&nbsp; 삭제</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="gvo" varStatus="status">
            <tr>
                <td align="center">${fn:length(list) - status.index}</td>
                <td align="center">${gvo.name}</td>
				<td>${gvo.title}</td>
				<td align="center">${gvo.readnum}명</td>
				<td align="center">${gvo.writeday}</td>
				<td align="center">
					<box-icon class="box" name='link-external' size="md" onclick="location='/papeterie/gongji/content?id=${gvo.id}'" style="cursor:pointer;"></box-icon> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<box-icon class="box" type='solid' name='receipt' size="md" onclick="location='/papeterie/gongji/update?id=${gvo.id}'" style="cursor:pointer;"></box-icon> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<box-icon class="box" type='solid' name='trash' size="md" onclick="delete_ok(${gvo.id})" style="cursor:pointer;"></box-icon>
				</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div><input type="button" value="공지사항 작성" id="content-btn" onclick="location='/papeterie/gongji/write'"></div>
</div>
</body>
</html>