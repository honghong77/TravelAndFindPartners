package companionBoard;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/companion")
public class ListController extends HttpServlet {
	private final static CompanionListDAO dao = new CompanionListDAO();
	private final static Jackson jackson = new Jackson();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tempPage = req.getParameter("page");
		int currendPage = 1;
		int totalData = dao.getCount();
		System.out.println("데이터 몇개? " + totalData);
		int totalPages = totalData % 9 == 0 ? totalData / 9 : (totalData / 9) + 1;
		List<Companion2> list = null;
		 
		// cPage(현재 페이지 정하기)
		if (tempPage == null || tempPage.length() == 0) {
			currendPage = 1;
		}
		try {
			currendPage = Integer.parseInt(tempPage);
		} catch (NumberFormatException e) {
			currendPage = 1;
		}
		
		if (totalPages == 0) {
		    totalPages = 1;
		}
		
		if (currendPage > totalPages) {
			currendPage = 1;
		}
		
		int start = (currendPage - 1) * 9;
		
		try {
			list = dao.getList(start);
			System.out.println("리스트 사이즈" + list.size());
			System.out.println("리스트" + list.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 페이지 처음과 끝을 지정하는 부분

		int currentBlock = currendPage % 5 == 0 ? currendPage / 5 : (currendPage / 5) + 1;
		int startPage = (currentBlock - 1) * 5 + 1;
		int endPage = startPage + (5 - 1);
		
		// 마지막 페이지 묶음에서 총 페이지수를 넘어가면 끝 페이지를 마지막 페이지 숫자로 지정
		if (endPage > totalPages) {
		    endPage = totalPages;
		}
		
		req.setAttribute("list", list);
		
		//리스트를 json형태로
		String json = jackson.convertListToJson(list);
		System.out.println("json : " + json);
		
		
		req.setAttribute("cPage", currendPage);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("json", json);
		
		req.getRequestDispatcher("accompany/companionList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}
