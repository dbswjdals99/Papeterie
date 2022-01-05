package kr.co.papeterie.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.papeterie.service.AdminService;
import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService aservice;
	
	private final String module="/admin/";
	
	@RequestMapping("manager")
	public String manager(Model model)
	{
		return aservice.manager(model);
	}
	
	@RequestMapping("user")
	public String user(MemberVO mvo,Model model)
	{
		return aservice.user_list(mvo, model);
	}
	
	@RequestMapping("gongji")
	public String gongji(GongjiVO gvo,Model model)
	{
		return aservice.gongji_list(gvo, model);
	}
	
	@RequestMapping("qna")
	public String qna(QnaVO qvo,Model model)
	{
		return aservice.qna_list(qvo, model);
	}
	
	@RequestMapping("product")
	public String product(GoodsVO gsvo,Model model)
	{
		return aservice.pro_list(gsvo, model);
	}
	
	@RequestMapping("product_add")
	public String product_add()
	{
		return module+"product_add";
	}
	
	@RequestMapping("product_add_ok")
	public String product_add_ok(GoodsVO gsvo,HttpServletRequest request, HttpSession session) throws Exception
	{
		return aservice.product_add_ok(gsvo,request, session);
	}
	
	@RequestMapping("product_delete")
	public String product_delete(HttpServletRequest request)
	{
		return aservice.product_delete(request);
	}
	
	@RequestMapping("admin_login_ok")
	public String admin_login_ok(HttpServletRequest request,MemberVO mvo,HttpSession session)
	{
		return aservice.admin_login_ok(request,mvo,session);
	}
	
	@RequestMapping("porder")
	public String porder(OrderVO ovo,Model model)
	{
		return aservice.porder(ovo, model);
	}
	
	@RequestMapping("state_ok")
	public String state_ok(HttpServletRequest request)
	{
		return aservice.state_ok(request);
	}
	
	@RequestMapping("porder_content")
	public String porder_content(HttpServletRequest request,OrderVO ovo,Model model,GoodsVO gvo)
	{
		return aservice.porder_content(request,ovo,model,gvo);
	}
	
	@RequestMapping("admin_logout")
	public String admin_logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/admin";
	}
	
	@RequestMapping("memo_update")
	public String memo_update(HttpServletRequest request)
	{
		return aservice.memo_update(request);
	}
	
	@RequestMapping("review")
	public String review(ReviewVO rvo , Model model)
	{
		return aservice.review(rvo , model);
	}
	
	@RequestMapping("del_review")
	public String del_review(HttpServletRequest request, HttpSession session, Model model) {
		return aservice.del_review(request, session);
	}
	
	@RequestMapping("porder_delete")
	public String porder_delete(HttpServletRequest request)
	{
		return aservice.porder_delete(request);
	}
	
	@RequestMapping("product_update")
	public String product_update(HttpServletRequest request, Model model)
	{
		return aservice.product_update(request,model);
	}
	
	@RequestMapping("product_update_ok")
	public String product_update_ok(GoodsVO gvo)
	{
		return aservice.product_update_ok(gvo);
	}
	
}
