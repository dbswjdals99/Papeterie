package kr.co.papeterie.service;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

import kr.co.papeterie.mapper.AddressMapper;
import kr.co.papeterie.mapper.BasketMapper;
import kr.co.papeterie.mapper.GoodsMapper;
import kr.co.papeterie.mapper.MemberMapper;
import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.GoodsVO;
import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.MyOrderVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;
import kr.co.papeterie.vo.WishlistVO;

@Service
@Qualifier("member")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BasketMapper bmapper;

	@Autowired
	private GoodsMapper gmapper;

	@Autowired
	private AddressMapper amapper;
	
	// 파일명 랜덤생성 메서드
	private String get_uploadFile(String originalName) throws Exception{
		// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		// 랜덤생성+파일이름 저장
		String savedName = uuid.toString() + "-" + originalName;
		return savedName;
	}
	
	@Override
	public String login_ok(MemberVO mvo, HttpSession session) {
		// TODO Auto-generated method stub
		MemberVO retvo = mapper.login_ok(mvo);
		
		if(retvo == null) // 아디디,비번 잘못입력
		{
			return "/member/login";
		}
		else
		{
			session.setAttribute("userid", retvo.getUserid());
			session.setAttribute("uname", retvo.getUname());
			session.setAttribute("pwd", retvo.getPwd());
			// 로그인 시 장바구니 정보 업데이트
			bmapper.update_userid(retvo.getUserid(), session.getId().toString());
			
			return "redirect:/main/index";
		}

	}

	@Override
	public String userid_search_ok(MemberVO mvo) {
		return mapper.userid_search_ok(mvo);
	}

	@Override
	public String pwd_search_ok(MemberVO mvo) {
		return mapper.pwd_search_ok(mvo);	
	}

	@Override
	public String mywishlist(HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		ArrayList<WishlistVO> wlist = mapper.mywishlist(userid);
		model.addAttribute("wlist", wlist);
		return "/member/wishlist";
	}

	@Override
	public String del_wishlist(HttpServletRequest request) {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
		mapper.del_wishlist(idx);
		return "redirect:/member/wishlist";
	}
	
	@Override
	public String review_write(HttpServletRequest request, Model model) {
		// 
		String pcode = request.getParameter("pcode");
		String order_code = request.getParameter("order_code");
//		System.out.println("review_write : order_code = " + order_code);
		GoodsVO gvo = gmapper.goods_view(pcode);
		model.addAttribute("gvo", gvo);
		model.addAttribute("order_code", order_code);
		return null;
	}

	@Override
	public String review_write_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo) throws Exception {
		// save path : /resources/img/p01/review/...
		ServletContext application = session.getServletContext();
		String rootPath = application.getRealPath("/");
		int max = 1024 * 1024 * 10;
		String cate = null;
		String order_code = null;
		String pcode = null;
		int score = 0;
		String userid = null;
		String content = null;
		String newfilename = null;
		boolean bFlag = true;
		
		MultipartParser mp = new MultipartParser(request, max);
		mp.setEncoding("UTF-8");

		Part part;
		while ((part = mp.readNextPart()) != null) {
			String name = part.getName();
			
			//파일이 아닐때
			if (part.isParam()) {
				ParamPart paramPart = (ParamPart) part;
				String value = paramPart.getStringValue();
//				System.out.println("param; name = " + name + ", value = " + value);
				
				if (name.equals("pcode")) {
					pcode = value;
					cate = pcode.substring(0, 3);
//					System.out.println("param; name = " + name + ", value = " + value + ", cate = " + cate);
				}
				else if (name.equals("score")) {
					score = Integer.parseInt(value);
				}
				else if (name.equals("userid")) {
					userid = value;
				}
				else if (name.equals("content")) {
					content = value;
				}
				else if (name.equals("order_code")) {
					order_code = value;
				}
			}
			else if (part.isFile()) {	// 파일일때
				FilePart filePart = (FilePart) part;
				String orgFileName = filePart.getFileName();	// original filename
				System.out.println("orgFileName = " + orgFileName);
				
				if (orgFileName == null) {
					bFlag = false;
				}
				else {
					filePart.setRenamePolicy(new DefaultFileRenamePolicy()); //중복파일
					String fileName = get_uploadFile(orgFileName);
					System.out.println("fileName = " + fileName);
					
					if (fileName != null) {
						File dir = new File(rootPath + "resources/img/" + cate + "/review");
						if (!dir.isDirectory()) { //디렉토리 체크 후 없으면 생성
							dir.mkdir();
						}
						
						File savefile = new File(rootPath + "resources/img/" + cate + "/review/" + fileName);
						newfilename = "/resources/img/" + cate + "/review/" + fileName;
						long size = filePart.writeTo(savefile);
					}
					else {
						bFlag = false;
					}
				}
			}
		}

//		System.out.println("pcode = " + pcode);
//		System.out.println("userid = " + userid);
//		System.out.println("score = " + score);
//		System.out.println("content = " + content);
//		System.out.println("order_code = " + order_code);
//		System.out.println("newfilename = " + newfilename);
		
		rvo.setOrder_code(order_code);
		rvo.setUserid(userid);
		rvo.setPcode(pcode);
		rvo.setScore(score);
		rvo.setContent(content);
		rvo.setFilename(newfilename);

		mapper.review_write_ok(rvo);
		
		return null;
	}

	@Override
	public String myorderlist(HttpSession session, Model model) {
		// 
		String userid = session.getAttribute("userid").toString();
		ArrayList<MyOrderVO> list = mapper.myorderlist(userid);
		model.addAttribute("olist", list);
		return "/member/mypage";
	}

	@Override
	public String signup_ok(MemberVO mvo) {
		
		mapper.signup_ok(mvo);
		return "/member/signup3";
	}

	@Override
	public String userid_check(HttpServletRequest request) {
		
		String userid = request.getParameter("userid");
		String chk = mapper.userid_check(userid);
		return chk;
	}

	@Override
	public String myreviewlist(HttpSession session, Model model) {
		// 
		String userid = session.getAttribute("userid").toString();
		ArrayList<ReviewVO> rlist = mapper.myreviewlist(userid);
		model.addAttribute("rlist", rlist);
		return "/member/myreview";
	}

	@Override
	public String del_review(HttpServletRequest request, HttpSession session) {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
		mapper.del_review(idx);
		return "redirect:/member/myreview";
	}

	@Override
	public String member_update(MemberVO mvo, Model model,HttpSession session) {
		
		String userid = session.getAttribute("userid").toString();
		
		model.addAttribute("mvo",mapper.member_update(userid));
		
		return "/member/member_update";
	}

	@Override
	public String member_update_ok(MemberVO mvo,HttpServletRequest request) {
		
		if(mvo.getPwd() == "")
		{
			mvo.setPwd(request.getParameter("pwd2"));
			mapper.member_update_ok(mvo);
		}
		else
		{
			mvo.setPwd(request.getParameter("pwd"));
			mapper.member_update_ok(mvo);
		}
		
		return "redirect:/member/mypage";
	}

	@Override
	public String update_review(HttpServletRequest request, Model model) {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
//		System.out.println("idx = " + idx);
		ReviewVO rvo = mapper.getreview(idx);
		model.addAttribute("rvo", rvo);
		return "/review/update";
	}
	
	@Override
	public String review_update_ok(HttpServletRequest request, HttpSession session, ReviewVO rvo) throws Exception {
		ServletContext application = session.getServletContext();
		String rootPath = application.getRealPath("/");
		int max = 1024 * 1024 * 10;
		String cate = null;
		String order_code = null;
		int idx = 0;
		String pcode = null;
		int score = 0;
		String userid = null;
		String content = null;
		String newfilename = null;
		boolean bFlag = true;
		
		MultipartParser mp = new MultipartParser(request, max);
		mp.setEncoding("UTF-8");

		Part part;
		while ((part = mp.readNextPart()) != null) {
			String name = part.getName();
			
			//파일이 아닐때
			if (part.isParam()) {
				ParamPart paramPart = (ParamPart) part;
				String value = paramPart.getStringValue();
//				System.out.println("param; name = " + name + ", value = " + value);
				
				if (name.equals("pcode")) {
					pcode = value;
					cate = pcode.substring(0, 3);
//					System.out.println("param; name = " + name + ", value = " + value + ", cate = " + cate);
				}
				else if (name.equals("score")) {
					score = Integer.parseInt(value);
				}
				else if (name.equals("idx")) {
					idx = Integer.parseInt(value);
				}
				else if (name.equals("content")) {
					content = value;
				}
			}
			else if (part.isFile()) {	// 파일일때
				FilePart filePart = (FilePart) part;
				String orgFileName = filePart.getFileName();	// original filename
				System.out.println("orgFileName = " + orgFileName);
				
				if (orgFileName == null) {
					bFlag = false;
				}
				else {
					filePart.setRenamePolicy(new DefaultFileRenamePolicy()); //중복파일
					String fileName = get_uploadFile(orgFileName);
					System.out.println("fileName = " + fileName);
					
					if (fileName != null) {
						File dir = new File(rootPath + "resources/img/" + cate + "/review");
						if (!dir.isDirectory()) { //디렉토리 체크 후 없으면 생성
							dir.mkdir();
						}
						
						File savefile = new File(rootPath + "resources/img/" + cate + "/review/" + fileName);
						newfilename = "/resources/img/" + cate + "/review/" + fileName;
					long size = filePart.writeTo(savefile);
					}
					else {
						bFlag = false;
					}
				}
				
			}
		}

		rvo.setIdx(idx);
		rvo.setScore(score);
		rvo.setContent(content);
		
		if (bFlag) {
			rvo.setFilename(newfilename);
			mapper.review_update_ok(rvo);
		}
		else {
			mapper.review_update_ok2(rvo);
		}
		
		return "redirect:/member/myreview";
	}

	@Override
	public String myorderdetail(HttpServletRequest request, HttpSession session, Model model) {
		// 
		String order_code = request.getParameter("order_code");
		String userid = session.getAttribute("userid").toString();
		ArrayList<MyOrderVO> list = mapper.myorderdetail(userid, order_code);
		OrderVO ovo = gmapper.get_porder(userid);
		AddressVO avo = amapper.get_address(ovo.getAddr_id());
//		System.out.println("avo = " + avo.getIdx() + ", " + avo.getRname());
		model.addAttribute("olist", list);
		model.addAttribute("ovo", ovo);
		model.addAttribute("avo", avo);
//		System.out.println("ovo = " + ovo.getPay_type());
		return "/member/order_detail";
	}
	
	@Override
	public String mypage_qna(HttpSession session, QnaVO qvo, Model model) {
		
		String userid = session.getAttribute("userid").toString();
		
		model.addAttribute("list",mapper.mypage_qna(userid));
		
		return "/member/mypage_qna";
	}

	@Override
	public String delivery_ok(HttpServletRequest request) {
		// 
		String order_code = request.getParameter("order_code");
		bmapper.deliver_ok(order_code);
		return null;
	}

}
