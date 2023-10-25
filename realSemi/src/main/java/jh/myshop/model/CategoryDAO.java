package jh.myshop.model;

import java.sql.SQLException;
import java.util.List;

import jh.myshop.domain.CategoryVO;

public interface CategoryDAO {
	
	// 각 카테고리의 이름과 제품 개수를 가져오는 메소드
	List<CategoryVO> categoryCount() throws SQLException;

	// 카테고리의 사진을 가져오는 메소드
	List<CategoryVO> categoryHeader() throws SQLException;
	
	
	
}
