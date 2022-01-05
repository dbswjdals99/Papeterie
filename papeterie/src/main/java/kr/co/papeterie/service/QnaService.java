package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.QnaVO;

public interface QnaService {

	public String write_ok(QnaVO qvo,HttpSession session,HttpServletRequest request);
	
	public String list(Model model,HttpSession session);
	
	public String readnum(HttpServletRequest request);
	
	public String content(HttpServletRequest request,Model model);
	
	public String bimil_ok(HttpServletRequest request,Model model);
	
	public String delete(int id);
	
	public String update(HttpServletRequest request,Model model);
	
	public String update_ok(QnaVO qvo);
	
	public String rewrite_ok(QnaVO qvo,HttpSession session,HttpServletRequest request);
}
