package kr.co.papeterie.vo;

public class OrderVO {
	private int idx;		// 인덱스
	private String order_code;	// 주문코드 : 202112160001
	private String userid;	// 아이디
	private int price;		// 주문 금액
	private int ship_price;	// 배송비
	private int addr_id;	// 배송지 인덱스
	private int pay_type;	// 결재수단 : 0 - 계좌이체, 1 - 신용카드, 2 - 간편결재
	private int bank;		// 계좌이체 시 선택한 은행 : 1 - 신한은행, 2 - 우리은행, 3 - 농협은행, 4 - 하나은행
	private int card;		// 신용카드 선택 시 카드 종류 : 1 - 신한카드, 2 - 우리카드, 3 - 농협카드, 4 - 하나카드
	private int halbu;		// 신용카드 할부 개월수
	private int com;		// 간편결재 시 통신사 : 1 - SKT, 2 - KT, 3 - LG, 4 - 알뜰통신
	private String phone;	// 간편결재 전화번호
	private int state;		// 주문 상태 : 0 - 주문 완료, 1 - 결재완료, 2 - 입금대기, 3 - 입금확인, 4 - 상품준비중, 5 - 배송중, 6 - 배송완료
	private String regdate;	// 주문일자'
	
	private String addr1;   // 배송지 조인 주소1
	private String addr2;   // 배송지 조인 주소2
	
	private int cnt;
	
	
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAddr_id() {
		return addr_id;
	}
	public void setAddr_id(int addr_id) {
		this.addr_id = addr_id;
	}
	public int getPay_type() {
		return pay_type;
	}
	public void setPay_type(int pay_type) {
		this.pay_type = pay_type;
	}
	public int getBank() {
		return bank;
	}
	public void setBank(int bank) {
		this.bank = bank;
	}
	public int getCard() {
		return card;
	}
	public void setCard(int card) {
		this.card = card;
	}
	public int getHalbu() {
		return halbu;
	}
	public void setHalbu(int halbu) {
		this.halbu = halbu;
	}
	public int getCom() {
		return com;
	}
	public void setCom(int com) {
		this.com = com;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public int getShip_price() {
		return ship_price;
	}
	public void setShip_price(int ship_price) {
		this.ship_price = ship_price;
	}	
	
}
