<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 리뷰</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/review.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/mypage.js"></script>
</head>
<body>

<form name="frm" id="frm" action="write_ok" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pcode" value="${gvo.pcode}">
	<input type="hidden" name="order_code" value="${order_code}">
	<input type="hidden" name="userid" value="${userid}">
	<table id="review_write">
		<tr>
			<td><img id="goods_img" src="${gvo.img}"> ${gvo.title}</td>
		</tr>
		<tr>
			<td style="border:none;padding-top:20px;">상품은 만족하셨나요?</td>
		</tr>
		<tr>
			<td>
			    <fieldset>
			        <input type="radio" name="score" value="5" id="rate1"><label for="rate1">★</label>
			        <input type="radio" name="score" value="4" id="rate2"><label for="rate2">★</label>
			        <input type="radio" name="score" value="3" id="rate3"><label for="rate3">★</label>
			        <input type="radio" name="score" value="2" id="rate4"><label for="rate4">★</label>
			        <input type="radio" name="score" value="1" id="rate5"><label for="rate5">★</label>
			    </fieldset>
				<div class="_3Q4AGAjnPM" style="padding-bottom:20px;">선택하세요.</div>
			</td>
		</tr>
		<tr>
			<td style="border:none;padding-top:20px;">어떤 점이 좋았나요?</td>
		</tr>
		<tr>
			<td style="padding-bottom:20px;"><textarea name="content" id="content" rows="10" cols="40" style="outline:none;"></textarea></td>
		</tr>
		<tr>
			<td style="border:none;padding-top:20px;">사진 첨부하기</td>
		</tr>
		<tr>
			<td style="padding-bottom:20px;"><input type="file" name="filename"></td>
		</tr>
		<tr>
			<td style="border:none;padding-top:20px;">
			<input type="button" value="취소" onclick="review_cancel()" id="update-btn2">
			<input type="button" value="등록" onclick="review_ok()" id="update-btn">
			</td>
		</tr>
	</table>
</form>
</body>
</html>