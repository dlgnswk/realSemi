package wh.myshop.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import wh.myshop.domain.*;

public class ItemDAO_imple implements ItemDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public ItemDAO_imple() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
			
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기 
	   private void close() {
	      try {
	         if(rs != null)    {rs.close();    rs=null;}
	         if(pstmt != null) {pstmt.close(); pstmt=null;}
	         if(conn != null)  {conn.close();  conn=null;}
	      } catch(SQLException e) {
	         e.printStackTrace();
	      }
	}
	
	
	
	// 상세페이지에 보여지는 상품정보를 모두 조회(select)하는 메소드 
	@Override
	public List<ItemVO> itemInfoAll(Map<String, String> paraMap) throws SQLException {

		List<ItemVO> infoList = new ArrayList<>();
		
		
		int itSeqNO = Integer.parseInt(paraMap.get("it_seq_no"));
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ca_name, it_name, it_price, it_theme, it_describe, it_describe_simple, it_ingredient, ca_how_to_use, ca_caution, ca_expired, G.img_file "
					   + " from tbl_category c join tbl_item i "
					   + " on c.CA_ID = i.FK_CA_ID "
					   + " join tbl_img G "
					   + " on i.it_seq_no = G.fk_it_seq_no "
					   + " where it_seq_no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itSeqNO);
			
			
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {
			// ca_name, it_name, it_price, it_ingredient, it_describe, G.img_file	
			
				ItemVO itemvo = new ItemVO();
				
				itemvo.setIt_name(rs.getString("it_name"));
				itemvo.setIt_price(rs.getInt("it_price"));
				itemvo.setIt_theme(rs.getString("it_theme"));
				itemvo.setIt_ingredient(rs.getString("it_ingredient"));
				itemvo.setIt_describe(rs.getString("it_describe"));
				itemvo.setIt_describe_simple(rs.getString("it_describe_simple"));
				
				CategoryVO categvo = new CategoryVO();	
				categvo.setCa_name(rs.getString("ca_name"));
				categvo.setCa_how_to_use(rs.getString("ca_how_to_use"));
				categvo.setCa_caution(rs.getString("ca_caution"));
				categvo.setCa_expired(rs.getString("ca_expired"));
				itemvo.setCategvo(categvo);
				
				ImageVO imgvo = new ImageVO();				
				imgvo.setImg_file(rs.getString("img_file"));
				itemvo.setImgvo(imgvo);
				
				infoList.add(itemvo);
				
			};
			
			
			
		} finally {
			close();
		}
		
		return infoList;
	}// end of public List<ImageVO> imageSelectAll() throws SQLException ------------

	
	// 쇼핑백 페이지에 보여지는 상품 정보 및 가격을 조회(select)하는 메소드
	@Override
	public List<ItemVO> shopBagInfoAll(Map<String, String> paraMap) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	
	// 장바구니 테이블에 제품 정보를 추가(insert)하는 메소드
	@Override
	public int insertCartItem(Map<String, String> paraMap) throws SQLException {
		
		int n = 0;
		int item_number = Integer.parseInt(paraMap.get("item_number"));
		int item_qty = Integer.parseInt(paraMap.get("item_qty"));
		
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into tbl_cart(ct_seq_no, fk_it_seq_no, order_qty) "
						+" values(SEQ_CART.nextval, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, item_number );
			pstmt.setInt(2, item_qty ); // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
		
			n = pstmt.executeUpdate();
			
			
		} finally {
			close();
		}
		
		return n;
		
	}

	// 장바구니에 tbl_cart의 정보를 조회(select)해주는 메소드
	@Override
	public List<CartVO> cartItemInfo(Map<String, String> paraMap) throws SQLException {
		
		List<CartVO> cartItemList = new ArrayList<>();
		
		int item_number = Integer.parseInt(paraMap.get("item_number"));
		
		try {
			conn = ds.getConnection();
			
			String sql = " select fk_it_seq_no, it_name, it_price "
					   + " from tbl_cart C join tbl_item I "
					   + " on C.fk_it_seq_no = I.it_seq_no "
					   + " where it_seq_no = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item_number);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			
				CartVO cartvo = new CartVO();
				
				cartvo.setFk_it_seq_no(rs.getInt("fk_it_seq_no"));
				
				ItemVO ivo = new ItemVO();
				
				ivo.setIt_price(rs.getInt("it_price"));
				ivo.setIt_name(rs.getString("it_name"));
				cartvo.setIvo(ivo);
				
				
				cartItemList.add(cartvo);
			};
			
		} finally {
			close();
		}
		
		return cartItemList;
		
	}// end of public List<CartVO> cartItemInfo(Map<String, String> paraMap) throws SQLException -----------

	
	
	

}
