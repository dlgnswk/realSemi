package wh.myshop.domain;

public class CartVO {

	private int ct_seq_no;		// 장바구니일련번호
	private String fk_userid; 	// 회원아이디
	private int fk_it_seq_no;	// 제품번호
	private int order_qty; 		// 주문수량
	
	private ItemVO ivo;

	public int getCt_seq_no() {
		return ct_seq_no;
	}

	public void setCt_seq_no(int ct_seq_no) {
		this.ct_seq_no = ct_seq_no;
	}

	public String getFk_userid() {
		return fk_userid;
	}

	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}

	public int getFk_it_seq_no() {
		return fk_it_seq_no;
	}

	public void setFk_it_seq_no(int fk_it_seq_no) {
		this.fk_it_seq_no = fk_it_seq_no;
	}

	public int getOrder_qty() {
		return order_qty;
	}

	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}

	public ItemVO getIvo() {
		return ivo;
	}

	public void setIvo(ItemVO ivo) {
		this.ivo = ivo;
	}
}
