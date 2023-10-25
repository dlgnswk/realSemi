package jh.myshop.model;

import java.sql.SQLException;

public interface ItemDAO {

	// ca_id(카테고리번호)이 tbl_category 테이블에 존재하는지 존재하지 않는지 알아오기
	boolean isExist_ca_id(String ca_id) throws SQLException;

}
