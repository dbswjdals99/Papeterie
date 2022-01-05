package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;

public interface MemberService {
	public String login_ok(MemberVO mvo, HttpSession session);
	public String userid_search_ok(MemberVO mvo);
	public String pwd_search_ok(MemberVO mvo);
	public String mywishlist(HttpSession session, Model model);
	public String del_wishlist(HttpServletRequest request);
	public String review_write(HttpServletRequest request, Model model);
	public String review_write_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo) throws Exception;
	public String myorderlist(HttpSession session, Model model);
	public String signup_ok(MemberVO mvo);
	public String userid_check(HttpServletRequest request);
	public String myreviewlist(HttpSession session, Model model);
	public String del_review(HttpServletRequest request, HttpSession session);
	public String member_update(MemberVO mvo,Model model,HttpSession session);
	public String member_update_ok(MemberVO mvo,HttpServletRequest request);
	public String update_review(HttpServletRequest request, Model model);
	public String review_update_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo) throws Exception;
	public String myorderdetail(HttpServletRequest request, HttpSession session, Model model);
	public String mypage_qna(HttpSession session,QnaVO qvo,Model model);
	public String delivery_ok(HttpServletRequest request);

}
