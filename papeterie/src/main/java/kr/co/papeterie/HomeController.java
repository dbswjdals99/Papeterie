package kr.co.papeterie;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.papeterie.mapper.GoodsMapper;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		model.addAttribute("list",mapper.main_goods());
		model.addAttribute("list2",mapper.main_goods_new());
		model.addAttribute("list3",mapper.main_goods_2022());
		
		return "/main/index";
	}
	
	@Autowired
	private GoodsMapper mapper;

	@RequestMapping("/main/index")
	public String index(Model model) {
		
		model.addAttribute("list",mapper.main_goods());
		model.addAttribute("list2",mapper.main_goods_new());
		model.addAttribute("list3",mapper.main_goods_2022());
		
		return "/main/index";
	}
	
	@RequestMapping("/admin")
	public String admin()
	{
		return "/admin/admin_login";
	}
	
	@RequestMapping("/ect/tos")
	public String tos()
	{
		return "/ect/tos";
	}
	

}
