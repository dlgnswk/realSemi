package ws.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import ws.shop.domain.CategoryVO;

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


	   
	// tbl_category 테이블에서 카테고리 아이디, 카테고리 이름, 사용방법, 주의사항, 사용기한을 조회해오기
	@Override
	public List<CategoryVO> searchCategoryList() throws SQLException {
		
		List<CategoryVO> categoryList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = " select ca_id, ca_name, ca_how_to_use, ca_caution, ca_expired "
				       + " from tbl_category ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CategoryVO cvo = new CategoryVO();
				cvo.setCa_id(rs.getString(1));
				cvo.setCa_name(rs.getString(2));
				cvo.setCa_how_to_use(rs.getString(3));
				cvo.setCa_caution(rs.getString(4));
				cvo.setCa_expired(rs.getString(5));
				
				categoryList.add(cvo);
			} // end of while(rs.next())------------
			
		} finally {
			close();
		}
		return categoryList;
	}
	   
	   
	   
	   
	   
}
