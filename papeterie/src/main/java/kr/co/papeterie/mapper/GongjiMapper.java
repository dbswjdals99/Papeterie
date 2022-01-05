package kr.co.papeterie.mapper;

import java.util.ArrayList;

import kr.co.papeterie.vo.GongjiVO;

public interface GongjiMapper {

	public void write_ok(GongjiVO gvo);
	
	public ArrayList<GongjiVO> list();
	
	public GongjiVO content(String id);
	
	public void readnum(int id);
	
	public GongjiVO update(int id);
	
	public void update_ok(GongjiVO gvo);
	
	public void delete(int id);
}
