<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/css/goods_view.css?var=1">
<script src="/resources/js/goods_view.js"></script>
<script>
</script>
</head>
<body>
	<div id="section">
		<input type="hidden" id="gvo_option" value="${gvo.option}">
		<div id="goods_img" class="wrap">
			<img class="target" src="${gvo.img}" data-zoom="2">
			<c:if test="${gvo.option == -1}">
			<div class="imgover_soldout">
				<div class="imgover_soldout_inner"><strong>Sold Out</strong></div>
			</div>
			</c:if>
		</div>
		<div id="goods_side">
		<h3>${gvo.title}</h3>
		<form method="post" action="login_check" name="goods_form">
		<input type="hidden" name="pcode" value="${gvo.pcode}">
		<input type="hidden" name="count" value="1">
			<table id="goods_detail_table">
				<tr>
					<td class="td_head">판매 가격</td>
					<td class="td_content"> <strong id="goods_price"><fmt:formatNumber value="${gvo.price}"/>원</strong> </td>
				</tr>
				<tr>
					<td class="td_head">배송 정보</td>
					<td class="td_content">
					2,500원 (3만원 이상 구매시 무료)<br>
					오후 2시 당일배송마감
					</td>
				</tr>
				<tr>
					<td colspan="2" id="goods_option_list">
						<div class="goods_option">
						<c:if test="${gvo.option != -1}">
							<div class="option_name">${gvo.title}</div>
							<input type="button" class="left_button" onclick="count_goods(this)" value="-">
							<div class="center_count">1</div>
							<input type="button" class="right_button" onclick="count_goods(this)" value="+">
							<div class="option_price"><fmt:formatNumber value="${gvo.price}"/>원</div>
						</c:if>
						<c:if test="${gvo.option == -1}">
							<span id="count_soldout">빠른 시일내에 상품을 준비하겠습니다.</span>
						</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" id="blank"></td>
				</tr>
				<tr>
					<td colspan="2" id="total_price_td">
					<c:if test="${gvo.option != -1}">
						<span id="total_price_word" class="td_head">총 합계 금액</span> <strong id="total_price"><fmt:formatNumber value="${gvo.price}"/>원</strong>
					</c:if>
					<c:if test="${gvo.option == -1}">
						<span class="td_head">상품 준비중...</span>
					</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<c:if test="${gvo.option != -1}">
						<input type="submit" class="goods_buy_button" value="바 로 구 매"><br>
						<c:if test="${userid == null}">
						<a href="../member/login" class="goods_sub_button" id="goods_addwish">찜 하 기</a>
						</c:if>
						<c:if test="${userid != null}">
						<a href="javascript:;" class="goods_sub_button" id="goods_addwish" onclick="add_wish_fn('${gvo.pcode}')">찜 하 기</a>
						</c:if>
						<a href="javascript:;" class="goods_sub_button" onclick="add_cart_fn('${gvo.pcode}')">장 바 구 니</a>
					</c:if>
					<c:if test="${gvo.option == -1}">
						<span class="goods_soldout">Sold Out</span>
					</c:if>
					</td>
				</tr>
			</table>
			</form>
		</div>
		<div id="goods_data">
			<div id="goods_detail">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				${gvo.content}
			</div>
			<div id="goods_shipping">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				<img src="/resources/img/goods_shipping_notice.png">
			</div>
			<div id="goods_refund">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				<img src="/resources/img/goods_refund_notice.png">
			</div>
			<div id="goods_review">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				<div id="review_content">
				<span><strong>상 품 후 기</strong></span>
				<table>
					<tbody id="review_list">
					</tbody>
					<tfoot id="review_end">							
					</tfoot>
				</table>
				</div>
			</div>
			<div id="goods_inquiry">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				<div id="inquiry_content">
				<span><strong>상 품 문 의</strong></span> <a href="#" onclick="qna_write('${userid}')"><span class="write_button">상품문의 글쓰기</span></a>
				<table>
					<tbody id="qna_list">
					</tbody>
					<tfoot id="qna_end">							
					</tfoot>
				</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>