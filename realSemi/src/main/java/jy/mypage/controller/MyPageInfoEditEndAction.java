package jy.mypage.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jy.login.domain.UserVO;
import jy.login.model.UserDAO;
import jy.login.model.UserDAO_imple;

public class MyPageInfoEditEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if("post".equalsIgnoreCase(method)) {
			// **** POST 방식으로 넘어온 것이라면 *** //
			
			String userid = request.getParameter("userid");
			String email = request.getParameter("email");			
			String pwd = request.getParameter("pwd");
			String gender = request.getParameter("gender");
			String name = request.getParameter("name");
			String mobile = request.getParameter("mobile");
			String birthday = request.getParameter("birthday");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String detailaddress = request.getParameter("detailaddress");
			String extraaddress = request.getParameter("extraaddress");
			
			UserVO user = new UserVO(userid, email, pwd, name, birthday, mobile, gender, postcode, address, detailaddress, extraaddress);
			
			UserDAO udao = new UserDAO_imple();
			
			// === 회원수정이 성공되어지면 "회원수정 성공" 이라는 alert를 띄우고 시작페이지로 이동한다. === //						
			
					String message = "";
					String loc = "";
					
					try {
						int n = udao.updateUserInfo(user);
						
						if(n==1) {
							
							// !!!! session 에 저장된 loginuser 를 변경된 사용자의 정보값으로 변경해주어야 한다. !!!!
							HttpSession session = request.getSession();
							UserVO loginuser = (UserVO)session.getAttribute("loginuser");
							loginuser.setEmail(email);
							loginuser.setPwd(pwd);
							loginuser.setGender(gender);
							loginuser.setName(name);
							loginuser.setMobile(mobile);						
							loginuser.setPostcode(postcode);
							loginuser.setAddress(address);
							loginuser.setDetailaddress(detailaddress);
							loginuser.setExtraaddress(extraaddress);
							loginuser.setSt_userid(userid);
							
							message = "회원정보 수정 성공!!";
							loc = request.getContextPath()+"/mypage/myPagePwd.tam";// 시작페이지로 이동한다.
						}
						
					} catch(SQLException e){
						message = "SQL 구문 에러발생";
						loc = "javascript:history.back()";// 자바스크립트를 이용한 이전페이지로 이동하는 것.
						e.printStackTrace();
					}
						
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jy/msg.jsp");
				
			}
		
		else {
			// "GET" 방식으로 들어올 경우
			String message = "올바른 접근이 아닙니다";
			String loc = request.getContextPath()+"/mypage/myPagePwd.tam";// 시작페이지로 이동한다.
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jy/msg.jsp");
		}
			
		}

}
