package kr.co.papeterie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.papeterie.service.QnaService;
import kr.co.papeterie.vo.QnaVO;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	@Qualifier("qser")
	private QnaService qservice;
	
	private final String module="/qna/";
	
	@RequestMapping("write")
	public String write()
	{
		return module+"write";
	}
	
	@RequestMapping("write_ok")
	public String write_ok(QnaVO qvo,HttpSession session,HttpServletRequest request)
	{
		return qservice.write_ok(qvo,session,request);
	}
	
	@RequestMapping("list")
	public String list(Model model,HttpSession session)
	{
		return qservice.list(model,session);
	}
	
	@RequestMapping("bimil")
	public String bimil()
	{
		return module+"bimil";
	}
	
	@RequestMapping("bimil_ok")
	public String bimil_ok(HttpServletRequest request,Model model)
	{
		return qservice.bimil_ok(request,model);
	}
	
	@RequestMapping("readnum")
	public String readnum(HttpServletRequest request)
	{
		return qservice.readnum(request);
	}
	
	@RequestMapping("content")
	public String content(HttpServletRequest request,Model model)
	{
		return qservice.content(request,model);
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest request)
	{
		return qservice.delete(Integer.parseInt(request.getParameter("id")));
	}
	
	@RequestMapping("update")
	public String update(HttpServletRequest request,Model model)
	{
		return qservice.update(request,model);
	}
	
	@RequestMapping("update_ok")
	public String update_ok(QnaVO qvo)
	{
		return qservice.update_ok(qvo);
	}
	
	@RequestMapping("rewrite")
	public String rewrite(HttpServletRequest request,Model model)
	{
		model.addAttribute("grp",request.getParameter("grp"));
		model.addAttribute("seq",request.getParameter("seq"));
		model.addAttribute("dep",request.getParameter("dep"));
		
		return module+"rewrite";
	}
	
	@RequestMapping("rewrite_ok")
	public String rewrite_ok(QnaVO qvo,HttpSession session,HttpServletRequest request)
	{
		return qservice.rewrite_ok(qvo,session,request);
	}
	
}
