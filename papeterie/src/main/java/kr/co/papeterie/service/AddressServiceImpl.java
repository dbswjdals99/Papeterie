package kr.co.papeterie.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.AddressMapper;
import kr.co.papeterie.vo.AddressVO;

@Service
@Qualifier("address")
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressMapper mapper;

	@Override
	public String list(HttpSession session, Model model) {
		// 
		ArrayList<AddressVO> list = mapper.list(session.getAttribute("userid").toString());
		model.addAttribute("list", list);
		return "/member/addressbook";
	}
	
	@Override
	public String add_ok(AddressVO avo, HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();
		avo.setUserid(userid);
		// 기본 배송지 처리
		if (avo.getSdefault() == 1) {
//			System.out.println("sdefault = 1");
			mapper.clear_sdefault(userid);
		} else {
//			System.out.println("sdefault = 0");
		}
		
		mapper.add_ok(avo);
		return "redirect:/member/addressbook";
	}

	@Override
	public AddressVO get_addr(HttpServletRequest request) throws Exception {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
//		System.out.println("idx = " + idx);
		AddressVO avo = mapper.get_address(idx);
//		System.out.println("addr1 = " + avo.getAddr1());
		
		return avo;
	}

	@Override
	public String update_ok(AddressVO avo, HttpSession session) {
//		System.out.println("update_ok");
		String userid = session.getAttribute("userid").toString();
		// 기본 배송지 처리
		if (avo.getSdefault() == 1) {
//			System.out.println("sdefault = 1");
			mapper.clear_sdefault(userid);
		} else {
//			System.out.println("sdefault = 0");
		}

		mapper.update_ok(avo);
		return "redirect:/member/addressbook";
	}

	@Override
	public String del_addr(HttpServletRequest request) {
		// 
		int idx = Integer.parseInt(request.getParameter("idx"));
//		System.out.println("del_addr : idx = " + idx);
		mapper.del_addr(idx);
		
		return "redirect:/member/addressbook";
	}

	
	
}
