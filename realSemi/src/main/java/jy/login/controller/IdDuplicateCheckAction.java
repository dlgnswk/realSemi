package jy.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jy.login.model.UserDAO;
import jy.login.model.UserDAO_imple;

public class IdDuplicateCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); // "GET" 또는 "POST"
		
		if("post".equalsIgnoreCase(method)) {
			
			String userid = request.getParameter("userid");
			String userid_email = request.getParameter("userid_email");
			
			Map<String, String> paraMap = new HashMap<> ();
			paraMap.put("userid", userid);
			paraMap.put("userid_email", userid_email);
			
			UserDAO mdao = new UserDAO_imple();
			
			boolean isExists = mdao.idDuplicateCheck(paraMap);
			
			JSONObject jsonObj = new JSONObject(); // {}
			jsonObj.put("isExists",isExists); // {"isExists":true} 또는 {"isExists":false} 으로 만들어 준다.
			
			String json = jsonObj.toString(); // 문자열 형태인 "{"isExists":true}" 또는 "{"isExists":false}" 으로 만들어 준다.
			
			System.out.println(">>> 확인용 json => "+json);
		//	>>> 확인용 json => {"isExists":true}
		//	>>> 확인용 json => {"isExists":false}
			
			request.setAttribute("json", json);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/jy/jsonview.jsp");
			
		}		
		
	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception-------------

}
