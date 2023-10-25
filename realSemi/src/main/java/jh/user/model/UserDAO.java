package jh.user.model;

import java.sql.SQLException;
import java.util.Map;

import jh.user.domain.UserVO;

public interface UserDAO {

	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴시켜주는 메소드(로그인 처리)
	UserVO selectOneMember(Map<String, String> paraMap) throws SQLException;

	// 휴면회원의 status를 1(활동중)로 변경하는 메소드
	void changeStatus(String sleepUserid) throws SQLException;

}
