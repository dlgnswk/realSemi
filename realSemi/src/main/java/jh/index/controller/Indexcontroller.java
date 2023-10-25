package jh.index.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jh.myshop.domain.*;
import jh.myshop.model.*;


public class Indexcontroller extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ImageDAO imgdao = new ImageDAO_imple();
		CategoryDAO cadao = new CategoryDAO_imple();

		try {
			
			List<ImageVO> imgList = imgdao.imageSelectOne();
			request.setAttribute("imgList", imgList);
			
			List<CategoryVO> cateList = cadao.categoryCount();
			request.setAttribute("cateList", cateList);
			
			List<CategoryVO> cateImgList = cadao.categoryHeader();
			request.setAttribute("cateImgList", cateImgList);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jh/index.jsp");
			
		} catch (SQLException e) {
			e.printStackTrace();
			super.setRedirect(true);
			super.setViewPage(request.getContextPath() + "/error.tam");
		}
		
	}
	
}
