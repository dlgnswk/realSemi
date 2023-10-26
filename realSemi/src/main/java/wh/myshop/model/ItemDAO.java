package wh.myshop.model;

import java.sql.SQLException;
import java.util.*;

import wh.myshop.domain.*;

public interface ItemDAO {

	// 상세페이지에 보여지는 상품 정보를 모두 조회(select)하는 메소드 
	List<ItemVO> itemInfoAll(Map<String, String> paraMap) throws SQLException;

	// 쇼핑백 페이지에 보여지는 상품 정보 및 가격을 조회(select)하는 메소드
	List<ItemVO> shopBagInfoAll(Map<String, String> paraMap) throws SQLException;

	
	// 장바구니 테이블에 제품 정보를 추가(insert)하는 메소드
	int insertCartItem(Map<String, String> paraMap) throws SQLException;

	
	// 장바구니에 tbl_cart의 정보를 조회(select)해주는 메소드
	List<CartVO> cartItemInfo(Map<String, String> paraMap) throws SQLException;

	
	
	
}
