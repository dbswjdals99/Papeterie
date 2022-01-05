package kr.co.papeterie.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.papeterie.vo.CartVO;

public interface BasketMapper {
	public void add_cart(CartVO cvo);
	public int iscount(@Param("_userid") String userid, @Param("_pcode") String pcode);
	public void update_count(@Param("_count") int count, @Param("_userid") String userid);
	public ArrayList<CartVO> cartlist(@Param("_userid") String userid);
	public void update_userid(@Param("_userid") String userid, @Param("_sessionid") String sessionid);
	public void del_cart(@Param("_idx") int idx);
	public void add_wishlist(@Param("_userid") String userid, @Param("_pcode") String pcode);
	public int iswishlist(@Param("_userid") String userid, @Param("_pcode") String pcode);
	public String getpcode(@Param("_idx") int idx);
	public void deliver_ok(@Param("_order_code") String order_code);
	public void add_cart_item(@Param("_idx") int idx);
	public void sub_cart_item(@Param("_idx") int idx);
}
