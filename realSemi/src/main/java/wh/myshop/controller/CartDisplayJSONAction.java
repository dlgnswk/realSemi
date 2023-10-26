package wh.myshop.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

import common.controller.AbstractController;
import wh.myshop.model.*;
import wh.myshop.domain.*;


public class CartDisplayJSONAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String item_number = request.getParameter("number"); // 제품 번호
		String item_qty = "1";
		
		// System.out.println("item_number : " + item_number);
		
		ItemDAO pdao = new ItemDAO_imple();
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("item_number", item_number);	// "14"
		paraMap.put("item_qty", item_qty);	// "1"
		
		
		int n = pdao.insertCartItem(paraMap);
		
		if(n == 1) {
			
			List<CartVO> cartItemList = pdao.cartItemInfo(paraMap); 
			
			JSONArray jsonArr = new JSONArray(); //	[] 형태로 만들어줌
			
			
			if( cartItemList.size() > 0 ) {
				// DB 에서 조회해온 결과물이 있을 경우
				
				for(CartVO cartvo : cartItemList) {
					
					JSONObject jsonObj = new JSONObject();	// {}
					
					jsonObj.put("fk_it_seq_no", cartvo.getFk_it_seq_no());			
					jsonObj.put("it_name", cartvo.getIvo().getIt_name());	
					jsonObj.put("it_price", cartvo.getIvo().getIt_price());	
				
					
					
					jsonArr.put(jsonObj);	// [{"pnum":1, "pname":"스마트TV", "cname":"전자제품" ... ... ... "pinputdate":"2023-10-19"},{},{},{}..., "discountPercent": 15] 반복
					
					// System.out.println("jsonObj : " + jsonObj);
					
					
				}// end of for----------------------------------------
				
			}// end of if------------------------------------------------------
			
			//System.out.println("jsonArr : " + jsonArr);
			
			String json = jsonArr.toString();
			//System.out.println("json : " + json);
			
			request.setAttribute("json", json);
			
			
		}	
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/wh/jsonview.jsp");
		
		
	}

}
