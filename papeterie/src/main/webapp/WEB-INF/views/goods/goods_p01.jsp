<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/papeterie/resources/css/style.css">
<link rel="stylesheet" href="/papeterie/resources/css/goods_list.css">
</head>
<body>
<div id="section-goods">
	<div id="goods-head">
		<span>총 <strong>${goods_cnt}</strong> 개</span>
		<div id="goods-head-menu">
			<a href="#">추천순</a>
			<a href="#">인기순</a>
			<a href="goods_p01?st=2">최신순</a>
			<a href="goods_p01?st=3">낮은가격순</a>
			<a href="goods_p01?st=4">높은가격순</a>
		</div>
	</div>
	<div id="goods-content">
		<ul>
			<c:forEach items="${list}" var="gvo">
			<li>
				<div class="goods-item">
					<div class="goods-item-imgbox">
						<c:if test="${gvo.option == -1}">
							<div class="imgover_soldout" onclick="location='/papeterie/goods/goods_view?pcode=${gvo.pcode}'" style="cursor:pointer;">
								<div class="imgover_soldout_inner"><strong>Sold Out</strong></div>
							</div>
						</c:if>
						<img src="${gvo.img}" width="270" height="350" onclick="location='/papeterie/goods/goods_view?pcode=${gvo.pcode}'" style="cursor:pointer;">
					</div>
					<div class="goods-item-contbox">
						<div class="goods-item-titlebox"><span id="goods-item-title" onclick="location='/papeterie/goods/goods_view?pcode=${gvo.pcode}'" style="cursor:pointer;">${gvo.title}</span></div>
						<div class="goods-item-pricebox"><strong><fmt:formatNumber value="${gvo.price}"/>원</strong></div>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div class="text-center">
   	<ul class="paging">
   		<!-- 10페이지 이전 -->
   	 	<c:if test="${pstart != 1}">
   	 		<li>
   	 			<div class="pagingBox">
   	 				<a href="/papeterie/goods/goods_p01?page=${pstart-10}&st=${st}">◀맨앞</a>
   	 			</div>
   	 		</li>
   	 	</c:if>
   	 	<c:if test="${pstart == 1}">
   	 		<li><a></a></li>
   	 	</c:if>
   	
   		<!-- 이전페이지 -->
		<c:if test="${page != 1 }">
   	 		<li>
   	 			<div class="pagingBox" style="margin-right:10px;">
   	 				<a href="/papeterie/goods/goods_p01?page=${page-1}&st=${st}">◁이전</a>
   	 			</div>
   	 		</li>
   	 	</c:if>
   	 	<c:if test="${page == 1}">
   	 		<li><a></a></li>
  	 	</c:if>
   		
   		<!-- 현재페이지 -->
   		<c:forEach begin="${pstart}" end="${pend}" var="i">
	   	 	<c:set var="str" value=""></c:set>
	   	 	<c:if test="${page == i}">
	   	 		<c:set var="str" value="style='color:black'"></c:set>
	   	 	</c:if>
	   	 		<li><a id="pagingPage" href="/papeterie/goods/goods_p01?page=${i}&st=${st}" ${str}>${i}</a></li>
	   	 	</c:forEach>
   		
   		<!-- 다음페이지 -->	
   	 	<c:if test="${page != chong}">
  	 		<li>
  	 			<div class="pagingBox">
  	 				<a href="/papeterie/goods/goods_p01?page=${page+1}&st=${st}">다음▷</a>
  	 			</div>
  	 		</li>
	 	</c:if>
  	 	<c:if test="${page == chong}">
  	 		<li><a></a></li>
  	 	</c:if>
  	 	
  	 	<!-- 맨뒤 -->
  	 	<c:if test="${pend != chong}">
   	 		<li>
   	 			<div class="pagingBox">
   	 				<a href="/papeterie/goods/goods_p01?page=${chong}&st=${st}">맨뒤▶</a>
   	 			</div>
   	 		</li>
   	 	</c:if>
   	 	<c:if test="${pend == chong}">
   	 		<li><a></a></li>
   	 	</c:if>
   		
   	</ul>
   </div>
</div>
</body>
</html>