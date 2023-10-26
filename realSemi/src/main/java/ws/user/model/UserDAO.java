package ws.user.model;

import java.sql.SQLException;
import java.util.Map;

import ws.shop.domain.OrderVO;

public interface UserDAO {

	// 주문완료된 회원의 정보를 리턴시켜오는 가져오는 메소드 
	OrderVO noticeDisplay(Map<String, String> paraMap) throws SQLException;
}
