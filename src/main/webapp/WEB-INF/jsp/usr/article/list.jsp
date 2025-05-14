<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="목록" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<div class="table-box">
				<table class="w-full">
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
								<td class="hover:underline underline-offset-4"><a href="detail?id=${article.getId() }">${article.getTitle() }</a></td>
								<td>${article.getRegDate().substring(2, 16) }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="mt-3 text-sm btns flex">
				<div><a class="block" href="write">글쓰기</a></div>
			</div>
		</div>
	</section>
	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>