<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>     
<!DOCTYPE html>
<html>
<head>
<title>PAPETERIE</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/papeterie/resources/css/default.css?var=3">
<script src="/papeterie/resources/js/default.js?var=1"></script>

<decorator:head />
</head>
<body>
 
	<!-- 
	일전의 top.jsp / bottom.jsp의 역할을 한다
	해당하는 decorator 태그에 지정된 문서가 자동으로 대치된다  
	-->
	
	<!-- 탑 부분 -->
	<div class="top_head_blank">
	</div>
	<div class="top_head"> 
	
		<!-- 첫번째 층 -->
		<div class="top_head_first">
		
			<!-- 스크롤 내리면 상단의 로고 -->
			<img src="/papeterie/resources/img/papeterie.png"  class="top-logo-text3" width="100" style="cursor:pointer;" onclick="location='/papeterie/main/index'">
			
			<!-- 로그인이 안되었을때 -->
			<div class="top-head-menu">
				<c:if test="${userid == null}">
					<a class="top_head_first_menu" href="/papeterie/member/login">로그인</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="/papeterie/member/signup1">회원가입</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="/papeterie/member/login">마이페이지</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="/papeterie/basket/cart">장바구니</a>
				</c:if>
				
				<!-- 로그인이 되었을때 -->
				<c:if test="${userid != null}">
					<span class="top_head_first_menu">${uname}님</span> <a class="top_head_first_menu" href="/papeterie/member/logout">로그아웃</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="/papeterie/member/mypage">마이페이지</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="/papeterie/basket/cart">장바구니</a>
				</c:if>
			</div>
		</div>
		
		<!-- 두번째 층 -->
		<div class="top_head_second">
		
			<!-- 처음시작시 로고 뜨는부분 -->
			<div class="top-logo-head">
				<img src="/papeterie/resources/img/papeterie.png"  width="200" style="cursor:pointer;" onclick="location='/papeterie/main/index'">
			</div>
		</div>
		
		<!-- 세번째 층  -->
		<div class="second-head">
			
			<!-- 메뉴 카테고리 -->
			<ul class="second-menu">
				<li>
					<a href="/papeterie/goods/goods_all">전체</a>
				</li>
				<li onmouseover="view_sub(0)" onmouseout="hide_sub(0)">
					<a href="/papeterie/goods/goods_p01">문구</a>
					<ul class="sub">
						<li><a href="#">필기</a></li>
						<li><a href="#">노트</a></li>
						<li><a href="#">기타</a></li>
					</ul>
				</li>
				<li onmouseover="view_sub(1)" onmouseout="hide_sub(1)">
					<a href="/papeterie/goods/goods_p02">리빙</a>
					<ul class="sub">
						<li><a href="#">잡지</a></li>
						<li><a href="#">잡화</a></li>
						<li><a href="#">악세서리</a></li>
					</ul>
				</li>
				<li onmouseover="view_sub(2)" onmouseout="hide_sub(2)">
					<a href="#">에디션</a>
					<ul class="sub">
						<li><a href="#">ㅋㅋ에디션</a></li>
						<li><a href="#">을지로에디션</a></li>
						<li><a href="#">배달이친구들</a></li>
						<li><a href="#">콜라보레이션</a></li>
					</ul>
				</li>
				<li onmouseover="view_sub(3)" onmouseout="hide_sub(3)">
					<a href="#">세트</a>
					<ul class="sub">
						<li><a href="#">선물세트</a></li>
						<li><a href="#">혼합세트</a></li>
						<li><a href="#">커플세트</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
<decorator:body/>
	
<!-- 문서의 내용이 출력 -->
	
<!-- 바텀 부분 -->

<div id="bottom-head">
	<div id="bottom-content">
		<div id="bottom-left"><img src="/papeterie/resources/img/papeterie.png"  width="250" style="cursor:pointer;" onclick="location='/papeterie/main/index'" id="bottom-img"></div>
		<div id="bottom-right">
			<div id="bottom-first">
				<a href="/papeterie/gongji/list">공지사항</a>
				<a href="/papeterie/qna/list">질문/답변</a>
				<a href="/papeterie/ect/tos">이용약관</a>
				<a href="#">개인정보처리방침</a>
				<a href="#">판매처 안내</a>
			</div>
			<div class="bottom-second">상호 : (주)Papeterie  사업자등록번호 : 120-10-01010 통신판매업신고번호 : 2022-서울구로-0106 [사업자정보확인] </div>
			<div class="bottom-second">팩스번호 : 010-101-0011 메일 : papeterie@market.com / Papeterie 인스타그램 : @Papeterie </div>
			<div class="bottom-second">주소 : 서울 구로구 구로중앙로34길 33-4 영림빌딩  호스팅제공 : 경영기술개발원 (주)</div>
			<div class="bottom-second">© Papeterie Guro Corp. All right Reserved</div>
		</div>
	</div>
	</div>
		<a href="#" class="top"><img src="/papeterie/resources/img/top.png" width="80"></a>
</body>
</html>