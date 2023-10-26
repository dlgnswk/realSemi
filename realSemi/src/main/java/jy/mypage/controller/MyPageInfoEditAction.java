package jy.mypage.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jy.login.domain.UserVO;
import jy.login.model.UserDAO;
import jy.login.model.UserDAO_imple;

public class MyPageInfoEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.setViewPage("/WEB-INF/jy/mypage/mypageInfo_edit.jsp");
/*		
		if(super.checkLogin(request)) {
			
			HttpSession session = request.getSession();
			UserVO loginuser = (UserVO) session.getAttribute("loginuser");
			
			// 입력받은 비밀번호
			String pwd = request.getParameter("pwd");
			String userid = loginuser.getUserid();
			
			Map<String, String> paraMap = new HashMap <>();
			paraMap.put("pwd", pwd);
			paraMap.put("userid", userid);
			
			UserDAO udao = new UserDAO_imple();
			
			boolean isMatch =  udao.pwdCheck(paraMap);
			
			if(isMatch) {
				request.setAttribute("userid", userid);
				request.setAttribute("name", loginuser.getName());
				request.setAttribute("mobile", loginuser.getMobile());
				request.setAttribute("postcode", loginuser.getPostcode());
				request.setAttribute("address", loginuser.getAddress());
				request.setAttribute("detailaddress", loginuser.getDetailaddress());
				request.setAttribute("extraaddress", loginuser.getExtraaddress());
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jy/login/mypageInfo_edit.jsp");
			}
			
			else {
				
				String message = "비밀번호가 일치하지 않습니다";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jy/msg.jsp");
			}
			
		}
*/		
		
	}

}
