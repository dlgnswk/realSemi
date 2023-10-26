package ws.shop.domain;

public class DetailVO {

	private int o_detail_seq_no;	// 주문상세일련번호
	private int fk_order_seq_no;	// 주문일련번호
	private int o_qty;				// 주문수량
	private int o_price;			// 주문금액
	private int o_status;			// 주문상태 (0 : 배송준비중 / 1 : 배송중 / 2 : 배송완료)
	private String deliverd_date;	// 배송완료일자
	
	//////////////////////////////////////////////////
	
	public int getO_detail_seq_no() {
		return o_detail_seq_no;
	}
	public void setO_detail_seq_no(int o_detail_seq_no) {
		this.o_detail_seq_no = o_detail_seq_no;
	}
	public int getFk_order_seq_no() {
		return fk_order_seq_no;
	}
	public void setFk_order_seq_no(int fk_order_seq_no) {
		this.fk_order_seq_no = fk_order_seq_no;
	}
	public int getO_qty() {
		return o_qty;
	}
	public void setO_qty(int o_qty) {
		this.o_qty = o_qty;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public int getO_status() {
		return o_status;
	}
	public void setO_status(int o_status) {
		this.o_status = o_status;
	}
	public String getDeliverd_date() {
		return deliverd_date;
	}
	public void setDeliverd_date(String deliverd_date) {
		this.deliverd_date = deliverd_date;
	}
	
	
}
