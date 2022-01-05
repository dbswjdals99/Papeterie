package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.GongjiVO;

public interface GongjiService {

	public String write_ok(GongjiVO gvo);
	
	public String list(Model model, HttpSession session);
	
	public String content(HttpServletRequest request,Model model);
	
	public String readnum(HttpServletRequest request);
	
	public String update(HttpServletRequest request,Model model);
	
	public String update_ok(GongjiVO gvo);
	
	public String delete(int id);
}
