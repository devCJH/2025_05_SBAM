<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="메인" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<script>
		let stompClient = null;

	    const connect = function () {
	    	let userId = $('#sender').text();
	    	let socket = new SockJS('/ws-stomp');
			stompClient = Stomp.over(socket);
			
			stompClient.connect({}, function (frame) {
				stompClient.subscribe('/sub/' + userId, function (message) {
					let notificationDiv = $('#notifications');
					notificationDiv.append(`<div>\${message.body }</div>`);
				})
			})
	    }
	    
	    const sendMessage = function () {
	    	let recipient = $('#recipient').val();
	    	let content = $('#content').val();
	    	let message = {
	            recipient: recipient,
	            content: content
	        };
	        stompClient.send("/pub/send", {}, JSON.stringify(message));
	    }
	
	    $(function () {
	        connect();
	        $('#sendNotification').click(function () {
	            sendMessage();
	        });
	    });
		
	</script>

	<section class="mt-8">
		<div class="container mx-auto">
			<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex quam similique assumenda libero eligendi magni nulla officia doloremque sit nisi animi quaerat hic voluptatibus possimus necessitatibus nemo consectetur molestiae pariatur?</div>
			<div>안녕하세요</div>
			
			<br />
			<hr />
			<br />
			
			<div>
				<div>알림테스트</div>
				<div>현재 로그인된 회원의 ID : <span id="sender">${req.getLoginedMember().getId() }</span></div>
				<label>
					알림을 받을 사용자 ID : 
					<input class="input input-bordered" id="recipient" type="text">
				</label>
				<br />
				<label>
					알림으로 보낼 메시지 : 
					<input class="input input-bordered" id="content" type="text">
				</label>
				<br />
				
				<button class="btn btn-neutral btn-outline btn-xs" id="sendNotification">알림 보내기</button>
				
				<div>알림으로 받은 메시지 내용</div>
				<div id="notifications"></div>
			</div>
			
			<br />
			<hr />
			<br />
		
			<div>
				<div>
					<form action="upload" method="post" enctype="multipart/form-data">
						<input type="file" name="file" />
						<button class="btn btn-neutral btn-outline btn-xs">업로드</button>
					</form>
				</div>
				<div>
					<a class="btn btn-neutral btn-outline btn-xs" href="view">파일보러가기</a>
				</div>
			</div>
		</div>
	</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
