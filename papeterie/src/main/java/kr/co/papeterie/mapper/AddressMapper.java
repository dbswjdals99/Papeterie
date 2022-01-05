package kr.co.papeterie.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.co.papeterie.vo.AddressVO;

public interface AddressMapper {
	public ArrayList<AddressVO> list(@Param("_userid") String userid);
	public void add_ok(AddressVO avo);
	public AddressVO get_address(@Param("_idx") int idx);
	public void clear_sdefault(@Param("_userid") String userid);
	public void update_ok(AddressVO avo);
	public void del_addr(@Param("_idx") int idx);
	
}
