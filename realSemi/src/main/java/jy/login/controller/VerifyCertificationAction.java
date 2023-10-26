package jy.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;

public class VerifyCertificationAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
			if("post".equalsIgnoreCase(method)) {
				
				String inputCode = request.getParameter("inputCode");
				System.out.println("inputcode=>"+inputCode);
				
				HttpSession session = request.getSession(); // 세션불러오기 
				String certification_code = (String) session.getAttribute("certification_code"); 
				
				boolean isMatch = false;
				
				if(inputCode.equals(certification_code)) {
					isMatch = true;
				}
				
				JSONObject jsonObj = new JSONObject(); // {}
				jsonObj.put("isMatch",isMatch); // {"isExists":true} 또는 {"isExists":false} 으로 만들어 준다.
				
				String json = jsonObj.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어 준다.
				String any = jsonObj.toString();
				
				
				System.out.println(">>> 확인용 json => "+json);
			//	>>> 확인용 json => {"isExists":true}
			//	>>> 확인용 json => {"isExists":false}
				
				request.setAttribute("json", json);
				
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/jy/jsonview.jsp");
				
					
			
		}// end of if("POST".equalsIgnoreCase(method))------------
		
	}

}
