package kr.co.papeterie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.papeterie.mapper.QnaMapper;
import kr.co.papeterie.vo.QnaVO;

@Service
@Qualifier("qser")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaMapper mapper;
	
	private final String module="/qna/";

	@Override
	public String write_ok(QnaVO qvo,HttpSession session,HttpServletRequest request) {
		
		int grp=mapper.get_grp();
		qvo.setGrp(grp+1);
		
		qvo.setCategory(Integer.parseInt(request.getParameter("category")));
		qvo.setUserid(session.getAttribute("userid").toString());
		qvo.setName(session.getAttribute("uname").toString());
		qvo.setPwd(session.getAttribute("pwd").toString());
		
		mapper.write_ok(qvo);
		return "redirect:"+module+"list";
	}

	@Override
	public String list(Model model, HttpSession session) {
		
		model.addAttribute("list",mapper.list());
		model.addAttribute("uname",session.getAttribute("uname"));
		return module+"list";
	}
	
	@Override
	public String readnum(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		mapper.readnum(id);
		return "redirect:"+module+"content?id="+id;
	}
	
	@Override
	public String content(HttpServletRequest request,Model model) {
		
		String id = request.getParameter("id");
		model.addAttribute("qvo",mapper.content(id));
		return module+"content";
	}

	@Override
	public String bimil_ok(HttpServletRequest request,Model model) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		
		int chk = mapper.ispwd(pwd, id);
		if(chk==1)
		{
			return "redirect:"+module+"readnum?id="+id;
		}
		else
		{
			int fail = 1;
			model.addAttribute("fail",fail);
			return "redirect:"+module+"bimil?id="+id;
		}
	}
	
	@Override
	public String delete(int id) {
		mapper.delete(id);
		return "redirect:"+module+"list";
	}
	
	@Override
	public String update(HttpServletRequest request, Model model) {
		int id=Integer.parseInt(request.getParameter("id"));
		model.addAttribute("qvo",mapper.update(id));
		return module+"update";
	}
	
	@Override
	public String update_ok(QnaVO qvo) {
		int id = qvo.getId();
		mapper.update_ok(qvo);
		
		return "redirect:"+module+"content?id="+id;
	}
	
	@Override
	public String rewrite_ok(QnaVO qvo,HttpSession session,HttpServletRequest request) {
		
		qvo.setUserid(session.getAttribute("userid").toString());
		qvo.setName(session.getAttribute("uname").toString());
		qvo.setPwd(request.getParameter("pwd"));
		String id = request.getParameter("id");
		
		mapper.dapbun(id);
		mapper.up_seq(qvo.getSeq(),qvo.getGrp());
		mapper.rewrite_ok(qvo);
		return "redirect:"+module+"list";
	}
}
