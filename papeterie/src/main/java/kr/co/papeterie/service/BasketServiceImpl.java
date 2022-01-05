package kr.co.papeterie.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import kr.co.papeterie.mapper.BasketMapper;
import kr.co.papeterie.vo.CartVO;

@Service
@Qualifier("basket")
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketMapper mapper;

	@Override
	public String add_cart(CartVO cvo) {
		// 
		int nRet = mapper.iscount(cvo.getUserid(), cvo.getPcode());
		if (nRet > 0) {
			int count = nRet + cvo.getCount();
			mapper.update_count(count, cvo.getUserid());
			return "update";
		}
		else {
			mapper.add_cart(cvo);
			return "add";
		}
	}

	@Override
	public String cartlist(HttpSession session, Model model) {
		// 
		// 비회원 처리
		String userid = null;
		String cusername = null;
		if (session.getAttribute("userid") == null) {
			userid = session.getId();
			cusername = "손님";
		}
		else {
			userid = session.getAttribute("userid").toString();
			cusername = session.getAttribute("uname").toString() + " 님";
		}
		
//		System.out.println("userid = " + userid);
		ArrayList<CartVO> list = mapper.cartlist(userid);
		int listsize = list.size();
		model.addAttribute("cusername", cusername);
		model.addAttribute("list", list);
		model.addAttribute("listsize", listsize);
		return "/basket/cart";
	}

	@Override
	public void del_cart(HttpServletRequest request) {
		// 
		String[] chkarray = request.getParameterValues("cartchk");
		
		for (int i = 0; i < chkarray.length; i++) {
//			System.out.println("val = " + chkarray[i]);
			mapper.del_cart(Integer.parseInt(chkarray[i]));
		}

	}

	@Override
	public void add_wishlist(HttpServletRequest request, HttpSession session) {
		//
		String userid = session.getAttribute("userid").toString();
		String[] chkarray = request.getParameterValues("cartchk");
		
		for (int i = 0; i < chkarray.length; i++) {
			String pcode = mapper.getpcode(Integer.parseInt(chkarray[i]));
			if (mapper.iswishlist(userid, pcode) == 0) {
				mapper.add_wishlist(userid, pcode);
			}
		}
	}

	@Override
	public void addwish(HttpServletRequest request, HttpSession session) {
		// 
		String userid = session.getAttribute("userid").toString();
		String pcode = request.getParameter("pcode");
		if (mapper.iswishlist(userid, pcode) == 0) {
			mapper.add_wishlist(userid, pcode);
		}
		
	}

	@Override
	public void add_cart_item(HttpServletRequest request) {
		// 
		String idx = request.getParameter("idx");
		mapper.add_cart_item(Integer.parseInt(idx));
		
	}

	@Override
	public void sub_cart_item(HttpServletRequest request) {
		// 
		String idx = request.getParameter("idx");
		mapper.sub_cart_item(Integer.parseInt(idx));
		
	}

	
}
