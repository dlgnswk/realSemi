package wh.myshop.controller;

import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import wh.myshop.domain.*;
import wh.myshop.model.*;

public class Product_detailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		  String it_seq_no	= "14";
		  // String it_seq_no =  request.getParameter("it_seq_no");
		  
		  
		  
		  
		  ItemDAO pdao = new ItemDAO_imple();
		  
		  try { 
			  Map<String, String> paraMap = new HashMap<>();
			  paraMap.put("it_seq_no", it_seq_no);
			 
			  List<ItemVO> infoList = pdao.itemInfoAll(paraMap); 
			  
			  
			  request.setAttribute("infoList", infoList); 
			  
			  // System.out.println(infoList.get(0).getCategvo().getCa_name());
			  /*
			      for(ItemVO info : infoList) {
			   
				  System.out.println("infoList :" +info.getImgvo().getImg_file());
				  
			  }
			  */
			  request.setAttribute("it_seq_no", it_seq_no);
			  
			  super.setRedirect(false); 
			  super.setViewPage("/WEB-INF/wh/product_detail.jsp");
		  
		  } catch (SQLException e) {
			  e.printStackTrace();
		  
		  }
		 
		
	}

}
