package kr.kh.team3.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiteManagement;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public void postHandle(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Object handler, 
	    ModelAndView modelAndView)
	    throws Exception {
		SiteManagement user = (SiteManagement)modelAndView.getModel().get("user");//1
		if(user == null) {
			return;
		}
		request.getSession().setAttribute("user", user);//2

	}
}