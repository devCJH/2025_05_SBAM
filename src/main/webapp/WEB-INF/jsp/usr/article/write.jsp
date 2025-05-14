<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="작성" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">
			<form action="doWrite" method="post">
				<div class="table-box">
					<table class="w-full">
						<tr>
							<th>제목</th>
							<td><input class="border w-full" name="title" type="text" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="border w-full" name="content"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><button class="submitBtn w-32">저장</button></td>
						</tr>
					</table>
				</div>
			</form>
			
			<div class="mt-3 text-sm btns flex">
				<div class="mr-2"><button onclick="history.back();">뒤로가기</button></div>
			</div>
		</div>
	</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>