/**
 * 
 */
 /* 주소 api 띄우기 */ 
 function addOpen(){
 	window.open("jusoPopup", "주소검색", "width=550, height=517, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
 }
/* 주소api로 부터 값 받기 */
 function jusoCallBack(zipNo, roadAddrPart1, addrDetail){
	document.getElementById("zipNo").value = zipNo;
	document.getElementById("roadAddrPart1").value = roadAddrPart1;
	document.getElementById("addrDetail").value = addrDetail;
}
/* 내 주소록 */
 function my_address(){
 	window.open("myjuso", "내주소", "width=550, height=517, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
 }
/* 전체 체크 */
 function checkAll(){
	 if(document.getElementById("agree_all").checked==true){ 
	 	for(var i=0;i<2;i++) document.getElementsByName("agreecheck")[i].checked=true;   
	 }
	 if(document.getElementById("agree_all").checked==false){
	 	for(var i=0;i<2;i++) document.getElementsByName("agreecheck")[i].checked=false;  
	 }
}
/* 동의사항 취소시 전체 체크 취소 */
 function check_back(my){
	 if(my.checked==false){
	 	document.getElementById("agree_all").checked=false;  
	 }
 }
 
 /* 이메일 주소 셀렉트 박스 */
 function change_mail(my){
 	var mail = "";
 	switch(my.value){
 		case "0": mail=""; break;
 		case "1": mail="naver.com"; break;
 		case "2": mail="daum.net"; break;
 		case "3": mail="nate.com"; break;
 		case "4": mail="gmail.com"; break;
 		case "5": mail="hotmail.com"; break;
 		default : mail=""; break;
 	}
 	document.getElementById("email_juso").value=mail;
 }
 
 /* 배송정보가 주문자 정보와 일치체크 할 경우 */
 function shipping_my(my){
 	if(my.value == "0"){
 		document.getElementById("addr_name").value="";
 		document.getElementById("target").value="";
 		document.getElementById("zipNo").value="";
 		document.getElementById("roadAddrPart1").value="";
 		document.getElementById("addrDetail").value="";
 		document.getElementById("target_phone").value="";
 		document.getElementById("target_option").value="1";
 		document.getElementById("address_list").style.display = "none";
 	}
 	else{
 		if(document.getElementById("imsi_addr_name").value == ""){
 			alert("등록된 주소지가 없거나 기본배송지 설정이 되어있지 않습니다");
 			document.getElementById("shipping_loc").checked = true;
 		}
 		else{
 		document.getElementById("address_list").style.display = "inline-block";
 		document.getElementById("addr_name").value = document.getElementById("imsi_addr_name").value;
	 	document.getElementById("target").value=document.getElementById("imsi_target").value;
	 	document.getElementById("zipNo").value=document.getElementById("imsi_zipNo").value;
	 	document.getElementById("roadAddrPart1").value=document.getElementById("imsi_roadAddrPart1").value;
	 	document.getElementById("addrDetail").value=document.getElementById("imsi_addrDetail").value;
	 	document.getElementById("target_phone").value=document.getElementById("imsi_phone").value;
	 	document.getElementById("target_option").value=document.getElementById("imsi_option").value;
 		}
	
 	}
 }
 function shipping_my_m(my){
 	document.getElementById("target").value=document.getElementById("buyer").innerText;
	document.getElementById("target_phone").value=document.getElementById("buyer_phone").innerText;
 }
 
 function justNum(){
 	if(	(event.keyCode>45 && event.keyCode<48) || event.keyCode>57 || event.keyCode<45){
 		event.returnValue = false;
 	}
 }
 
 /* 결제 수단 변경 */
 function sudan_chg(n)
 {
 	document.getElementById("bank").value = "0";
 	document.getElementById("card").value = "0";
 	document.getElementById("halbu").value = "0";
 	document.getElementById("com").value = "0";
 	document.getElementById("pphone").value = "";
	var sudan = document.getElementsByClassName("sudan");
	for(i=0; i<sudan.length; i++)
	{
		sudan[i].style.display = "none";	
	}
	sudan[n].style.display = "block";
	if(document.orderform.pay_type.value == 0){
		document.orderform.state.value = 2;
	}
	else{
		document.orderform.state.value = 1;
	}
 }
 
 /*유효성 검사*/
 function final_check(){  
 	/* 회원 체크 */
	if(document.getElementById("agree1").checked == false){
		document.getElementById("agree1").focus();
		document.getElementsByClassName("submit_alert")[0].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[0].style.display = "none";
	}
	
	/* 필수2 체크 */
	if(document.getElementById("agree2").checked == false){
		document.getElementById("agree2").focus();
		document.getElementsByClassName("submit_alert")[1].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[1].style.display = "none";
	}
	
	/* 배송지명 체크 */
	if(document.getElementById("addr_name").value == ""){
		document.getElementById("addr_name").focus();
		document.getElementsByClassName("submit_alert")[2].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[2].style.display = "none";
	}
	
	/* 배송 받을사람 체크 */
	if(document.getElementById("target").value == ""){
		document.getElementById("target").focus();
		document.getElementsByClassName("submit_alert")[3].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[3].style.display = "none";
	}
	
	 /* 배송지 주소 체크 */
	if(document.getElementById("addrDetail").value == ""){
		document.getElementById("addrDetail").focus();
		document.getElementsByClassName("submit_alert")[4].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[4].style.display = "none";
	}
	
	/* 주문자 전화번호 체크 */
	if(document.getElementById("target_phone").value == ""){
		document.getElementById("target_phone").focus();
		document.getElementsByClassName("submit_alert")[5].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[5].style.display = "none";
	}
	
	/*계좌이체 선택 했을 경우*/
	if(document.orderform.pay_type.value==0 && document.orderform.bank.value==0){
		document.orderform.bank.focus();
		document.getElementsByClassName("submit_alert")[6].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[6].style.display = "none";
	}
	/*신용카드 선택 했을 경우*/
	if(document.orderform.pay_type.value==1	&& document.orderform.card.value==0){ 
		document.orderform.card.focus();
		document.getElementsByClassName("submit_alert")[7].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[7].style.display = "none";
	}
	/*간편결제 선택 했을 경우*/
	if(document.orderform.pay_type.value==2 
	&& (document.orderform.com.value==0 || document.orderform.pphone.value=="")){ 
		document.orderform.com.focus();
		document.getElementsByClassName("submit_alert")[8].style.display = "inline";
		return false;
	}
	else{
		document.getElementsByClassName("submit_alert")[8].style.display = "none";
	}

 }
