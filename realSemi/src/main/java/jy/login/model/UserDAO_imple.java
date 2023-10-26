package jy.login.model;

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

import jy.login.domain.UserVO;
import my.util.security.AES256;
import my.util.security.SecretMyKey;
import my.util.security.Sha256;

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
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semi_oracle");

			aes = new AES256(SecretMyKey.KEY);
			// SecretMyKey.KEY 은 우리가 만든 암호화/복호화 키이다.

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원가입을 해주는 메소드 (tbl_user 테이블에 insert)
	@Override
	public int registerMember(UserVO user) throws SQLException {
		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " insert into tbl_user(userid, pwd, name, birthday, email, mobile, gender, postcode, address, detailaddress, extraaddress, status) "
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1) ";

			pstmt = conn.prepareStatement(sql);

			System.out.println("확인용 userDAO_imple user.getUserid() =>" + user.getUserid());

			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, Sha256.encrypt(user.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getBirthday());
			pstmt.setString(5, aes.encrypt(user.getUserid())); // 이메일을 AES256 알고리즘으로 양방향 암호화 시킨다.
			pstmt.setString(6, aes.encrypt(user.getMobile()));// 휴대폰번호를 AES256 알고리즘으로 양방향 암호화 시킨다.
			pstmt.setString(7, user.getGender());
			pstmt.setString(8, user.getPostcode());
			pstmt.setString(9, user.getAddress());
			pstmt.setString(10, user.getDetailaddress());
			pstmt.setString(11, user.getExtraaddress());

			result = pstmt.executeUpdate();

		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}// end of public int registerMember(UserVO user) throws SQLException
		// {}-------------------

	// ID 중복검사 (tbl_user 테이블에서 userid 가 존재하면 true를 리턴해주고, userid 가 존재하지 않으면 false를
	// 리턴한다)
	@Override
	public boolean idDuplicateCheck(Map<String, String> paraMap) throws SQLException {

		boolean isExists = false;

		try {
			conn = ds.getConnection();

			String sql = " select userid " + " from tbl_user " + " where userid = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("userid") + "@" + paraMap.get("userid_email"));

			rs = pstmt.executeQuery();

			isExists = rs.next(); // 행이 있으면(중복된 userid) true
									// 행이 없으면(사용 가능한 userid) false

		} finally {
			close();
		}

		return isExists;
	}// end of public boolean idDuplicateCheck(Map<String, String> paraMap) throws
		// SQLException {}------------------

	// 회원수정 전 Pwd 확인 (tbl_user 테이블에서 입력한 pwd 와 loginuser 의 pwd 와 같으면 true 리턴해줌)
	@Override
	public boolean pwdCheck(Map<String, String> paraMap) throws SQLException {

		boolean isMatch = false;

		try {
			conn = ds.getConnection();

			String sql = " select userid " + " from tbl_user " + " where userid = ? and pwd = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")));

			rs = pstmt.executeQuery();

			isMatch = rs.next(); // 행이 있으면(중복된 userid) true
									// 행이 없으면(사용 가능한 userid) false

		} finally {
			close();
		}

		return isMatch;
	}// end of public boolean pwdCheck(Map<String, String> paraMap) throws
		// SQLException {}---------------------------

	// 회원수정을 해주는 메소드 (tbl_user 테이블에 update)
	@Override
	public int updateUserInfo(UserVO user) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " update tbl_user set email = ? "
			        + "  				     , pwd= ? "
					+ "		   			     , gender = ? "
			        + "  				     , mobile = ? "
					+ "  				     , birthday = ? "
					+ "  				     , postcode = ? "
			        + "  				     , address = ? "
					+ "  				     , detailaddress = ? "
			        + "  				     , extraaddress = ? "
					+ "  				     , lastpwdchangedate = sysdate "
			        + " where userid = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, Sha256.encrypt(user.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
			pstmt.setString(3, aes.encrypt(user.getGender())); // 이메일을 AES256 알고리즘으로 양방향 암호화 시킨다.
			pstmt.setString(4, aes.encrypt(user.getMobile()));// 휴대폰번호를 AES256 알고리즘으로 양방향 암호화 시킨다.
			pstmt.setString(5, user.getBirthday());
			pstmt.setString(6, user.getPostcode());
			pstmt.setString(7, user.getAddress());
			pstmt.setString(8, user.getDetailaddress());
			pstmt.setString(9, user.getExtraaddress());
			pstmt.setString(10, user.getUserid());

			result = pstmt.executeUpdate();

		} catch (GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

}
