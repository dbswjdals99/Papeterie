package kr.co.papeterie.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.papeterie.vo.MemberVO;
import kr.co.papeterie.vo.MyOrderVO;
import kr.co.papeterie.vo.QnaVO;
import kr.co.papeterie.vo.ReviewVO;
import kr.co.papeterie.vo.WishlistVO;

public interface MemberMapper {
	public MemberVO login_ok(MemberVO mvo);
	public String userid_search_ok(MemberVO mvo);
	public String pwd_search_ok(MemberVO mvo);
	public ArrayList<WishlistVO> mywishlist(@Param("_userid") String userid);
	public void del_wishlist(@Param("_idx") int idx);
	public void review_write_ok(ReviewVO rvo);
	public ArrayList<MyOrderVO> myorderlist(@Param("_userid") String userid);
	public void signup_ok(MemberVO mvo);
	public String userid_check(String userid);
	public ArrayList<ReviewVO> myreviewlist(@Param("_userid") String userid);
	public void del_review(@Param("_idx") int idx);
	public MemberVO member_update(String userid);
	public void member_update_ok(MemberVO mvo);
	public ReviewVO getreview(@Param("_idx") int idx);
	public void review_update_ok(ReviewVO rvo);
	public void review_update_ok2(ReviewVO rvo);
	public ArrayList<MyOrderVO> myorderdetail(@Param("_userid") String userid, @Param("_order_code") String order_code);
	public ArrayList<QnaVO> mypage_qna(String userid);

}