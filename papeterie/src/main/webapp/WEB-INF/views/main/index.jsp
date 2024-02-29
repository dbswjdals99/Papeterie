<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE</title>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="/papeterie/resources/css/style.css">
<link rel="stylesheet" href="/papeterie/resources/css/goods_list.css">
<style>
.slider img{margin:0 auto;}
	
.bx-wrapper{
border:none;
box-shadow:none;
}
	
.bx-wrapper,
.bx-viewport,
.bx-wrapper img {
    height:500px;
} 

.goods_title span{
	display:inline-block;
	font-weight:bold;
	font-size:28px;
	padding-bottom:10px;
	padding-top:50px;
}

.goods_big{
	display:inline-block;
	margin-left:25px;
	position:absolute;
}

.goods_big span{
	display:inline-block;
	font-size:32px;
	margin-bottom:10px;
}

.goods_big p{
	font-size:16px;
}

.goods_big_img img{
	margin-bottom:30px;
}
</style>
<script>
$(document).ready(function(){
	   $('.slider').bxSlider({
		   auto: true,
		   autoHover: true
	   });
	 });
</script>
</head>
<body>
	<div class="slider">
    <div>
      <img src="/papeterie/resources/img/main1.jpg">
    </div>
    <div>
      <img src="/papeterie/resources/img/main2.jpg">
    </div>
    <div>
      <img src="/papeterie/resources/img/main3.gif">
    </div>
    <div>
      <img src="/papeterie/resources/img/main4.gif">
    </div>
    <div>
      <img src="/papeterie/resources/img/main5.gif">
    </div>
    <div>
      <img src="/papeterie/resources/img/main6.gif">
    </div>
</div>
	<div id="section3">
		<div class="goods_title">
			<span>잘나가요</span>
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
						<div class="goods-item-pricebox"><strong><fmt:formatNumber value="${gvo.price }"/>원</strong></div>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	
		<div class="goods_title">
			<span>새로 나왔어요</span>
		</div>
		<div id="goods-content">
		<ul>
			<c:forEach items="${list2}" var="gvo">
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
						<div class="goods-item-pricebox"><strong><fmt:formatNumber value="${gvo.price }"/>원</strong></div>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		</div>
	
		<div class="goods_title">
			<span>선물하기 딱 좋아요!</span>
		</div>
		<div class="goods_big_img">
			<img src="/papeterie/resources/img/main_goods1.jpg" onclick="location='/papeterie/goods/goods_view?pcode=p0102'" style="cursor:pointer;">
		<div class="goods_big">
			<span>2022년이 온다</span>
			<p>다이어리</p>
		</div>
		<div class="goods_big_img">
			<img src="/papeterie/resources/img/main_goods2.jpg" onclick="location='/papeterie/goods/goods_view?pcode=p0107'" style="cursor:pointer;">
		<div class="goods_big">
			<span>선물이 필요할 땐</span>
			<p>잘나가요 세트</p>
		</div>
		</div>
		</div>
		
		<div class="goods_title">
			<span>2022 새로운 아이템!</span>
		</div>
		<div id="goods-content">
		<ul>
			<c:forEach items="${list3}" var="gvo">
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
						<div class="goods-item-pricebox"><strong><fmt:formatNumber value="${gvo.price }"/>원</strong></div>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		</div>
	</div>
</body>
</html>