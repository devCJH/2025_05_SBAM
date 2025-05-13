<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<div>게시물 상세보기</div>
	
	<div>
		<div><a href="/">로고</a></div>
		<ul>
			<li><a href="/">HOME</a></li>
			<li><a href="/usr/article/list">LIST</a></li>
		</ul>
	</div>
	
	<table border=1>
		<tr>
			<th>번호</th>
			<td>${article.getId() }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${article.getRegDate().substring(2, 16) }</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td>${article.getUpdateDate().substring(2, 16) }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${article.getTitle() }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${article.getContent() }</td>
		</tr>
	</table>
	
	<div>
		<div><button onclick="history.back();">뒤로가기</button></div>
	</div>
</body>
</html>