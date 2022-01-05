package kr.co.papeterie.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.OrderitemVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;
import kr.co.papeterie.mapper.BasketMapper;
import kr.co.papeterie.mapper.GoodsMapper;

@Service
@Qualifier("goods")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper mapper;
	
	@Autowired
	private BasketMapper bmapper;
	
	private final String module = "/goods";
	
	@Override
	public String goods_view(String pcode, Model model)
	{
		model.addAttribute("gvo", mapper.goods_view(pcode));
		return module+"/goods_view";
	}
	
	// ajax를 통해 리뷰 글 가져오기
	@Override
	public ArrayList<ReviewVO> next_review(int page, String pcode)
	{
		int index = (page-1)*5;
		ArrayList<ReviewVO> reviewlist = new ArrayList<ReviewVO>();
		reviewlist = mapper.next_review(pcode, index);
		return reviewlist;
	}
	
	// ajax를 통해 문의 글 가져오기
	@Override
	public ArrayList<QnaVO> next_qna(int page)
	{
		int index = (page-1)*5;
		ArrayList<QnaVO> qnalist = new ArrayList<QnaVO>();
		qnalist = mapper.next_qna(index);
		return qnalist;
	}
	@Override
	public ArrayList<QnaVO> dap_qna()
	{
		return mapper.dap_qna();
	}	
	
	@Override
	public String purchase(HttpSession session, Model model, HttpServletRequest request)
	{
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("mvo", mapper.get_member(userid));
		model.addAttribute("avo", mapper.get_juso(userid));
		
		if(request.getParameter("pcode") != null) //바로 구매로 넘어오는 경우
		{
			GoodsVO pvo = new GoodsVO();
			pvo = mapper.goods_view(request.getParameter("pcode"));
			pvo.setCount(Integer.parseInt(request.getParameter("count")));
			model.addAttribute("pvo", pvo);
		}
		else 
		{
			String idxlist = request.getParameter("idxlist");
			String[] chkarray = idxlist.split(",");
			String pcodelist = "";
			for (int i = 0; i < chkarray.length; i++) {
				String pcode = bmapper.getpcode(Integer.parseInt(chkarray[i]));
				if(pcodelist == "")
				{
					pcodelist = "'"+pcode+"'";
				}
				else
				{
					pcodelist = pcodelist+",'"+pcode+"'";
				}
			}
			model.addAttribute("list", mapper.get_cartproduct(userid, pcodelist));
			model.addAttribute("idxlist", idxlist);
		}
		return module+"/purchase";
	}
	
	@Override
	public String myjuso(HttpSession session, Model model)
	{
		String userid = session.getAttribute("userid").toString();
		model.addAttribute("list", mapper.myjuso(userid));
		return module+"/myjuso";
	}
	
	@Override
	public String address_add_ok(HttpSession session, AddressVO avo)
	{
		avo.setUserid(session.getAttribute("userid").toString()); 
		mapper.address_add_ok(avo);
		return "redirect:"+module+"/myjuso";
	}
	
	@Override
	public String purchase_ok(HttpServletRequest request, HttpSession session, AddressVO avo, OrderVO ovo)
	{
		String userid = session.getAttribute("userid").toString();
		avo.setUserid(userid);
		int addr_id;
		// 회원 포인트 지급 
		mapper.update_spoint((int)Math.round((ovo.getPrice()*0.1)), userid);
		
		// 신규배송지 일경우 추가후 배송 아이디 가져오기
		if(request.getParameter("shipping_loc").equals("0"))
		{
			System.out.println("동작");
			avo.setSdefault(0);
			avo.setSoption(0);
			mapper.address_add_ok(avo);
			addr_id = mapper.address_recent_id(userid);
		}
		else// 기존 주소일경우 업데이트
		{
			addr_id = Integer.parseInt(request.getParameter("bidx"));
			avo.setIdx(addr_id);
			mapper.address_update(avo);
		}
		
		// 주문번호 생성하기
		LocalDate today = LocalDate.now();
		String a = today.toString();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String number_f = today.format(formatter);
		
		int num = mapper.make_order_code(a)+1;
		String number_b = String.format("%04d", num);
		
		String order_code = number_f+number_b;
		
		// 주문 테이블에 주문번호, 내용 데이터 입력
		ovo.setOrder_code(order_code);
		ovo.setUserid(userid);
		ovo.setAddr_id(addr_id);
		ovo.setPhone(request.getParameter("pphone"));
		mapper.purchase_ok(ovo);
		
		// 주문상품 테이블에 주문번호, 상품, 수량 입력
		String[] pcodesplit = request.getParameterValues("pcode");
		String[] countsplit = request.getParameterValues("count");
		OrderitemVO ivo = new OrderitemVO();
		ivo.setOrder_code(order_code);
		for(int i=0; i<pcodesplit.length; i++)
		{
			ivo.setPcode(pcodesplit[i]);
			ivo.setCount(Integer.parseInt(countsplit[i]));
			mapper.set_orderitem(ivo);
		}
		
		// 주문 완료 후 장바구니에서 삭제
		if(request.getParameter("idxlist") != "")
		{
			String idxlist = request.getParameter("idxlist");
			String[] chkarray = idxlist.split(",");
			for (int i = 0; i < chkarray.length; i++) {
				bmapper.del_cart(Integer.parseInt(chkarray[i]));
			}
		}
		return "redirect:"+module+"/purchase_finish";
	}
	
	@Override
	public String purchase_finish(HttpSession session, Model model)
	{
		String userid = session.getAttribute("userid").toString();
		// 주문정보 가져오기
		OrderVO ovo = new OrderVO();
		ovo = mapper.get_porder(userid);
		String order_code = ovo.getOrder_code();
		String[] regdate = ovo.getRegdate().split(" ");
		String buydate = regdate[0];
		String buytime = regdate[1];
		
		// 결제정보 변환하기
		String pay_type = "";
		if(ovo.getPay_type() == 0)
		{
			String bank = "";
			pay_type = "계좌이체";
			switch(ovo.getBank())
			{
				case 1:bank = "신한은행"; break;
				case 2:bank = "우리은행"; break;
				case 3:bank = "농협은행"; break;
				case 4:bank = "하나은행"; break;
			}
			model.addAttribute("bank", bank);
		}
		else if(ovo.getPay_type() == 1)
		{
			String card = "";
			String halbu = "";
			pay_type = "카드결제";
			switch(ovo.getCard())
			{
				case 1:card = "신한카드"; break;
				case 2:card = "우리카드"; break;
				case 3:card = "농협카드"; break;
				case 4:card = "하나카드"; break;
			}
			switch(ovo.getHalbu())
			{
				case 0:halbu = "일시불"; break;
				case 1:halbu = "1개월"; break;
				case 2:halbu = "2개월"; break;
				case 3:halbu = "3개월"; break;
				case 4:halbu = "4개월"; break;
			}
			model.addAttribute("card", card);
			model.addAttribute("halbu", halbu);
		}
		else
		{
			String com = "";
			pay_type = "휴대폰결제";
			switch(ovo.getCom())
			{
				case 1:com = "SKT"; break;
				case 2:com = "KT"; break;
				case 3:com = "LG"; break;
				case 4:com = "알뜰폰"; break;
			}
			model.addAttribute("com", com);
		}
		
		// 주문상품 가져오기
		model.addAttribute("list", mapper.get_product(order_code));
		model.addAttribute("ovo", ovo);
		model.addAttribute("pay_type", pay_type);
		model.addAttribute("buydate", buydate);
		model.addAttribute("buytime", buytime);

		return module+"/purchase_finish";
	}

	@Override
	public int checkwish(HttpServletRequest request, HttpSession session) {
		// 
		String userid = session.getAttribute("userid").toString();
		String pcode = request.getParameter("pcode");
		return mapper.checkwish(userid, pcode);
	}

	@Override
	public String goods_all(Model model,HttpServletRequest request) {
		
		int page;
		ArrayList<GoodsVO> list = new ArrayList<GoodsVO>();
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int index=(page-1)*20;
		
		if(request.getParameter("st") == null)
			list = mapper.goods_all(index);
		else if(request.getParameter("st").equals("2"))
			list = mapper.goods_all_recent(index);
		else if(request.getParameter("st").equals("3"))
			list = mapper.goods_all_rowprice(index);
		else
			list = mapper.goods_all_highprice(index);

		model.addAttribute("list", list);
		model.addAttribute("st", request.getParameter("st"));
		model.addAttribute("page",page);
		
		int pstart = page / 10;
		if(page % 10 == 0)
			pstart = pstart-1;
		
		pstart = pstart * 10 + 1;
		
		int pend = pstart + 9;
		
		// chong 페이지값 구하기
		int chong = mapper.page_cnt();
		if(chong < pend)
			pend = chong;
		
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		
		model.addAttribute("goods_cnt",mapper.goods_cnt());
		
		return module+"/goods_all";
	}
	
	@Override
	public String goods_p01(Model model,HttpServletRequest request) {
		
		int page;
		ArrayList<GoodsVO> list = new ArrayList<GoodsVO>();
		
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int index=(page-1)*20;
		
		if(request.getParameter("st") == null)
			list = mapper.goods_p01(index);
		else if(request.getParameter("st").equals("2"))
			list = mapper.goods_p01_recent(index);
		else if(request.getParameter("st").equals("3"))
			list = mapper.goods_p01_rowprice(index);
		else
			list = mapper.goods_p01_highprice(index);
		
		model.addAttribute("list", list);
		model.addAttribute("st", request.getParameter("st"));
		model.addAttribute("page",page);
		
		int pstart = page / 10;
		if(page % 10 == 0)
			pstart = pstart-1;
		
		pstart = pstart * 10 + 1;
		
		int pend = pstart + 9;
		
		// chong 페이지값 구하기
		int chong = mapper.page_cnt2();
		if(chong < pend)
			pend = chong;
		
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		
		model.addAttribute("goods_cnt",mapper.goods_cnt2());
		
		return module+"/goods_p01";
	}
	
	@Override
	public String goods_p02(Model model,HttpServletRequest request) {
		
		int page;
		ArrayList<GoodsVO> list = new ArrayList<GoodsVO>();
		
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int index=(page-1)*20;
		
		if(request.getParameter("st") == null)
			list = mapper.goods_p02(index);
		else if(request.getParameter("st").equals("2"))
			list = mapper.goods_p02_recent(index);
		else if(request.getParameter("st").equals("3"))
			list = mapper.goods_p02_rowprice(index);
		else
			list = mapper.goods_p02_highprice(index);
		
		model.addAttribute("list", list);
		model.addAttribute("st", request.getParameter("st"));
		model.addAttribute("page",page);
		
		int pstart = page / 10;
		if(page % 10 == 0)
			pstart = pstart-1;
		
		pstart = pstart * 10 + 1;
		
		int pend = pstart + 9;
		
		// chong 페이지값 구하기
		int chong = mapper.page_cnt3();
		if(chong < pend)
			pend = chong;
		
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		
		model.addAttribute("goods_cnt",mapper.goods_cnt3());
		
		return module+"/goods_p02";
	}
	
}
