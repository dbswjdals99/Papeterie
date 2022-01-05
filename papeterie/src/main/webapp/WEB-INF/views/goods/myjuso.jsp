<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주소 리스트</title>
<link rel="stylesheet" href="/resources/css/myjuso.css">
<script src="/resources/js/myjuso.js"></script>

</head>
<body>
	<div id="section">
	<div id="add" onclick="move_address()">배송지 관리</div>
	<h3>나의 주소록</h3>
		<c:set var="i" value="0"/>
		<c:forEach items="${list}" var="avo">
		<div class="juso">
		<input type="hidden" class="idx" value="${avo.idx}">
			<table>
				<tr>
					<td class="td_head">배송지명</td>
					<td class="addr_name">${avo.addr_name}</td>
				</tr>
				<tr>
					<td class="td_head">받는분</td>
					<td class="rname">${avo.rname}</td>
				</tr>
				<tr>
					<td class="td_head">연락처</td>
					<td class="phone">${avo.phone}</td>
				</tr>
				<tr>
					<td class="td_head">우편번호</td>
					<td class="zip">${avo.zip}</td>
				</tr>
				<tr>
					<td class="td_head">주소</td>
					<td class="addr1"><span>${avo.addr1}</span>-<span class="addr2">${avo.addr2}</span></td>
				</tr>
				<tr>
					<td class="td_head">수령방법</td>
					<td>
					<input type="hidden" class="soption" value="${avo.soption}">
					<c:if test="${avo.soption == 1}">
					직접수령
					</c:if>
					<c:if test="${avo.soption == 2}">
					배송 전 연락바랍니다
					</c:if>
					<c:if test="${avo.soption == 3}">
					부재시 경비실에 맡겨주세요
					</c:if>
					<c:if test="${avo.soption == 4}">
					부재시 문앞에 놓아주세요
					</c:if>
					<c:if test="${avo.soption == 5}">
					부재시 택배함에 넣어주세요
					</c:if>
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
					<span onclick="jundal(${i})" class="btn">선택</span>
					</td>
				</tr>
			</table>
		</div>
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
	</div>
</body>
</html>