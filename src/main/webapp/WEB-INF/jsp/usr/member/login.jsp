<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<script>
		const loginFormChk = function (form) {
			form.loginId.value = form.loginId.value.trim();
			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginId.value.length == 0) {
				alert('아이디는 필수 입력 정보입니다');
				form.loginId.focus();
				return false;
			}
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호는 필수 입력 정보입니다');
				form.loginPw.focus();
				return false;
			}
			
			return true;
		}
	</script>

	<section class="mt-8">
		<div class="container mx-auto">
			<form action="doLogin" method="post" onsubmit="return loginFormChk(this);">
				<div class="table-box">
					<table class="w-full">
						<tr>
							<th>아이디</th>
							<td><input class="border w-full" name="loginId" type="text" /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="border w-full" name="loginPw" type="text" /></td>
						</tr>
						<tr>
							<td colspan="2"><button class="submitBtn w-32">로그인</button></td>
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