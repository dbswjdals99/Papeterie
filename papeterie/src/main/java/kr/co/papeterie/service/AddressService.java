package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.AddressVO;

public interface AddressService {
	public String list(HttpSession session, Model model);
	public String add_ok(AddressVO avo, HttpSession session, Model model);
	public AddressVO get_addr(HttpServletRequest request) throws Exception;
	public String update_ok(AddressVO avo, HttpSession session);
	public String del_addr(HttpServletRequest request);
	
}
