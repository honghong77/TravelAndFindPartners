package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/reply")
public class CORSFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		throws IOException, ServletException {
		HttpServletResponse resp = (HttpServletResponse) response;

		resp.setHeader("Access-Control-Allow-Origin", "*"); 
		// 모든 서버에서의 요청

		resp.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS"); 
		// 구현한 메소드 방식을 쉼표로 구분해서 / options추가

		resp.setHeader("Access-Control-Allow-Headers", "*");
		// 허용 헤더 설정

		resp.setHeader("Access-Control-Max-Age", "3600");
		// 시간값 설정
		
		chain.doFilter(request, response); // 원래 흐름으로
	}
}