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
			
			<br />
			<hr />
			<br />
			
			<div>
				<form action="checkboxSubmit">
					<label>
						<input type="checkbox" name="chk" value="체크박스1" />
						체크박스1
					</label>
					<br />
					<label>
						<input type="checkbox" name="chk" value="체크박스2" />
						체크박스2
					</label>
					<br />
					<label>
						<input type="checkbox" name="chk" value="체크박스3" />
						체크박스3
					</label>
					<br />
					<label>
						<input type="checkbox" name="chk" value="체크박스4" />
						체크박스4
					</label>
					<br />
					<button class="btn btn-neutral btn-outline btn-xs">체크박스 전송</button>
				</form>
			</div>
			
			<br />
			<hr />
			<br />
			
			<script>
				const ajaxChkBtn = function () {
					let param = [];
		         
					$("input[name='ajaxChk']:checked").each(function () {
						param.push($(this).val());
					})
					
					$.ajax({
						url : 'ajaxCheckbox',
						type : 'POST',
						data : {
							chkList : param,
						},
						dataType : 'json',
						success : function(data) {
							for (idx in data) {
								console.log(data[idx]);
							}
						},
		            	error : function(xhr, status, error) {
		               		console.log(error);
		            	}
		         	})
	      		}
			</script>
			
			<div>
		    	<input type="checkbox" name="ajaxChk" value="1" /> ajaxChk1
		    	<br />
		    	<input type="checkbox" name="ajaxChk" value="2" /> ajaxChk2
		    	<br />
		    	<input type="checkbox" name="ajaxChk" value="3" /> ajaxChk3
		    	<br />
		    	<input type="checkbox" name="ajaxChk" value="4" /> ajaxChk4
		    	<br />
		    	<button class="btn btn-neutral btn-outline btn-xs" onclick="ajaxChkBtn();">ajaxChk</button>
		   </div>
			
			<br />
			<hr />
			<br />
		</div>
	</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
