package kr.co.papeterie.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.OrderitemVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;

public interface GoodsMapper {
	public GoodsVO goods_view(String pcode);
	public int review_chong();
	public ArrayList<ReviewVO> next_review(String pcode, int index);
	public int qna_chong();	
	public ArrayList<QnaVO> next_qna(int index);
	public ArrayList<QnaVO> dap_qna();
	public ArrayList<GoodsVO> get_cartproduct(String userid, String pcodelist);
	public MemberVO get_member(String userid);
	public AddressVO get_juso(String userid);
	public ArrayList<AddressVO> myjuso(String userid);
	public void address_add_ok(AddressVO avo);
	public void update_spoint(int spoint, String userid);
	public int address_recent_id(String userid);
	public void address_update(AddressVO avo);
	public int make_order_code(String a);
	public void purchase_ok(OrderVO ovo);	
	public void set_orderitem(OrderitemVO ivo);	
	public OrderVO get_porder(String userid);
	public ArrayList<GoodsVO> get_product(String order_code);
	public ArrayList<GoodsVO> all_goods();
	public int checkwish(@Param("_userid") String userid, @Param("_pcode") String pcode);
	public ArrayList<GoodsVO> goods_all(int index);
	public ArrayList<GoodsVO> goods_all_recent(int index);
	public ArrayList<GoodsVO> goods_all_rowprice(int index);
	public ArrayList<GoodsVO> goods_all_highprice(int index);
	public ArrayList<GoodsVO> goods_p01(int index);
	public ArrayList<GoodsVO> goods_p01_recent(int index);
	public ArrayList<GoodsVO> goods_p01_rowprice(int index);
	public ArrayList<GoodsVO> goods_p01_highprice(int index);
	public ArrayList<GoodsVO> goods_p02(int index);
	public ArrayList<GoodsVO> goods_p02_recent(int index);
	public ArrayList<GoodsVO> goods_p02_rowprice(int index);
	public ArrayList<GoodsVO> goods_p02_highprice(int index);
	public String goods_cnt();
	public String goods_cnt2();
	public String goods_cnt3();
	public int page_cnt();
	public int page_cnt2();
	public int page_cnt3();
	public ArrayList<GoodsVO> main_goods();
	public ArrayList<GoodsVO> main_goods_new();
	public ArrayList<GoodsVO> main_goods_2022();
}
