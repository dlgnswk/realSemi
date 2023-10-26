package ws.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ws.common.controller.AbstractController;
import ws.shop.domain.OrderVO;
import ws.user.model.UserDAO;
import ws.user.model.UserDAO_imple;

public class PaymentEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserDAO mdao = new UserDAO_imple();
		
		String userid; //지울거
		
		Map<String, String> paraMap = new HashMap<>();
		//paraMap.put("userid",userid);
		
		/*HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");*/

		// 주문완료된 회원의 정보를 리턴시켜오는 가져오는 메소드
		OrderVO orderUser = mdao.noticeDisplay(paraMap);

		
		//request.setAttribute("noticeList", noticeList);
		
		
		
		
		
		
	//  super.setRedirect(false);
		super.setViewPage("/WEB-INF/ws/order/paymentEnd.jsp");
	}

}
