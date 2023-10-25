package jh.myshop.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jh.myshop.domain.*;
import jh.myshop.model.*;

public class CategoryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String ca_id = request.getParameter("ca_id"); // 카테고리 아이디
		
		ItemDAO itdao = new ItemDAO_imple();
		
		if(!itdao.isExist_ca_id(ca_id)) {
			// 입력받은 ca_id이 DB에 존재하지 않는 경우는 사용자가 장난친 경우
			super.setRedirect(true);
			super.setViewPage(request.getContextPath() + "/index.tam");
		}
		else{
			// 입력받은 ca_id가 DB에 존재하는 경우
			
			ImageDAO imgdao = new ImageDAO_imple();

			try {
				
				List<ImageVO> imgList = imgdao.imageSelectOne(ca_id);
				request.setAttribute("imgList", imgList);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jh/category/category.jsp");
				
			} catch (SQLException e) {
				e.printStackTrace();
				super.setRedirect(true);
				super.setViewPage(request.getContextPath() + "/error.tam");
			}
			
		}
		
	}

}
