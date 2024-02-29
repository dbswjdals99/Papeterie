/**
 * 
 */

// 카트에 사용할 변수
var count = 1;

function encrypt_userid(userid) {
	let retString;
	let enc;
	if (userid.length > 3) {
		retString = userid.substring(0, 3);
		enc = userid.length - 3;
	}
	else {
		retString = userid;
		enc = 5;
	}
	
	for (i = 0; i < enc; i++) {
		retString += "*";
	}
	
	return retString;
}

window.onload = function(){
	Next_qna(1);
	Next_review(1);
	check_wish();
	
	var op = document.getElementById("gvo_option").value;
	if(op == -1){
		$('.target').css("position","relative");
	}
	else{
		var target = $('.target');
		var zoom = target.data('zoom');
		
		$(".wrap")
			.on('mousemove', magnify)
			.prepend("<div class='magnifier'></div>")
			.children('.magnifier').css({
				"background": "url('" + target.attr("src") + "') no-repeat",
				// 이미지를 zoom 배율만큼 확대해 배치한다.
				"background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
			});
		
		var magnifier = $('.magnifier');
		
		function magnify(e) {
		
			// 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
			var mouseX = e.pageX - $(this).offset().left;
			var mouseY = e.pageY - $(this).offset().top;
		
			// 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
			if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
				magnifier.fadeIn(100);
			} else {
				magnifier.fadeOut(100);
			}
		
			//돋보기가 존재할 때
			if (magnifier.is(":visible")) {
		
				// zoom으로 인해 확대된 이미지에 비례한 mouse 좌표를 얻는다.
				var rx = -(mouseX * zoom - magnifier.width() /2 );
				var ry = -(mouseY * zoom - magnifier.height() /2 );
		
				//돋보기를 마우스 위치에 따라 움직인다.
				//돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
				var px = mouseX - magnifier.width() / 2;
				var py = mouseY - magnifier.height() / 2;
		
				//적용
				magnifier.css({
					left: px,
					top: py,
					backgroundPosition: rx + "px " + ry + "px"
				});
			}
		}
	}

}

function Goods_Menu_Move(n){
	var offset = $(".goods_data_menu").eq(n).offset().top;
 	$('html, body').animate({scrollTop : offset-100}, 400);
}
 
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
 
function count_goods(my){
 	var class_name = my.className;
 	var class_cnt = document.getElementsByClassName(class_name).length;
 	var here = "";
 	for(i=0;i<class_cnt; i++){
 		if(my == document.getElementsByClassName(class_name)[i]){
 			here = i;
 		}
 	}
 	var cnt = parseInt(document.getElementsByClassName("center_count")[here].innerText);
 	if(my.value == "-"){
 		if(cnt > 1){
 			cnt--;
 		}
 	}
 	else{
 		cnt++;
 	}
 	// 선택 수량 저장
 	count = cnt;
 	var price = document.getElementById("goods_price").innerText.replace("원","").replace(",","");
 	price = parseInt(price);
 	price = comma(price*cnt);
 	document.getElementsByClassName("center_count")[here].innerText = cnt;
 	document.goods_form.count.value = cnt;
 	document.getElementsByClassName("option_price")[here].innerText = price+"원";
 	document.getElementById("total_price").innerText = price+"원";
}

function add_cart_fn(pcode)
{
	$.ajax({
		url : "/papeterie/basket/add_cart",
		method : "GET",
		data : {
			pcode : pcode,
			count : count
		},
		cache : false,
		success : function(data) {
			//console.log("return OK");
			//console.log(data);
			if (data.trim() != null) {
				if (confirm("장바구니로 이동하시겠습니까?")) {
					location="/papeterie/basket/cart";
				}
			}
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
}

function qna_write(userid){
	if(userid != ""){
		location = "/papeterie/qna/write";
	}
	else{
		location = "/papeterie/member/login";
	}
}

function add_wish_fn(pcode) {
	//alert(pcode);
	$.ajax({
		url : "/papeterie/basket/addwish",
		method : "GET",
		data : {
			pcode : pcode
		},
		cache : false,
		success : function(data) {
			if (data.trim() != null) {
				$("#goods_addwish").css("background-color", "yellow");
			}
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});

}function Next_review(p){
	var pcode = goods_form.pcode.value;
	$.ajax({
		url : "next_review",
		method : "post",
		data : {
			review_p : p,
			pcode : pcode
		},
		datatype : "json",
		success : function(res){
			var review_p = res.review_p;
			var review_c = res.review_c;
			var review_sp = res.review_sp;
			var review_ep = res.review_ep;
			var reviewlist = res.reviewlist;
			var a = "";
			var b = "";
			
			if(reviewlist.length<1){
				a = a+"<tr>";
				a = a+"<td colspan='4'><img src='/papeterie/resources/img/empty.png' width='300'></td>";
				a = a+"</tr>";
			}
			else{
				for(var i=0; i<reviewlist.length; i++){
					let star = "";
					switch (reviewlist[i].score) {
						case 1: star = "★☆☆☆☆"; break;
						case 2: star = "★★☆☆☆"; break;
						case 3: star = "★★★☆☆"; break;
						case 4: star = "★★★★☆"; break;
						case 5: star = "★★★★★"; break;
						default: star = "☆☆☆☆☆"; break;
					}
					a = a+"<tr>";
					//a = a+"<td class='td_name'>"+reviewlist[i].score+"</td>";
					a = a+"<td class='td_name'>"+star+"</td>";
					a = a+"<td class='td_title'><a href='javascript:view_review("+i+")'>"+reviewlist[i].content+"</a></td>";
					a = a+"<td class='td_user'>" + encrypt_userid(reviewlist[i].userid) + "</td>";
					a = a+"<td>"+reviewlist[i].regdate+"</td>";
					a = a+"</tr>";
					a = a+"<tr class='review_content_tr'>";
					a = a+"<td colspan='4'><div class='review_content_x' onclick='hide_review(this)'>x</div>"+reviewlist[i].content;
					if(reviewlist[i].filename != null && reviewlist[i].filename != ""){
						a = a+"<div><img src='"+reviewlist[i].filename+"'></div>";
					}
					a = a+"</td>";
					a = a+"</tr>";
				}
				b = b+"<tr>";
				b = b+"<td colspan='4'>";
				if(review_sp == 1){
					b = b+"이전";
				}
				else{
					b = b+"<a href='javascript:Next_review("+(review_sp-1)+")'>이전</a>";
				}
				for(var i=review_sp; i<review_ep; i++){
					b = b+"&nbsp";
					if(i == review_p){
						b = b+"<span style='color:red'>"+i+"</span>";
					}
					else{
						b = b+"<a href='javascript:Next_review("+i+")'>"+i+"</a>";
					}
					b = b+"&nbsp";
				}
				if(review_ep == review_c){
					b = b+"다음";
				}
				else{
					b = b+"<a href='javascript:Next_review("+(review_ep+1)+")'>다음</a>";
				}
				b = b+"</td>";
				b = b+"</tr>";
			}
			$("#review_list").html(a);
			$("#review_end").html(b);
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	})

}

function Next_qna(p){
	$.ajax({
		url : "next_qna",
		method : "post",
		data : {
			qna_p : p
		},
		datatype : "json",
		success : function(res){
			var qna_p = res.qna_p;
			var qna_c = res.qna_c;
			var qna_sp = res.qna_sp;
			var qna_ep = res.qna_ep;
			var qnalist = res.qnalist;
			var daplist = res.daplist;
			var a = "";
			var b = "";
			
			if(qnalist.length<1){
				a = a+"<tr>";
				a = a+"<td colspan='4'>등록된 문의글이 없습니다</td>";
				a = a+"</tr>";
			}
			else{
				for(var i=0; i<qnalist.length; i++){
					a = a+"<tr>";
					a = a+"<td class='td_name'>"+qnalist[i].name+"</td>";
					if(qnalist[i].bimil == 0){
						a = a+"<td class='td_title'><a class='bimil_title' href='javascript:view_qna("+i+")'>"+qnalist[i].title+"</a></td>";
					}
					else{
						a = a+"<td class='td_title'><a href='javascript:bimil_check("+i+")'><img src='/papeterie/resources/img/ico_lock.gif'>"+qnalist[i].title+"</a></td>";
					}
					a = a+"<td class='td_dap'>"+qnalist[i].dap+"</td>";
					a = a+"<td>"+qnalist[i].writeday+"</td>";	
					a = a+"</tr>";
					a = a+"<tr class='qna_content'>";
					a = a+"<td colspan='4'><div class='qna_content_x' onclick='hide_qna(this)'>x</div><div class='qna_content_head'>문의 내용 : </div>"+qnalist[i].content;
					for(var j=0; j<daplist.length; j++){
						if(qnalist[i].grp == daplist[j].grp){
							a = a+"<div class='qna_content_dap'><div class='qna_dap_head'>답변 내용 : </div>"+daplist[j].content+"</div>";
						}
					}
					a = a+"</td>";
					a = a+"</tr>";					
					a = a+"<tr class='bimil'>";
					a = a+"<td colspan='4'><input type='password' class='my_pwd' placeholder='비밀번호 입력'><button class='btn_open' onclick='bimil_pwdchk("+i+")'>확인</button><button class='btn_close' onclick='close_pwd("+i+")'>취소</button></td>";					
					a = a+"</tr>";
					a = a+"<form><input type='hidden' class='bimil_pwd' value='"+qnalist[i].pwd+"'></form>";
				}
				b = b+"<tr>";
				b = b+"<td colspan='4'>";
				if(qna_sp == 1){
					b = b+"이전";
				}
				else{
					b = b+"<a href='javascript:Next_qna("+(qna_sp-1)+")'>이전</a>";
				}
				for(var i=qna_sp; i<qna_ep; i++){
					b = b+"&nbsp";
					if(i == qna_p){
						b = b+"<span style='color:red'>"+i+"</span>";
					}
					else{
						b = b+"<a href='javascript:Next_qna("+i+")'>"+i+"</a>";
					}
					b = b+"&nbsp";
				}
				if(qna_ep == qna_c){
					b = b+"다음";
				}
				else{
					b = b+"<a href='javascript:Next_qna("+(qna_ep+1)+")'>다음</a>";
				}
				b = b+"</td>";
				b = b+"</tr>";
			}	
			$("#qna_list").html(a);
			$("#qna_end").html(b);
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
}

function add_wish_fn(pcode) {
	//alert(pcode);
	$.ajax({
		url : "/papeterie/basket/addwish",
		method : "GET",
		data : {
			pcode : pcode
		},
		cache : false,
		success : function(data) {
			if (data.trim() != null) {
				$("#goods_addwish").css("background-color", "yellow");
			}
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
}

 function bimil_check(my){ 	
 	var cnt = $('.qna_content').length;
 	for(var i = 0; i<cnt ; i++){
 		$(".bimil").eq(i).css("display","none");
 	}
 		$(".bimil").eq(my).css("display","table-row");
 	
 }
 
 function bimil_pwdchk(my){
 	var my_pwd =  document.getElementsByClassName("my_pwd")[my].value;
 	var put_pwd = document.getElementsByClassName("bimil_pwd")[my].value;
 	if(my_pwd == put_pwd){
 		document.getElementsByClassName("my_pwd")[my].value = "";
 		document.getElementsByClassName("bimil")[my].style.display = "none";
 		view_qna(my);
 	}
 	else{
 		alert("비밀번호가 일치하지 않습니다");
 	}
 }
 
 function close_pwd(my){;
 	document.getElementsByClassName("my_pwd")[my].value = "";
 	document.getElementsByClassName("bimil")[my].style.display = "none";
 }

 function view_review(n){
 	var cnt = $('.review_content').length;
 	for(var i=0; i<cnt; i++){
 		document.getElementsByClassName("review_content_tr")[i].style.display = "none";
 	}
 	document.getElementsByClassName("review_content_tr")[n].style.display = "table-row";
 }
 
 function hide_review(my){
 	var index = $(".review_content_x").index(my);
 	document.getElementsByClassName("review_content_tr")[index].style.display = "none";
 }
 
 function view_qna(n){
 	var cnt = $('.qna_content').length;
 	for(var i=0; i<cnt; i++){
 		document.getElementsByClassName("qna_content")[i].style.display = "none";
 	}
 	document.getElementsByClassName("qna_content")[n].style.display = "table-row";
 }
 
 function hide_qna(my){
 	var index = $(".qna_content_x").index(my);
 	document.getElementsByClassName("qna_content")[index].style.display = "none";
 }
 
function check_wish() {
	var pcode = $('[name=goods_form] [name=pcode]').val();
	//alert(pcode);
	$.ajax({
		url : "checkwish",
		method : "GET",
		data : {
			pcode : pcode
		},
		cache : false,
		success : function(data) {
			if (data.trim() == "1") {
				$("#goods_addwish").css("background-color", "yellow");
			}
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
	
}
