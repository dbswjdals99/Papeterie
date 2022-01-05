package kr.co.papeterie.mapper;

import java.util.ArrayList;

import kr.co.papeterie.vo.QnaVO;

public interface QnaMapper {

	public void write_ok(QnaVO qvo);
	
	public ArrayList<QnaVO> list();
	
	public void readnum(int id);
	
	public QnaVO content(String id);
	
	public int ispwd(String pwd,int id);
	
	public void delete(int id);
	
	public QnaVO update(int id);
	
	public void update_ok(QnaVO qvo);
	
	public int get_grp();
	
	public void up_seq(int seq, int grp);
	
	public void rewrite_ok(QnaVO qvo);
	
	public void dapbun(String id);
}
