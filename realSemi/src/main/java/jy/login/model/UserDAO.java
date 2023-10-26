package jy.login.model;

import java.sql.SQLException;
import java.util.Map;

import jy.login.domain.UserVO;

public interface UserDAO {
	
	// 회원가입을 해주는 메소드 (tbl_user 테이블에 insert)
	int registerMember(UserVO user) throws SQLException;

	// ID 중복검사 (tbl_user 테이블에서 userid 가 존재하면 true를 리턴해주고, userid 가 존재하지 않으면 false를 리턴한다)
	boolean idDuplicateCheck(Map<String, String> paraMap) throws SQLException;

	// Pwd 확인 (tbl_user 테이블에서 입력한 pwd 와 loginuser 의 pwd 와 같으면 true 리턴해줌)
	boolean pwdCheck(Map<String, String> paraMap) throws SQLException;

	// 회원수정을 해주는 메소드 (tbl_user 테이블에 update)
	int updateUserInfo(UserVO user) throws SQLException;
	
}
