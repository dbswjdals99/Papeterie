package kr.co.papeterie.service;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.papeterie.mapper.AdminMapper;
import kr.co.papeterie.vo.GongjiVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	
	private final String module="/papeterie/admin/";

	@Override
	public String manager(Model model) {
		
		model.addAttribute("userlist",mapper.userlist());
		model.addAttribute("userpoint",mapper.userpoint());
		model.addAttribute("gongjilist",mapper.gongjilist());
		model.addAttribute("qnalist",mapper.qnalist());
		model.addAttribute("qnalist2",mapper.qnalist2());
		model.addAttribute("gongji_list",mapper.gongji_list_limit());
		model.addAttribute("qna_list",mapper.qna_list_limit());
		model.addAttribute("cntlist",mapper.state_chk());
		model.addAttribute("memo",mapper.memo());
		mapper.memo();
		ArrayList<OrderVO> list=mapper.state_chk();
		OrderVO count0 = list.get(0);
		OrderVO count1 = list.get(1);
		OrderVO count2 = list.get(2);
		OrderVO count3 = list.get(3);
		OrderVO count4 = list.get(4);
		OrderVO count5 = list.get(5);
		OrderVO count6 = list.get(6);
		
		int cnt0 = count0.getCnt();
		int cnt1 = count1.getCnt();
		int cnt2 = count2.getCnt();
		int cnt3 = count3.getCnt();
		int cnt4 = count4.getCnt();
		int cnt5 = count5.getCnt();
		int cnt6 = count6.getCnt();
		
		model.addAttribute("cnt0",cnt0);
		model.addAttribute("cnt1",cnt1);
		model.addAttribute("cnt2",cnt2);
		model.addAttribute("cnt3",cnt3);
		model.addAttribute("cnt4",cnt4);
		model.addAttribute("cnt5",cnt5);
		model.addAttribute("cnt6",cnt6);
		
		return module+"manager";
	}

	@Override
	public String user_list(MemberVO mvo, Model model) {
		model.addAttribute("list",mapper.user_list());
		
		return module+"user";
	}

	@Override
	public String gongji_list(GongjiVO gvo, Model model) {
		
		model.addAttribute("list",mapper.gongji_list());
		
		return module+"gongji";
	}
	
	@Override
	public String qna_list(QnaVO qvo, Model model) {
		
		model.addAttribute("list",mapper.qna_list());
		
		return module+"qna";
	}
	
	@Override
	public String pro_list(GoodsVO gsvo,Model model) {
		
		model.addAttribute("list",mapper.pro_list());
		
		return module+"product";
	}

	@Override
	public String product_add_ok(GoodsVO gsvo,HttpServletRequest request, HttpSession session) throws Exception {
		
//		String path = request.getRealPath("/papeterie/resources/img/p01/");
		ServletContext application = session.getServletContext();
		String path = application.getRealPath("/papeterie/resources/img/p01/review/");
		int max = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());
		
		
		String pcode1 = multi.getParameter("pcode1");
		String pcode2 = multi.getParameter("pcode2");
		String pcode = pcode1 + pcode2;
		
		
		gsvo.setTitle(multi.getParameter("title"));
		gsvo.setPrice(Integer.parseInt(multi.getParameter("price")));
		gsvo.setCategory(multi.getParameter("category"));
		gsvo.setImg("/papeterie/resources/img/p01/main/"+multi.getFilesystemName("img"));
		gsvo.setContent("<img class='js-smart-img' src='/papeterie/resources/img/p01/detail/"+multi.getFilesystemName("content")+"'/>");
		gsvo.setPcode(pcode);
		
		mapper.product_add_ok(gsvo);
		
		
		return "redirect:"+module+"product";
	}

	@Override
	public String product_delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		mapper.product_delete(id);
		
		return "redirect:"+module+"product";
	}

	@Override
	public String admin_login_ok(HttpServletRequest request,MemberVO mvo,HttpSession session) {
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		mvo = mapper.admin_login_ok();
		String userid2 = mvo.getUserid();
		String pwd2 = mvo.getPwd();
		
		if(userid.equals(userid2) && pwd.equals(pwd2))
		{
			session.setAttribute("userid", mvo.getUserid());
			session.setAttribute("uname", "관리자");
			return "redirect:"+module+"manager";
		}
		else
		{
			return module+"admin_login";
		}
	}
	
	@Override
	public String porder(OrderVO ovo, Model model) {
		
		model.addAttribute("list",mapper.porder(ovo));
		
		
		return module+"porder";
	}

	@Override
	public String state_ok(HttpServletRequest request) {
		
		String state = request.getParameter("state");
		String id = request.getParameter("id");
		
		mapper.state_ok(state,id);
		
		return "redirect:"+module+"porder";
	}

	@Override
	public String porder_content(HttpServletRequest request, OrderVO ovo,Model model,GoodsVO gvo) {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String ocode = request.getParameter("ocode");
		ovo.setIdx(idx);
		
		model.addAttribute("ovo",mapper.porder_content(ovo));
		model.addAttribute("list",mapper.porder_pcode(gvo,ocode));
		
		return module+"porder_content";
	}

	@Override
	public String memo_update(HttpServletRequest request) {
		
		String memo = request.getParameter("memo");
		
		mapper.memo_update(memo);
		
		return "redirect:"+module+"manager";
	}

	@Override
	public String review(ReviewVO rvo, Model model) {
		
		model.addAttribute("list",mapper.review());
		
		return module+"review";
	}
	
	@Override
	public String del_review(HttpServletRequest request, HttpSession session) {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
		mapper.del_review(idx);
		return "redirect:/admin/review";
	}

	@Override
	public String porder_delete(HttpServletRequest request) {
		
		String idx = request.getParameter("idx");
		
		mapper.porder_delete(idx);
		
		return "redirect:"+module+"porder";
	}

	@Override
	public String product_update(HttpServletRequest request, Model model) {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		model.addAttribute("qvo",mapper.product_update(idx));
		
		return module+"product_update";
	}

	@Override
	public String product_update_ok(GoodsVO gvo) {
		
		mapper.product_update_ok(gvo);
		return "redirect:"+module+"product_update?idx="+gvo.getIdx();
	}
}
