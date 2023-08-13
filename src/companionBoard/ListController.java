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
		String search = req.getParameter("search");
		String concept = req.getParameter("concept");
		int totalData = 0;
		List<Companion2> list = null;
		
		System.out.println("파라미터 : " + tempPage);
		System.out.println("파라미터 : " + search);
		System.out.println("파라미터 : " + concept);
		
		if (search == null || search.trim().equals("")) {
			if (concept == null || concept.trim().equals("")) {
				totalData = dao.getCount();
				System.out.println("1111");
				
			} else {
				totalData = dao.getConceptCount(concept);
				System.out.println("2222");
			}
		} else {
			if (concept == null || concept.trim().equals("")) {
				totalData = dao.getSearchCount(search);
				System.out.println("3333");
			} else {
				totalData = dao.getSearchConceptCount(concept, search);
				System.out.println("4444");
			}
		}
		System.out.println("totalData : " + totalData);
		
		int currendPage = 1;
		int totalPages = totalData % 9 == 0 ? totalData / 9 : (totalData / 9) + 1;
		
		// cPage(현재 페이지 정하기)
		if (tempPage == null
				|| tempPage.length() == 0) {
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
		
		// 페이지 처음과 끝을 지정하는 부분

		int currentBlock = currendPage % 5 == 0 ? currendPage / 5 : (currendPage / 5) + 1;
		int startPage = (currentBlock - 1) * 5 + 1;
		int endPage = startPage + (5 - 1);
				
		// 마지막 페이지 묶음에서 총 페이지수를 넘어가면 끝 페이지를 마지막 페이지 숫자로 지정
		if (endPage > totalPages) {
			endPage = totalPages;
		}
		
		int start = (currendPage - 1) * 9;
		
		try {
			if (search == null || search.trim().equals("")) {
				if (concept == null || concept.trim().equals("")) {
					list = dao.getList(start);
				} else {
					list = dao.getConceptList(start, concept);
				}
			} else {
				if (concept == null || concept.trim().equals("")) {
					list = dao.getSearchList(start, search);
				} else {
					list = dao.getSearchConceptList(start, concept, search);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// System.out.println(list);

		req.setAttribute("list", list);
		
		//리스트를 json형태로
	
		String json = jackson.convertListToJson(list);
		
		req.setAttribute("cPage", currendPage);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("json", json);
		
		req.getRequestDispatcher("/WEB-INF/accompany/companionList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
