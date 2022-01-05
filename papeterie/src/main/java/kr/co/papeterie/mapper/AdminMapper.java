package kr.co.papeterie.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;

public interface AdminMapper {

	public String userlist();
	
	public String userpoint();
	
	public String gongjilist();
	
	public String qnalist();
	
	public String qnalist2();
	
	public ArrayList<MemberVO> user_list();
	
	public ArrayList<GongjiVO> gongji_list();
	
	public ArrayList<GongjiVO> gongji_list_limit();
	
	public ArrayList<QnaVO> qna_list();
	
	public ArrayList<QnaVO> qna_list_limit();
	
	public ArrayList<GoodsVO> pro_list();
	
	public void product_add_ok(GoodsVO gsvo);
	
	public void product_delete(String id);
	
	public MemberVO admin_login_ok();
	
	public ArrayList<OrderVO> porder(OrderVO ovo);
	
	public void state_ok(String state,String id);
	
	public ArrayList<OrderVO> state_chk();
	
	public OrderVO porder_content(OrderVO ovo);
	
	public ArrayList<GoodsVO> porder_pcode(GoodsVO gvo,String ocode);
	
	public String[] memo();
	
	public void memo_update(String memo);
	
	public ArrayList<ReviewVO> review();
	
	public void del_review(@Param("_idx") int idx);
	
	public void porder_delete(String idx);
	
	public GoodsVO product_update(int idx);
	
	public void product_update_ok(GoodsVO gvo);
	
}
