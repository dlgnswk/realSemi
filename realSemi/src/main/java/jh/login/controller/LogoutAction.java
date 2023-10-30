package jh.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class LogoutAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 로그아웃 처리하기
		
		// 세션 불러오기
		HttpSession session = request.getSession();
		
		// WAS 메모리 상에서 세션을 아예 삭제해버리기
		session.invalidate();

		super.setRedirect(true);
		super.setViewPage(request.getContextPath() + "/index.tam");
		
	}

}
