<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 배송지관리</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
<link rel="stylesheet" href="/resources/css/addressbook.css?var=2">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/member.js"></script>
<script>
</script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
		
		<div id="content">
			<div id="ship_add"><span id="ship-head">배송지 관리</span><input type="button" onclick="show_add()" value="+ 새 배송지 추가" id="ship-add-btn"></div>
			<table id="addlist_table">
				<tr>
					<th width="120">배송지이름</th>
					<th width="320">주소</th>
					<th width="130">연락처</th>
					<th width="80">받는 분</th>
					<th width="90">수정/삭제</th>
				</tr>
				<c:if test="${list.size() == 0 }">
					<tr>
						<td align="center" colspan="5"><img src="/resources/img/empty.png" width="300"></td>
					</tr>
				</c:if>
				<c:forEach items="${list}" var="avo">
				<tr>
					<td>
						<c:if test="${avo.sdefault == 1}">
						<img src="/resources/img/sdefault.svg" alt="기본 배송지">${avo.addr_name}
						</c:if>
						<c:if test="${avo.sdefault == 0}">
						${avo.addr_name}
						</c:if>
					</td>
					<td><p align="left">(${avo.zip})<br>${avo.addr1} ${avo.addr2}</p></td>
					<td>${avo.phone}</td>
					<td>${avo.rname}</td>
					<td>
						<img src="/resources/img/ic_desc.svg" alt="수정" title="수정" onclick="update_addr_fn(${avo.idx})" style="cursor:pointer;">
						<a href="del_addr?idx=${avo.idx}"><img src="/resources/img/ic_delete.svg" alt="삭제" title="삭제"></a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>	<!-- id="content" -->
		
		<div id="add_frm">
			<div id="add_head">나의 배송지 관리</div>
			<form action="add_ok" method="post" name="frm" id="frm">
				<div id="add_sub">배송지 등록</div>
				<table class="add_table">
					<tr>
						<th>배송지명</th>
						<td><input type="text" name="addr_name" id="a_addr_name" size="30"></td>
					</tr>
					<tr>
						<th>받는 분</th>
						<td><input type="text" name="rname" id="a_rname" size="30"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" name="zip" id="a_zip" size="5" readonly onclick="juso_search()"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="addr1" id="a_addr1" size="30" readonly onclick="juso_search()"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="text" name="addr2" id="a_addr2" size="30"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone" id="a_phone" size="30"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="checkbox" name="sdefault" id="a_sdefault" value="1"> 기본 배송지로 설정</td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td>
							<select id="a_soption" name="soption">
								<option value="0">배송 요청사항을 선택해 주세요</option>
								<option value="1">직접수령 하겠습니다</option>
								<option value="2">배송 전 연락바랍니다</option>
								<option value="3">부재 시 경비실에 맏겨주세요</option>
								<option value="4">부재 시 문앞에 놓아주세요</option>
								<option value="5">부재 시 택배함에 넣어주세요</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;padding-top:20px;border-bottom:none;">
							<input type="button" value="이전" style="width: 100px;" onclick="hide_add()">
							<input type="submit" value="저장" style="width: 100px;">
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="update_frm">
			<div id="add_head">나의 배송지 관리</div>
			<form action="update_ok" method="post" name="ufrm" id="ufrm">
				<input type="hidden" name="idx" id="u_idx" value="">
				<div id="add_sub">배송지 수정</div>
				<table class="add_table">
					<tr>
						<th>배송지명</th>
						<td><input type="text" name="addr_name" id="u_addr_name" size="30"></td>
					</tr>
					<tr>
						<th>받는 분</th>
						<td><input type="text" name="rname" id="u_rname" size="30"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" name="zip" id="u_zip" size="5" readonly onclick="juso_search()"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="addr1" id="u_addr1" size="30" readonly onclick="juso_search()"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="text" name="addr2" id="u_addr2" size="30"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone" id="u_phone" size="30"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="checkbox" name="sdefault" id="u_sdefault" value="1"> 기본 배송지로 설정</td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td>
							<select id="u_soption" name="soption">
								<option value="0">배송 요청사항을 선택해 주세요</option>
								<option value="1">직접수령 하겠습니다</option>
								<option value="2">배송 전 연락바랍니다</option>
								<option value="3">부재 시 경비실에 맏겨주세요</option>
								<option value="4">부재 시 문앞에 놓아주세요</option>
								<option value="5">부재 시 택배함에 넣어주세요</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;border-bottom:none;border-left:none;padding-top:20px;">
							<input type="button" value="이전" style="width: 100px;" onclick="hide_update()">
							<input type="submit" value="수정" style="width: 100px;">
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>	<!-- id="section" -->
</body>
</html>