package kr.co.papeterie.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.papeterie.mapper.GoodsMapper;
import kr.co.papeterie.service.GoodsService;
import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.OrderVO;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired
	@Qualifier("goods")
	private GoodsService gservice;
	
	@Autowired
	private GoodsMapper gmapper;
	
	private final String module = "/goods";
	
	@RequestMapping("/goods_view")
	public String goods_view(HttpServletRequest request, Model model)
	{
		String pcode = request.getParameter("pcode");
		return gservice.goods_view(pcode, model);
	}
	
	@RequestMapping("/next_review")
	@ResponseBody
	 public Map<String, Object> next_review(HttpServletRequest request) throws Exception
	{
		String pcode = request.getParameter("pcode");
		int review_p = Integer.parseInt(request.getParameter("review_p"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		int review_c = gmapper.review_chong();
		int review_sp = ((review_p-1)/10)*10+1;
		int review_ep = review_sp+10-1;
		if (review_ep > review_c)
			review_ep = review_c;
		
		map.put("review_p", review_p);
		map.put("review_c", review_c);
		map.put("review_sp", review_sp);
		map.put("review_ep", review_ep);		
		map.put("reviewlist", gservice.next_review(review_p, pcode));
		
		return map;
	}
	
	@RequestMapping("/next_qna")
	@ResponseBody
	 public Map<String, Object> next_qna(HttpServletRequest request) throws Exception
	{
		int qna_p = Integer.parseInt(request.getParameter("qna_p"));
		Map<String, Object> map = new HashMap<String, Object>();
		int qna_c = gmapper.qna_chong();
		int qna_sp = ((qna_p-1)/10)*10+1;
		int qna_ep = qna_sp+10-1;
		if (qna_ep > qna_c)
			qna_ep = qna_c;
		
		map.put("qna_p", qna_p);
		map.put("qna_c", qna_c);
		map.put("qna_sp", qna_sp);
		map.put("qna_ep", qna_ep);		
		map.put("qnalist", gservice.next_qna(qna_p));
		map.put("daplist", gservice.dap_qna());
		
		return map;
	}
	
	@RequestMapping("/login_check")
	public String login_check(HttpSession session, HttpServletRequest request)
	{
		if(session.getAttribute("userid") == null)
		{
			return "redirect:/papeterie/member/login";
		}
		else
		{
			String pcode = request.getParameter("pcode");
			String count = request.getParameter("count");
			return "redirect:"+module+"/purchase?pcode="+pcode+"&count="+count;
		}	
	}
	
	@RequestMapping("/purchase")
	public String purchase(HttpSession session, Model model, HttpServletRequest request)
	{
		if(session.getAttribute("userid") == null)
		{
			return "redirect:/papeterie/member/login";
		}
		else
		{
			return gservice.purchase(session, model, request);
		}		
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup()
	{
		return module+"/jusoPopup";
	}
	
	@RequestMapping("/myjuso")
	public String myjuso(HttpSession session, Model model)
	{
		return gservice.myjuso(session, model);
	}
	
	@RequestMapping("/address_add")
	public String address_add()
	{
		return module+"/address_add";
	}
	
	@RequestMapping("/address_add_ok")
	public String address_add_ok(HttpSession session, AddressVO avo)
	{
		return gservice.address_add_ok(session, avo);
	}
	
	@RequestMapping("/purchase_ok")
	public String purchase_ok(HttpServletRequest request, HttpSession session, AddressVO avo, OrderVO ovo)
	{
		return gservice.purchase_ok(request, session, avo, ovo);
	}
	
	
	@RequestMapping("/purchase_finish") 
	public String purchase_finish(HttpSession session, Model model) 
	{ 
		return gservice.purchase_finish(session, model); 
	}

	@RequestMapping("/checkwish")
	public void checkwish(HttpServletRequest request, HttpSession session, PrintWriter out) {
		if (gservice.checkwish(request, session) == 1) {
			out.print("1");
		}
		else {
			out.print("0");
		}
	}
	
	@RequestMapping("/goods_all")
	public String goods_all(Model model,HttpServletRequest request)
	{
		return gservice.goods_all(model,request);
	}
	
	@RequestMapping("/goods_p01")
	public String goods_p01(Model model,HttpServletRequest request)
	{
		return gservice.goods_p01(model,request);
	}
	
	@RequestMapping("/goods_p02")
	public String goods_p02(Model model,HttpServletRequest request)
	{
		return gservice.goods_p02(model,request);
	}
	
	
}
