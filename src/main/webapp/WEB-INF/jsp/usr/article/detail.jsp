<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<div class="table-box">
				<table class="w-full">
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
						<th>작성자</th>
						<td>${article.getWriterName() }</td>
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
			</div>
			
			<div class="mt-3 text-sm btns flex">
				<div><button onclick="history.back();">뒤로가기</button></div>
				<c:if test="${article.getMemberId() == sessionScope.loginedMemberId }">
					<div class="mx-2"><a class="block" href="modify?id=${article.getId() }">수정</a></div>
					<div><a class="block" href="delete?id=${article.getId() }" onclick="if(confirm('정말로 삭제하시겠습니까?') == false) return false;">삭제</a></div>
				</c:if>
			</div>
		</div>
	</section>
	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>