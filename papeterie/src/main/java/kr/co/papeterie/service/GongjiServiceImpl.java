package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.GongjiMapper;
import kr.co.papeterie.vo.GongjiVO;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService{

	@Autowired
	private GongjiMapper mapper;

	private final String module="/gongji/";
	
	@Override
	public String write_ok(GongjiVO gvo) {
		
		mapper.write_ok(gvo);
		
		return "redirect:"+module+"list";
	}

	@Override
	public String list(Model model, HttpSession session) {
		
		model.addAttribute("list", mapper.list());
		model.addAttribute("userid", session.getAttribute("userid"));
		return module+"list";
	}

	@Override
	public String content(HttpServletRequest request,Model model) {
		
		String id = request.getParameter("id");
		model.addAttribute("gvo",mapper.content(id));
		return module+"content";
	}
	
	@Override
	public String readnum(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		mapper.readnum(id);
		return "redirect:"+module+"content?id="+id;
	}
	
	@Override
	public String update(HttpServletRequest request, Model model) {
		int id=Integer.parseInt(request.getParameter("id"));
		model.addAttribute("gvo",mapper.update(id));
		return module+"update";
	}
	
	@Override
	public String update_ok(GongjiVO gvo) {
		int id = gvo.getId();
		mapper.update_ok(gvo);
		
		return "redirect:"+module+"content?id="+id;
	}
	
	@Override
	public String delete(int id) {
		mapper.delete(id);
		return "redirect:"+module+"list";
	}
	
}
