package kr.co.papeterie.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.BasketService;
import kr.co.papeterie.service.GoodsService;
import kr.co.papeterie.vo.CartVO;

@Controller
public class BasketController {

	@Autowired
	@Qualifier("basket")
	private BasketService service;
	
	@Autowired
	@Qualifier("goods")
	private GoodsService gservice;

	@RequestMapping("/basket/cart")
	public String cart(HttpSession session, Model model) {
		return service.cartlist(session, model);
	}

	@RequestMapping("/basket/add_cart")
	public void add_cart(HttpServletRequest request, HttpSession session, CartVO cvo, PrintWriter out) {
		String pcode = request.getParameter("pcode");
		int count = Integer.parseInt(request.getParameter("count"));
		
		// 비회원 처리
		String userid = null;
		if (session.getAttribute("userid") == null) {
			userid = session.getId();
		}
		else {
			userid = session.getAttribute("userid").toString();
		}
		
//		System.out.println("userid = " + userid);
//		System.out.println("pcode = " + pcode);
//		System.out.println("count = " + count);
		cvo.setUserid(userid);
		cvo.setPcode(pcode);
		cvo.setCount(count);
		
		String retString = service.add_cart(cvo);
		
		out.print(retString);
	}
	
	@RequestMapping("/basket/cart_proc")
	public String cart_proc(HttpServletRequest request, HttpSession session, Model model) {
		String mode = request.getParameter("mode");
//		System.out.println("mode = " + mode + ", ");
		
		if (mode.equals("cartDelete")) {
			service.del_cart(request);
			return "redirect:/basket/cart";
		}
		else if (mode.equals("cartToWish")) {
			service.add_wishlist(request, session);
			return "redirect:/basket/cart";
		}
		else if (mode.equals("orderSelect")) {		
			String[] chkarray = request.getParameterValues("cartchk");
			String idxlist = "";
			for (int i = 0; i < chkarray.length; i++) {
				if(idxlist == "")
					idxlist = chkarray[i];
				else
					idxlist = idxlist+","+chkarray[i];
			}
			return "redirect:/goods/purchase?idxlist="+idxlist;	
		}
		
		return null;
	}
	
	@RequestMapping("/basket/addwish")
	public void addwish(HttpServletRequest request, HttpSession session, PrintWriter out) {
		service.addwish(request, session);
		out.print("done");
	}

	@RequestMapping("/basket/additem")
	public void additem(HttpServletRequest request, PrintWriter out) {
		service.add_cart_item(request);
		out.print("done");
	}

	@RequestMapping("/basket/subitem")
	public void subitem(HttpServletRequest request, PrintWriter out) {
		service.sub_cart_item(request);
		out.print("done");
	}

	
}
