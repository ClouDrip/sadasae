package com.sada.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.sada.model.MemberVO;

public class CartInterceptor implements HandlerInterceptor {

	@Override  // "/cart/**" url을 이용하는 사용자가 요청을 하였을 때 Controller로 요청이 가기 전 요청자가 로그인을 하였는지 확인 한하는 것입니다
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		
		if(mvo == null) {
			response.sendRedirect("/main");  //로그인을 하였다면 정상적으로 요청이 Controller로 갈 것이고, 하지 않았다면 메인 페이지로 리다이렉트 할 것입니다.
			return false;
		} else {
			return true;
		}
		
	}

	
}
