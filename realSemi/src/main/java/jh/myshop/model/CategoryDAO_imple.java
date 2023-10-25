package jh.myshop.model;

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

import jh.myshop.domain.CategoryVO;

public class CategoryDAO_imple implements CategoryDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public CategoryDAO_imple() {
			
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

	// 카테고리 갯수 가져오는 메소드
	@Override
	public List<CategoryVO> categoryCount() throws SQLException {
		
		List<CategoryVO> cateList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ca_name, ca_id, count(*) "
					   + " from tbl_category V "
					   + " join tbl_item C "
					   + " on V.ca_id = C.fk_ca_id "
					   + " group by ca_name, ca_id "
					   + " order by ca_name desc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CategoryVO cavo = new CategoryVO();
				
				cavo.setCa_name(rs.getString(1));
				cavo.setCa_id(rs.getString(2));
				cavo.setCa_count(rs.getInt(3));
				
				cateList.add(cavo);
				
			}// end of while(rs.next())
			
		} finally {
			close();
		}
		
		return cateList;
	}

	
	// 카테고리의 사진을 가져오는 메소드
	@Override
	public List<CategoryVO> categoryHeader() throws SQLException {

		List<CategoryVO> categoryImgList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ca_id, ca_name, ca_img_file "
					   + " from tbl_category "
					   + " order by ca_name desc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CategoryVO cavo = new CategoryVO();

				cavo.setCa_id(rs.getString(1));
				cavo.setCa_name(rs.getString(2));
				cavo.setCa_img_file(rs.getString(3));
				
				categoryImgList.add(cavo);
				
			}// end of while(rs.next())
			
		} finally {
			close();
		}
		
		return categoryImgList;
	}

}
