<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>signup2</title>
<style>
	#section1 {
	width: 1200px;
	height: 1200px;
	margin: auto;
	}
	
	h2{text-align:center;}
	#pwd1,#pwdchk1,#name,#birthday1,#email1,#phone,#uk,#sung,#nickname,#captcha_text{
	font-size:14px;
	padding-top:5px; 
	padding-bottom:3px; 
	display:inline-block;
	}
	
	span{
	text-align:center;
	}
	
	#userid{
	width:330px;
	height:40px; 
	padding-left:10px; 
	border:1px solid silver;
	}
	
	input[type=text],input[type=password],input[type=email]{
	width:400px; 
	height:40px; 
	padding-left:10px; 
	border:1px solid silver;
	}
	
	input[type=submit]{
	width:414px; 
	height:50px; 
	background:black; 
	color:white; 
	border:none; 
	font-size:18px; 
	cursor:pointer; 
	font-weight:bolder;
	}
	
	input[type=button]{
	width:70px; 
	height:40px; 
	background:white; 
	border:1px solid silver; 
	font-size:14px; cursor:pointer; 
	border-left:none; 
	font-weight:bolder;
	}
	
	input:focus {outline:none;}
	
	#sung_td{
	color:gray; 
	border:1px solid silver; 
	width:400px; height:40px; 
	text-align:center; 
	padding-top:7px;
	}
	
	#lable1,#lable2,#lable3{
	margin-left:10px;
	}

	.join_head {
	width: 200px;
	height: 45px;
	background: #f2f2f2;
	display: inline-block;
	color: gray;
	font-size: 18px;
	padding-top: 10px;
	font-weight:bold;	
	}

	#join_page{
	background:black;
	color:white;
	border:none;
	}

	#join_head_main {
	margin-bottom: 50px;
	margin-top:50px;
	}
	
	#frmSubmit{
	border-left:1px solid silver;
	}
</style>
<script>	

	// 아이디 중복체크 확인 여부.
	function check()
	{
		var chk=new XMLHttpRequest();
		var userid=document.mem.userid.value;
		chk.open("get","userid_check?userid="+userid);
		chk.send();
		
		chk.onreadystatechange=function()
		{
			if(chk.readyState==4) // 완료된 상태
				{
					if(chk.responseText=="1" || userid == "")
						{
							document.getElementById("uk").innerText="사용 불가능한 아이디입니다.";
							document.getElementById("uk").style.color="tomato";
							document.getElementById("idhidden").value="0";
							
						}
					else
						{
							document.getElementById("uk").innerText="사용 가능한 아이디입니다.";
							document.getElementById("uk").style.color="black";
							document.getElementById("idhidden").value="1";

						}
				}
		}
	}
	
	// 회원가입시 유효성검사 체크부분
	function requireds1()
	{
		$(document).on("keyup", ".phoneNumber", function() { 
			
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
			
		});
		
		// 아이디 유효성체크
        var p1 = document.getElementById('password').value;
        var p2 = document.getElementById('pwdchk').value;
        
		if(document.mem.userid.value=="" || document.getElementById("idhidden").value == 0)
		{
			document.getElementById("uk").innerText="아이디를 입력후 중복확인을 눌러주세요.";
        	document.getElementById("uk").style.color="tomato";
        	document.getElementById("userid").focus();
        	return false;
		}
      
		
		
		// 비밀번호 유효성체크
        if(p1.length < 1) 
        {
        	document.getElementById("pwd1").innerText="비밀번호는 1글자 이상이어야 합니다.";
        	document.getElementById("pwd1").style.color="tomato";
        	document.getElementById("password").focus();
        	return false;
        	
        }
        else
        {
        	document.getElementById("pwd1").innerText="사용가능한 비밀번호입니다.";
        	document.getElementById("pwd1").style.color="black";
        }
        if(p1 != p2 || p1=="") 
        {
        	document.getElementById("pwdchk1").innerText="비밀번호가 일치하지 않습니다.";
        	document.getElementById("pwdchk1").style.color="tomato";
        	document.getElementById("pwdchk").focus();
        	return false
        } 
        else
        {
        	document.getElementById("pwdchk1").innerText="비밀번호가 일치합니다.";
        	document.getElementById("pwdchk1").style.color="black";
        }
		
        
        
    	 // 이름 유효성체크
		if(document.mem.uname.value=="")
		{
			document.getElementById("name").innerText="이름은 필수입력 입니다.";
        	document.getElementById("name").style.color="tomato";
        	document.getElementById("name2").focus();
        	return false;
		}
		else
		{
			document.getElementById("name").innerText="";
		}
		
    	 
		
		// 이메일 유효성체크
		var email = document.getElementById("email").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		if(document.mem.email.value == "")
		{
			document.getElementById("email1").innerText="이메일을 입력해주세요.";
        	document.getElementById("email1").style.color="tomato";
        	document.getElementById("email").focus();
        	return false;
		}
		else if(exptext.test(email)==false)
		{

			document.getElementById("email1").innerText="이메일 형식이 올바르지 않습니다.";
			document.getElementById("email1").style.color="tomato";
			document.addjoin.email.focus();
			return false;

		}
		else
		{
			document.getElementById("email1").innerText="";
		}

		
		
		// 휴대폰번호 유효성체크

		if(document.mem.tel.value=="")
		{
			document.getElementById("phone").innerText="휴대폰번호를 입력해주세요.";
        	document.getElementById("phone").style.color="tomato";
        	document.getElementById("tel").focus();
        	return false;
		}
		else if(document.mem.tel.value.length < 13)
		{
			document.getElementById("phone").innerText="전화번호를 다시 입력해주세요.";
        	document.getElementById("phone").style.color="tomato";
        	document.getElementById("tel").focus();
        	return false;
		}
		else
		{
			document.getElementById("phone").innerText="";
		}
		
		
		
		// 성별 유효성체크
		var sungcheck = $('input[name=gender]').is(':checked');
		if(sungcheck == false)
		{
			document.getElementById("sung").innerText="성별을 체크해주세요.";
        	document.getElementById("sung").style.color="tomato";
        	return false;
		}
		else
		{
			document.getElementById("sung").innerText="";
		}
		
		
		
				
	}
 </script>
</head>
<body>
<div id="section1">
<div id="join_head_main" align="center">
	<span class="join_head">약관동의</span><span class="join_head" id="join_page">회원정보입력</span><span class="join_head" id="border_right">회원가입완료</span>
</div>
<form method="post" action="signup_ok" name="mem">
	<table align="center">
		<tr>
			<td><input type="text" name="userid" id="userid" placeholder="아이디를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력해주세요.'" maxlength="50"><input type="button" onclick="check()" value="중복확인">
				<br><span id="uk"></span>
			</td>
		</tr>
		<tr>
			<td><input type="password" name="pwd" id="password" placeholder="비밀번호를 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력해주세요.'" maxlength="20">
			<br> <span id="pwd1"></span> 
			</td>
		</tr>
		<tr>
			<td><input type="password" name="pwdchk" id="pwdchk" placeholder="비밀번호를 한번더 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 한번더 입력해주세요.'" maxlength="20">
			<br> <span id="pwdchk1"></span>
			</td>
			
		</tr>
		<tr>
			<td><input type="text" name="uname" id="name2" placeholder="이름을 입력해주세요." onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력해주세요.'" maxlength="20">
			<br> <span id="name"></span>
			</td>
		</tr>
		<tr>
			<td><input type="email" name="email" id="email" placeholder="이메일을 입력해주세요. / 예) papeterie@naver.com" onfocus="this.placeholder=''" onblur="this.placeholder='이메일을 입력해주세요. / 예) papeterie@naver.com'" maxlength="50">
			<br> <span id="email1"></span>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="phone" id="tel" class="phoneNumber" placeholder="휴대폰번호를 입력해주세요. / 예) 010-0000-0000" onfocus="this.placeholder=''" onblur="this.placeholder='휴대폰번호를 입력해주세요. / 예) 010-0000-0000'" maxlength="13">
			<br> <span id="phone"></span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="sung_td">
			<input type="radio" name="gender" id="label1" value="0"><label for="label1"> &nbsp;선택안함</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" name="gender" id="label2" value="1"><label for="label2"> &nbsp;남자</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" name="gender" id="label3" value="2"><label for="label3"> &nbsp;여자</label>
			</div>
			<span id="sung"></span>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="8"><input type="submit" value="회원가입" onclick="return requireds1()"></td>
		</tr>
	</table>
<input type="hidden" id="idhidden" value="0">
</form>
</div>
</body>
</html>