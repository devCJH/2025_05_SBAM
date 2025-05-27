<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

	<script>
		$(function(){
			getLikePoint();
		})
	
		const clickLikePoint = async function () {
			let likePointBtn = $('#likePointBtn > i').hasClass('fa-solid');
			
			await $.ajax({
				url : '/usr/likePoint/clickLikePoint',
				type : 'GET',
				data : {
					relTypeCode : 'article',
					relId : ${article.getId() },
					likePointBtn : likePointBtn
				},
			})
			await getLikePoint();
		}
		
		const getLikePoint = function () {
			$.ajax({
				url : '/usr/likePoint/getLikePoint',
				type : 'GET',
				data : {
					relTypeCode : 'article',
					relId : ${article.getId() },
				},
				dataType : 'json',
				success : function (data) {
					$('#likePointCnt').html(data.rsData);
					
					if (data.success) {
						$('#likePointBtn').html(`<i class="fa-solid fa-thumbs-up"></i>`);
					} else {
						$('#likePointBtn').html(`<i class="fa-regular fa-thumbs-up"></i>`);
					}
				},
				error : function (xhr, status, error) {
					console.log(error);
				}
			})
		}
		
		const writeReply = function () {
			let replyContent = $('#replyContent');
			
			if (replyContent.val().length == 0) {
				alert('내용이 없는 댓글은 작성할 수 없습니다');
				replyContent.focus();
				return;
			}
			
			$.ajax({
				url : '/usr/reply/doWrite',
				type : 'POST',
				data : {
					relTypeCode : 'article',
					relId : ${article.getId() },
					content : replyContent.val()
				},
				dataType : 'text',
				success : function (data) {
					console.log(data);
				},
				error : function (xhr, status, error) {
					console.log(error);
				}
			})
		}
	</script>

	<section class="mt-8">
		<div class="container mx-auto">
			<div class="table-box">
				<table class="table">
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
						<th>추천수</th>
						<td>
							<c:if test="${req.getLoginedMember().getId() == 0 }">
								<span id="likePointCnt"></span>
							</c:if>
							<c:if test="${req.getLoginedMember().getId() != 0 }">
								<button class="btn btn-neutral btn-outline btn-xs" onclick="clickLikePoint();">
									<span id="likePointCnt"></span>
									<span id="likePointBtn"></span>
								</button>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${article.getViews() }</td>
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
			
			<div class="bg-white p-6 flex justify-between">
				<div><button class="btn btn-neutral btn-outline btn-xs" onclick="history.back();">뒤로가기</button></div>
				<c:if test="${article.getMemberId() == req.getLoginedMember().getId() }">
					<div class="flex">
						<div class="mr-2"><a class="btn btn-neutral btn-outline btn-xs" href="modify?id=${article.getId() }">수정</a></div>
						<div><a class="btn btn-neutral btn-outline btn-xs" href="delete?id=${article.getId() }&boardId=${article.getBoardId() }" onclick="if(confirm('정말로 삭제하시겠습니까?') == false) return false;">삭제</a></div>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	
	<section class="my-4">
		<div class="container mx-auto">
			<div>
				<c:forEach var="reply" items="${replies }">
					<div>${reply.getMemberId() }</div>
					<div>${reply.getContent() }</div>
					<hr />
				</c:forEach>
			</div>
			
			<div>
				<c:if test="${req.getLoginedMember().getId() != 0 }">
					<div class="border-2 border-gray-200 rounded-xl px-4 mt-2">
						<div class="mt-3 mb-2 font-semibold text-sm">닉네임</div>
						<textarea style="width: 100%; resize: none;" id="replyContent" class="textarea"></textarea>
						<div class="flex justify-end my-2">
							<button class="btn btn-neutral btn-outline btn-xs" onclick="writeReply();">등록</button>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</section>
	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>