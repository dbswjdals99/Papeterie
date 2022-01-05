<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 관리자로그인</title>
<link rel="stylesheet" href="/resources/css/admin.css?var=1">
<script src="/resources/js/admin.js"></script>
<style>
body{
	margin:0px;
	background:#f2f2f2;
}
</style>
<script>
window.onload = function()
{
	var element = document.getElementById("div1");
	element.classList.add('click');
}
</script>
</head>
<body>
	<div id="section2">
		<div align="center"><img src="/resources/img/papeterie.png" width="300" onclick="location='../main/index'" style="cursor:pointer;"></div>
		<div id="login-form">
		<form method="post" action="/admin/admin_login_ok">
			<table width="350" align="center">
				<tr>
					<td style="border-bottom:1px solid silver;"><span class="login-head" id="div1" onclick="color_chg()">대표운영자</span><span class="login-head" id="div2" onclick="color_chg2()">부운영자</span></td>
				</tr>
				<tr>
					<td style="padding-top:30px;padding-bottom:10px;"><input type="text" name="userid" class="login-input" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" class="login-input" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="chk">&nbsp;로그인상태 유지 <span style="float:right;">비밀번호 재설정 ></span></td>
				</tr>
				<tr>
					<td><input type="submit" value="관리자 로그인" id="login-ok"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>