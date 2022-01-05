package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;

public interface AdminService {

	public String manager(Model model);
	
	public String user_list(MemberVO mvo,Model model);
	
	public String gongji_list(GongjiVO gvo,Model model);
	
	public String qna_list(QnaVO qvo,Model model);
	
	public String pro_list(GoodsVO gsvo,Model model);
	
	public String product_add_ok(GoodsVO gsvo,HttpServletRequest request, HttpSession session) throws Exception;
	
	public String product_delete(HttpServletRequest request);
	
	public String admin_login_ok(HttpServletRequest request,MemberVO mvo,HttpSession session);
	
	public String porder(OrderVO ovo,Model model);
	
	public String state_ok(HttpServletRequest request);
	
	public String porder_content(HttpServletRequest request,OrderVO ovo,Model model,GoodsVO gvo);
	
	public String memo_update(HttpServletRequest request);
	
	public String review(ReviewVO rvo , Model model);
	
	public String del_review(HttpServletRequest request, HttpSession session);
	
	public String porder_delete(HttpServletRequest request);
	
	public String product_update(HttpServletRequest request, Model model);
	
	public String product_update_ok(GoodsVO gvo);

}
