package wh.myshop.controller;

import java.sql.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import wh.myshop.domain.*;
import wh.myshop.model.*;
public class Cart_detailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String cart_it_name = request.getParameter("name");
		String cart_it_qty = request.getParameter("quantity");
		
		ItemDAO pdao = new ItemDAO_imple();
		try { 
			  Map<String, String> paraMap = new HashMap<>();
			  paraMap.put("cart_it_name", cart_it_name);
			  paraMap.put("cart_it_qty", cart_it_qty);
			  
			  List<ItemVO> shopBagList = pdao.shopBagInfoAll(paraMap); 
		  
			  request.setAttribute("shopBagList", shopBagList); 
			  
			  // System.out.println(infoList.get(0).getCategvo().getCa_name());
			  /*
			      for(ItemVO info : infoList) {
			   
				  System.out.println("infoList :" +info.getImgvo().getImg_file());
				  
			  }
			  */
			  super.setRedirect(false); 
			  super.setViewPage("/WEB-INF/wh/cart_detail.jsp");
		  
		  } catch (SQLException e) {
			  e.printStackTrace();
		  
		  }
		 
		
		
		
		
	}

}
