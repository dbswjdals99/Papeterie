package kr.co.papeterie.controller;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.papeterie.service.AddressService;
import kr.co.papeterie.service.MemberService;
import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("member")
	private MemberService service;
	
	@Autowired
	@Qualifier("address")
	private AddressService aservice;
	
	@RequestMapping("/member/signup1")
	public String signup1()
	{
		return "/member/signup1";
	}
	
	@RequestMapping("/member/signup2")
	public String signup2()
	{
		return "/member/signup2";
	}
	
	@RequestMapping("/member/signup3")
	public String signup3()
	{
		return "/member/signup3";
	}
	
	@RequestMapping("/member/signup_ok")
	public String signup_ok(MemberVO mvo)
	{
		return service.signup_ok(mvo);
	}
	
	@RequestMapping("/member/userid_check")
	public void userid_check(HttpServletRequest request,PrintWriter out)
	{
		String chk= service.userid_check(request);
		out.print(chk);
	}
	
	@RequestMapping("/member/login")
	public String login() {
		return "/member/login";
	}

	@RequestMapping("/member/login_ok")
	public String login_ok(MemberVO mvo, HttpSession session) {
		return service.login_ok(mvo, session);
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main/index";
	}

	@RequestMapping("/member/mypage")
	public String mypage(HttpSession session, Model model) {
		if (session.getAttribute("userid") == null ) {
			return "/papeterie/member/login";
		}
		return service.myorderlist(session, model);
	}

	@RequestMapping("/member/userid_search_ok")
	public void userid_search_ok(MemberVO mvo, PrintWriter out) {
		String userid = service.userid_search_ok(mvo);
		if (userid == null) {
			out.print("0");
		} else {
			out.print(userid);
		}
	}

	@RequestMapping("/member/pwd_search_ok")
	public void pwd_search_ok(MemberVO mvo, PrintWriter out) throws Exception {
		String pwd = service.pwd_search_ok(mvo);
		if (pwd == null) {
			out.print("0");
		} else {
			out.print(pwd);
		}
	}

	@RequestMapping("/member/addressbook")
	public String addressbook(HttpSession session, Model model) {
		if (session.getAttribute("userid") == null ) {
			return "/papeterie/member/login";
		}
		return aservice.list(session, model);
	}
	
	@RequestMapping("/member/add_ok")
	public String add(AddressVO avo, HttpSession session, Model model) {
		return aservice.add_ok(avo, session, model);
	}
	
	@RequestMapping("/member/get_addr")
	public @ResponseBody AddressVO get_addr(HttpServletRequest request) throws Exception {
		AddressVO avo = aservice.get_addr(request);
//		System.out.println("userid = " + avo.getUserid());
		return avo;
	}
	
	@RequestMapping("/member/update_ok")
	public String update_ok(AddressVO avo, HttpSession session) {
//		System.out.println("idx = " + avo.getIdx());
		return aservice.update_ok(avo, session);
	}
	
	@RequestMapping("/member/del_addr")
	public String del_addr(HttpServletRequest request) {
		return aservice.del_addr(request);
	}
	
	@RequestMapping("/member/wishlist")
	public String wishlist(HttpSession session, Model model) {
		if (session.getAttribute("userid") == null ) {
			return "/papeterie/member/login";
		}
		return service.mywishlist(session, model);
	}
	
	@RequestMapping("/member/del_wishlist")
	public String del_wishlist(HttpServletRequest request) {
		return service.del_wishlist(request);
	}

	@RequestMapping("/review/write")
	public String review_write(HttpServletRequest request, Model model) {
		return service.review_write(request, model);
	}

	@RequestMapping("/review/write_ok")
	public void review_write_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo, PrintWriter out) throws Exception {
		service.review_write_ok(request, session, rvo);
		out.print("1");
	}
	
	@RequestMapping("/member/myreview")
	public String myreview(HttpSession session, Model model) {
		if (session.getAttribute("userid") == null ) {
			return "/papeterie/member/login";
		}
		return service.myreviewlist(session, model);
	}

	@RequestMapping("/member/del_review")
	public String del_review(HttpServletRequest request, HttpSession session, Model model) {
		return service.del_review(request, session);
	}
	
	@RequestMapping("/member/member_update")
	public String member_update(MemberVO mvo,Model model,HttpSession session)
	{
		return service.member_update(mvo,model,session);
	}
	
	@RequestMapping("/member/member_update_ok")
	public String member_update_ok(MemberVO mvo,HttpServletRequest request)
	{
		return service.member_update_ok(mvo,request);
	}
	
	@RequestMapping("/review/update")
	public String review_update(HttpServletRequest request, Model model) {
		return service.update_review(request, model);
	}

	@RequestMapping("/review/update_ok")
	public void review_update_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo, PrintWriter out) throws Exception {
		service.review_update_ok(request, session, rvo);
		out.print("1");
	}
	
	@RequestMapping("/member/order_detail")
	public String myorderdetail(HttpServletRequest request, HttpSession session, Model model) {
		return service.myorderdetail(request, session, model);
	}

	@RequestMapping("/member/mypage_qna")
	public String mypage_qna(HttpSession session,QnaVO qvo,Model model)
	{
		return service.mypage_qna(session,qvo,model);
	}
	
	@RequestMapping("/member/delivery_ok")
	public void delivery_ok(HttpServletRequest request, PrintWriter out) {
		service.delivery_ok(request);
		out.print("1");
	}
}
