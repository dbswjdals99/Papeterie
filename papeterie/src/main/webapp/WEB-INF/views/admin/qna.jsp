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
function qna_delete(my)
{
	if(!confirm("정말로 삭제하시겠습니까?"))
	{
		
	}
	else
	{
		location="../qna/delete?id="+my;
	}
}
</script>
<style>
	td{
	text-align:center;
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
	<span id="content-head-text">Q&A Management</span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th width="30">번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th width="50">조회수</th>
				<th>분류</th>
				<th>작성일</th>
				<th width="30">답변</th>
				<th width="150">상세 &nbsp;/&nbsp; 수정 &nbsp;/&nbsp; 삭제</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="qvo" varStatus="status">
        <c:if test="${qvo.bimil == 1}">
            <tr>
                <td>${fn:length(list) - status.index}</td>
				<td>${qvo.userid}</td>
				<td style="text-align:left;">${qvo.title}</td>
				<td>${qvo.readnum}명</td>
				<td>
					<c:if test="${qvo.category == 1}">
						제품문의
					</c:if>
					<c:if test="${qvo.category == 2}">
						배송문의
					</c:if>
					<c:if test="${qvo.category == 3}">
						이벤트문의
					</c:if>
					<c:if test="${qvo.category == 4}">
						교환/반품/환불
					</c:if>
					<c:if test="${qvo.category == 5}">
						기타문의
					</c:if>
				</td>
				<td>${qvo.writeday}</td>
				<td>
					<c:if test="${qvo.dapbun == 0}">
						<box-icon type='solid' name='comment-x' size="md" onclick="location='../qna/rewrite?id=${qvo.id}&grp=${qvo.grp}&seq=${qvo.seq}&dep=${qvo.dep}&pwd=${qvo.pwd}'" style="cursor:pointer;opacity:0.5; "></box-icon>
					</c:if>
					<c:if test="${qvo.dapbun == 1}">
						<box-icon name='comment-check' type='solid' size="md"></box-icon>
					</c:if>
				</td>
				<td>
					<box-icon class="box" name='link-external' size="md" onclick="location='../qna/content?id=${qvo.id}'" style="cursor:pointer;"></box-icon> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<box-icon class="box" type='solid' name='receipt' size="md" onclick="location='../qna/update?id=${qvo.id}'" style="cursor:pointer;"></box-icon> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<box-icon class="box" type='solid' name='trash' size="md" onclick="qna_delete(${qvo.id})" style="cursor:pointer;"></box-icon>
				</td>
            </tr>
        </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>