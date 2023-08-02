<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국가 목록</title>
</head>
<body>
	<c:if test="${ not empty list }">
		<ul>
			<c:forEach var="country" items="${ list }">
				<li>${ country.name }: ${ country.population }</li>
			</c:forEach>
		</ul>

		<nav>
			<c:forEach var="page" begin="1" end="${ totalPage }">
				<c:url var="url" value="country.jsp">
					<c:param name="page">${ page }</c:param>
				</c:url>
				<a href="${ url }">[${ page }]</a>
			</c:forEach>
			<%-- <c:otherwise>
		<c:forEach var="page" begin="1" end="3">
				<c:url var="url" value="forwordContatinent.jsp">
					<c:param name="page">${ page }</c:param>
				</c:url>
				<a href="${ url }">[${ page }]</a>
			</c:forEach>
		</c:otherwise> --%>
		</nav>

	</c:if>
</body>
</html>