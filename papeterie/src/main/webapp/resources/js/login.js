/**
 * 
 */


$(document).ready(function(){
	$("#userid").focus();
});

function loginfocus() {
	document.getElementById("userid").focus();
}

function view_uidsearch() // 아이디 찾기 창 보이기
{
	document.getElementById("userid_search").style.display = "block";
	document.getElementById("pwd_search").style.display = "none";
	document.pwd_search.userid.value = "";
	document.pwd_search.name.value = "";
	document.pwd_search.email.value = "";
 }
 
// 비밀번호 찾기 창 보이기
function view_pwdsearch()
{
	document.getElementById("userid_search").style.display = "none"; // 아이디 찾기 숨기기 
	document.getElementById("pwd_search").style.display = "block";
	document.userid_search.name.value = "";
	document.userid_search.email.value = "";
}
 
function userid_search_fn() // 이름,이메일을 가지고 서버에가서 아이디를 찾아 오기
{
	var uname = document.userid_search.uname.value;
	var email = document.userid_search.email.value;
	
	$.ajax({
		url : "userid_search_ok",
		method : "GET",
		data : {
			uname : uname,
			email : email
		},
		dataType : "text",
		success : function(data) {
			console.log(data)
			if (data == "0") {
				$('#uid').text("일치하는 정보가 없습니다")
				$('#uid').css("color", "red")
			}
			else {
				$('#uid').html("<b>" + uname + "</b>님의 아이디는 <b>" + data + "</b>입니다")
				$('#uid').css("color", "blue")
			}
		}
	})
}
 
function pwd_search_fn() // 이름, 이메일을 가지고 서버에가서 아이디를 찾아 오기
{
	var userid = document.pwd_search.userid.value;
	var uname = document.pwd_search.uname.value;
	var email = document.pwd_search.email.value;

	$.ajax({
		url : "pwd_search_ok",
		method : "GET",
		data : {
			userid : userid,
			uname : uname,
			email : email
		},
		dataType : "text",
		success : function(data) {
			console.log(data)
			if (data == "0") {
				$('#pid').text("일치하는 정보가 없습니다")
				$('#pid').css("color", "red")
			}
			else {
				$('#pid').html("<b>" + uname + "</b>님의 비밀번호는 <b>" + data + "</b>입니다")
				$('#pid').css("color", "blue")
			}
		}
	})	
}
