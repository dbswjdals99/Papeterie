<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 리뷰(수정)</title>
<link rel="stylesheet" href="/papeterie/resources/css/style.css">
<link rel="stylesheet" href="/papeterie/resources/css/review.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/papeterie/resources/js/mypage.js"></script>
<script>
$(document).ready(function(){
}
</script>
</head>
<body>

<form name="frm" id="frm" action="update_ok" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pcode" value="${rvo.pcode}">
	<input type="hidden" name="order_code" value="${rvo.order_code}">
	<input type="hidden" name="userid" value="${userid}">
	<input type="hidden" name="idx" value="${rvo.idx}">
	<table id="review_write">
		<tr>
			<td><img id="goods_img" src="${rvo.img}"> ${rvo.title}</td>
		</tr>
		<tr>
			<td style="border:none;padding-top:20px;">상품은 만족하셨나요?</td>
		</tr>
		<tr>
			<td>
			    <fieldset>
					<c:choose>
						<c:when test="${rvo.score == 1}">
					        <input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
					        <input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
					        <input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
					        <input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
					        <input type="radio" name="score" value="1" id="rate5" checked><label for="rate5">★</label>
						</c:when>
						<c:when test="${rvo.score == 2}">
					        <input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
					        <input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
					        <input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
					        <input type="radio" name="score" value="2" id="rate4" checked><label for="rate4">★</label>
					        <input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
						</c:when>
						<c:when test="${rvo.score == 3}">
					        <input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
					        <input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
					        <input type="radio" name="score" value="3" id="rate3" checked><label for="rate3">★</label>
					        <input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
					        <input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
						</c:when>
						<c:when test="${rvo.score == 4}">
					        <input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
					        <input type="radio" name="score" value="4" id="rate2" checked><label for="rate2">★</label>
					        <input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
					        <input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
					        <input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
						</c:when>
						<c:when test="${rvo.score == 5}">
					        <input type="radio" name="score" value="5" id="rate1" checked><label for="rate1">★</label>
					        <input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
					        <input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
					        <input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
					        <input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
						</c:when>
						<c:otherwise>
				        <input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
				        <input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
				        <input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
				        <input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
				        <input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
						</c:otherwise>
					</c:choose> 
			    </fieldset>
				<div class="_3Q4AGAjnPM" style="padding-bottom:20px;">선택하세요.</div>
			</td>
		</tr>
		<tr>
			<td style="border:none;padding-top:20px;">어떤 점이 좋았나요?</td>
		</tr>
		<tr>
			<td style="padding-bottom:20px;"><textarea name="content" id="contenttext" rows="10" cols="40" >${rvo.content}</textarea></td>
		</tr>
		<tr>
			<td style="border:none;padding-top:20px;">사진 첨부하기</td>
		</tr>
		<tr>
			<td style="border:none;"><input type="file" name="filename"></td>
		</tr>
		<c:if test="${rvo.filename != null }">
		<tr>
			<td style="padding-bottom:20px;"><img src="${rvo.filename}" width="100"></td>
		</tr>
		</c:if>
		<tr>
			<td style="border:none;padding-top:20px;">
			<input type="button" value="취소" onclick="review_cancel()" id="update-btn2">
			<input type="button" value="수정" onclick="update_ok()" id="update-btn">
			</td>
		</tr>
	</table>
</form>
</body>
</html>