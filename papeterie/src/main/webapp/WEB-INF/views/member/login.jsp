<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - login</title>
<link rel="stylesheet" href="/papeterie/resources/css/style.css">
<link rel="stylesheet" href="/papeterie/resources/css/login.css">
<script src="/papeterie/resources/js/login.js"></script>
</head>
<body>

	<div id="section2">
		<div align="center">
			<div id="login-head">회원 로그인</div>
			<form name="frm" method="post" action="login_ok">
				<table id="login_table">
					<tr>
						<td>
							<input type="text" name="userid" id="userid" class="login-input" placeholder="아이디">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="pwd" class="login-input" placeholder="비밀번호">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="로그인">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div align="center">
								<span class="login-sub-text"><a href="/papeterie/member/signup1" style="color:black;text-decoration:none;">회원가입</a></span>
								<a style="color:silver;">&nbsp;&nbsp;|&nbsp;&nbsp;</a>
								<span onclick="view_uidsearch()" class="login-sub-text">아이디 찾기</span>
								<a style="color:silver;">&nbsp;&nbsp;|&nbsp;&nbsp;</a>
								<span onclick="view_pwdsearch()" class="login-sub-text">비밀번호 찾기</span>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div align="center"><span id="msg"></span></div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
	</div>

	<div id="userid_search" align="center">
			<form name="userid_search">
				<table id="userid_search_tbl">
					<tr>
						<td>
							<input type="text" name="uname" placeholder="이름" class="check-input">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="email" placeholder="이메일" class="check-input">
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="아이디찾기" onclick="userid_search_fn()" class="check-btn">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div align="center"><span id="uid"></span></div>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="pwd_search" align="center">
			<form name="pwd_search">
				<table id="pwd_search_tbl">
					<tr>
						<td>
							<input type="text" name="userid" placeholder="아이디" class="check-input">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="uname" placeholder="이름" class="check-input">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="email" placeholder="이메일" class="check-input">
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="비밀번호찾기" onclick="pwd_search_fn()" class="check-btn">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div align="center"><span id="pid"></span></div>
						</td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>