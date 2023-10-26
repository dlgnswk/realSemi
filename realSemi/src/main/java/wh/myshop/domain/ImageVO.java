package wh.myshop.domain;

// VO(Value Object) == DTO(Data Transfer Object)
public class ImageVO {

	private int img_seq_no;      // 사진 일련번호    
	private int fk_it_seq_no;	 // 제품 일련번호
	private String img_file; 	 // 파일이름
	
	public ImageVO() {}
	
	
	public int getImg_seq_no() {
		return img_seq_no;
	}
	public void setImg_seq_no(int img_seq_no) {
		this.img_seq_no = img_seq_no;
	}
	public int getFk_it_seq_no() {
		return fk_it_seq_no;
	}
	public void setFk_it_seq_no(int fk_it_seq_no) {
		this.fk_it_seq_no = fk_it_seq_no;
	}
	public String getImg_file() {
		return img_file;
	}
	public void setImg_file(String img_file) {
		this.img_file = img_file;
	}
	
	

} 
	
	
	

