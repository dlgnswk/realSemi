package ws.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import ws.shop.domain.OrderVO;

public class UserDAO_imple implements UserDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 복호화 정의하면 public UserDAO_imple() 에 넣어주기
	
	
	// 생성자
		public UserDAO_imple() {
			try {
				Context initContext = new InitialContext();
				Context envContext  = (Context)initContext.lookup("java:/comp/env");
				ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
				
				// 복호화 정의하면 public UserDAO_imple() 에 넣어주기
				
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
	   
	// 주문완료된 회원의 정보를 리턴시켜오는 가져오는 메소드
	@Override
	public OrderVO noticeDisplay(Map<String, String> paraMap) throws SQLException {

		OrderVO order = null;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select userid as 주문자 "
					   + "     , email as 주문자이메일 "
					   + "     , it_name as 제품명 "
					   + "     , it_volume as 용량 "
					   + "     , it_price as 단가 "
					   + "     , sh_name as 수령인 "
					   + "     , sh_mobile as 수령인_전화번호 "
					   + "     , sh_postcode as 수령인_우편번호 "
					   + "     , sh_address as 수령인_주소 "
					   + "     , to_char(order_date,'yyyy-mm-dd') as 주문일자 "
					   + "     , o_price as 주문금액 "
					   + "     , o_qty as 주문수량 "
					   + " from tbl_order O "
					   + " join "
					   + " tbl_user U "
					   + " on O.fk_userid = U.userid "
					   + " join tbl_item I "
					   + " on I.it_seq_no = O.fk_it_seq_no "
					   + " join tbl_detail D "
					   + " on O.order_seq_no = D.fk_order_seq_no "
					   + " where fk_userid = ? ";
			
			
		} catch (Exception e) {
			
		} finally {
			close();
		}
		
		return order;
	}
	

}
