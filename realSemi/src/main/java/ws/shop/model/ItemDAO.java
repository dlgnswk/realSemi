package ws.shop.model;

import java.sql.SQLException;
import java.util.List;

import ws.shop.domain.CategoryVO;

public interface ItemDAO {

	// tbl_category 테이블에서 카테고리 아이디, 카테고리 이름, 사용방법, 주의사항, 사용기한을 조회해오기
	List<CategoryVO> searchCategoryList() throws SQLException;

}
