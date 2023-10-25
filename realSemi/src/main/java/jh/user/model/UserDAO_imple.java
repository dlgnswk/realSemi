package jh.user.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jh.user.domain.*;
import my.util.security.*;

public class UserDAO_imple implements UserDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	// 생성자
	public UserDAO_imple() {
			
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
			
		    aes = new AES256(SecretMyKey.KEY);
		    // SecretMyKey.KEY 은 우리가 만든 암호화/복호화 키이다.
		    
		} catch(NamingException e) {
				e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
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

	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴시켜주는 메소드(로그인 처리)
	@Override
	public UserVO selectOneMember(Map<String, String> paraMap) throws SQLException {

		UserVO user = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " SELECT userid, name, birthday, email, mobile, gender, postcode, address, detailaddress, extraaddress, registerdate, pwdchangegap "
					   + "      , nvl( lastlogingap, trunc(months_between(sysdate, to_date(registerdate, 'yyyy-mm-dd'))) ) AS lastlogingap, status "
					   + " FROM "
					   + " ( "
					   + "     select userid, name, birthday, email, mobile, gender, postcode, address, detailaddress, extraaddress"
					   + "          , to_char(registerdate, 'yyyy-mm-dd') AS registerdate, trunc(months_between(sysdate, last_pwd_changedate)) AS pwdchangegap, status "
					   + " 	   from tbl_user "
					   + " 	   where status = 1 and userid = ? and pwd = ? "
					   + " ) M "
					   + " CROSS JOIN "
					   + " ( "
					   + "     select trunc(months_between(sysdate, max(login_date))) AS lastlogingap "
					   + "     from tbl_login_log "
					   + "     where fk_userid = ? "
					   + " ) H ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")) );
			pstmt.setString(3, paraMap.get("userid"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				// userid, name, birthday, email, mobile, gender, postcode
				// address, detailaddress, extraaddress, registerdate, pwdchangegap, lastlogingap, status
				
				user = new UserVO(); 
				
				user.setUserid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setBirthday(rs.getString(3));
				user.setEmail(aes.decrypt(rs.getString(4)));
				user.setMobile(aes.decrypt(rs.getString(5)));
				user.setGender(rs.getString(6));
				user.setPostcode(rs.getString(7));
				user.setAddress(rs.getString(8));
				user.setDetailaddress(rs.getString(9));
				user.setExtraaddress(rs.getString(10));
				user.setRegisterdate(rs.getString(11));
				user.setStatus(rs.getInt(14));
				
				if(rs.getInt(14) == 1 && rs.getInt(12) >= 3) {
					// 휴면이 아니면서
					// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
					// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false
					
					user.setRequirePwdChange(true); // 로그인 시 암호를 변경하라는 alert 를 띄우도록 할 때 사용한다.
				}
				
				
				if(rs.getInt(14) == 1 && rs.getInt(13) >= 12) {
					// 휴면이 아니면서
					// 마지막으로 로그인 한 날짜시간이 현재 시각으로부터 1년이 지났으면 휴면 처리하겠다.
					
					user.setStatus(2);
					
					// === tbl_member 테이블의 status 컬럼의 값을 2로 변경하기 ===
					sql = " update tbl_user set status = 2 "
						+ " where userid = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, paraMap.get("userid"));
					
					pstmt.executeUpdate();
					
				}
				
				// === 휴면이 아닌 회원만 tbl_loginhistory(로그인기록) 테이블에 insert 하기 === //
				if(rs.getInt(14) == 1) {
					
					
					
					sql= " insert into tbl_login_log(login_date, fk_userid, login_ip) "
						+" values(sysdate, ?, ?) ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, paraMap.get("userid"));
					pstmt.setString(2, paraMap.get("login_ip"));
					
					pstmt.executeUpdate();
				
				}
				
			} // end of if(rs.next())-----------------------------------------------
			
		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return user;
		
	}

	
	// 휴면회원의 status를 1(활동중)로 변경하는 메소드
	@Override
	public void changeStatus(String sleepUserid) throws SQLException {
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_user set status = 1 "
				       + " where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sleepUserid);
			
			pstmt.executeUpdate();
		
		} finally {
			close();
		}
	}

}
