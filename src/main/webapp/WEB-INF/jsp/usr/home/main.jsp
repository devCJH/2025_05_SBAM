<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="메인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<script>
		const test = function() {
			$.ajax({
				url : '/usr/home/test',
				type : 'GET',
				data : {
					test1 : '비동기 테스트',
					test2 : 123
				},
				dataType : 'json',
				success : function (data) {
// 					$('#successMsg').html('<div>비동기 처리 성공! 그 결과는 -> ' + data + '</div>');
					$('#successMsg').html(`
							<div>비동기 처리 성공! 그 결과는 ->\${data}</div>
								
							`);
// 					console.log(data);
				},
				error : function (xhr, status, error) {
					console.log(error);
				}
			})
		}
		
	</script>

	<section class="mt-8">
		<div class="container mx-auto">
			<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex quam similique assumenda libero eligendi magni nulla officia doloremque sit nisi animi quaerat hic voluptatibus possimus necessitatibus nemo consectetur molestiae pariatur?</div>
			<div>안녕하세요</div>
			<div><button onclick="test();">비동기 테스트 버튼</button></div>
			<div id="successMsg">현재는 비동기 처리 안된 상태</div>
		</div>
	</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
