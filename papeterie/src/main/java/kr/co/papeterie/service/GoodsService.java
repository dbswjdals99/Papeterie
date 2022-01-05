package kr.co.papeterie.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.papeterie.vo.AddressVO;
import kr.co.papeterie.vo.OrderVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;

public interface GoodsService {
	public String goods_view(String pcode, Model model);
	public ArrayList<ReviewVO> next_review(int page, String pcode);
	public ArrayList<QnaVO> next_qna(int page);
	public ArrayList<QnaVO> dap_qna();
	public String purchase(HttpSession session, Model model, HttpServletRequest request);
	public String myjuso(HttpSession session, Model model);
	public String address_add_ok(HttpSession session, AddressVO avo);
	public String purchase_ok(HttpServletRequest request, HttpSession session, AddressVO avo, OrderVO ovo);
	public String purchase_finish(HttpSession session, Model model);
	public int checkwish(HttpServletRequest request, HttpSession session);
	public String goods_all(Model model,HttpServletRequest request);
	public String goods_p01(Model model,HttpServletRequest request);
	public String goods_p02(Model model,HttpServletRequest request);
}
