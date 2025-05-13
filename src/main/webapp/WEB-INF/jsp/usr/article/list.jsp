<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
	<div>게시물 목록</div>
	
	<div>
		<div><a href="/">로고</a></div>
		<ul>
			<li><a href="/">HOME</a></li>
			<li><a href="/usr/article/list">LIST</a></li>
		</ul>
	</div>
	
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
</body>
</html>