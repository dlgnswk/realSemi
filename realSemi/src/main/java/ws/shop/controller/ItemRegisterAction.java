package ws.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ws.common.controller.AbstractController;
import ws.member.domain.UserVO;
import ws.shop.domain.CategoryVO;
import ws.shop.model.ItemDAO;
import ws.shop.model.ItemDAO_imple;

public class ItemRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//HttpSession session = request.getSession(); // 아직 안씀
		
		//UserVO loginuser = (UserVO)session.getAttribute("loginuser"); // 아직 안씀
		
		
		/*
		if(loginuser != null && "admin".equals(loginuser.getUserid()) ) {
			// 관리자로 로그인함.
			String method = request.getMethod();
			if(!"POST".equalsIgnoreCase(method)) { // get
				
			}
			else {									// post
				
			}
		*/	
			ItemDAO idao = new ItemDAO_imple();
			
			List<CategoryVO> categoryList = idao.searchCategoryList();
			
			request.setAttribute("categoryList", categoryList);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/ws/mypage/admin/itemRegister.jsp");
		/*	
		}
		else {
			String message = "관리자만 접근이 가능합니다.";
			String loc = "";
		      
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
		      
		    // super.setRedirect(false);
			super.setViewPage("/WEB-INF/index.jsp");
		}
		
		
		*/
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/ws/mypage/admin/itemRegister.jsp");
		
	}

}
