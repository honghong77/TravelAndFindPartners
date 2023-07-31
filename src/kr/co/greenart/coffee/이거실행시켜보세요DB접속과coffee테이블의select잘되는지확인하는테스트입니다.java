package kr.co.greenart.coffee;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import kr.co.greenart.JSONmapper;

/*
	GET /coffee => 목록
	GET /coffee?no=#
		=> #번호(no)의 커피 정보
		=> 정수 형태가 아닌 경우 400 BAD REQUEST 응답
		=> 없는 번호인 경우 404 NOT FOUND 응답

	POST /coffee => 올바른 Json 포맷의 coffee 데이터를 DB의 행으로 추가. (201 응답코드 검색해보기)
 */

@WebServlet("/coffee")
public class 이거실행시켜보세요DB접속과coffee테이블의select잘되는지확인하는테스트입니다 extends HttpServlet {
	private final CoffeeDAO dao = new CoffeeDAO();
	private final JSONmapper jsonMapper = new JSONmapper(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		String message = null;
		int status = 0;
		try {
			if (no == null) {
				message = sendList();
				status = 200;
			} else {
				message = sendOne(Integer.parseInt(no));
				status = 200;
			}
		} catch (NumberFormatException e) {
			status = 400;
			message = sendError(status);
		} catch (NotFoundException e) {
			status = 404;
			message = sendError(status);
		} catch (Exception e) {
			e.printStackTrace();
			
			status = 500;
			message = sendError(status);
		}
		send(resp, status, message);
	}
	
	private void send(HttpServletResponse resp, int status, String json) throws IOException {
		resp.setStatus(status);
		resp.setHeader("Content-Type", "application/json;charset=utf-8");
		resp.getWriter().println(json);
	}
	
	private String sendOne(int no) throws Exception {
		Coffee coffee = dao.getByNo(no);
		String json = jsonMapper.writeJson(coffee);
		return json;
	}
	
	private String sendList() throws Exception {
		List<Coffee> list = dao.getAll();
		String json = jsonMapper.writeJson(list);
		return json;
	}
	
	private String sendError(int status) {
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode errorNode = mapper.createObjectNode();
		if (status == 500) {
			errorNode.put("message", "서버 요청 처리 중 에러가 발생했습니다.");
		} else if (status == 400) {
			errorNode.put("message", "잘못된 요청입니다. (올바른 정수값을 입력해주세요)");
		} else if (status == 404) {
			errorNode.put("message", "해당 번호의 정보가 존재하지 않습니다. (번호를 확인해주세요)");
		}
		errorNode.put("callNumber", "010-5039-5692");
		String errorMessage = "";
		try {
			errorMessage = jsonMapper.writeJson(errorNode);
		} catch (JsonProcessingException e) {
		}
		return errorMessage;
	}
}