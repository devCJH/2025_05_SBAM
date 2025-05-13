<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="목록" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
	
	<table border=1>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articles }" var="article">
				<tr>
					<td>${article.getId() }</td>
					<td><a href="detail?id=${article.getId() }">${article.getTitle() }</a></td>
					<td>${article.getRegDate().substring(2, 16) }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>