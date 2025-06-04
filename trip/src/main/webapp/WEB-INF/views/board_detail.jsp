<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dff2f63c64a181703a7fa1fa68263c0b"></script>
<title>동틀무렵 - 커뮤니티</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">

<style>
/* 기본 스타일 */
* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
}

body {
   width: 1905px;
   background-color: #f8f9fa;
   min-height: 100vh;
   line-height: 1.6;
   margin: 0 auto;
}

/* 헤더 스타일 */
.header {
  background-color: #ffffff;
  padding: 0;
  border-bottom: none;
  position: sticky;
  top: 0;
  z-index: 1000;
  position: relative;
}

/* 로고 스타일 */
.logo-image {
    position: absolute;
    left: 30px;
    top: 15px;
    display: flex;
    align-items: center;
    width: 110px;
    height: auto;
}

.logo {
  text-align: center;
  padding: 25px 0 20px;
  background: #f8f9fa;
}

.logo h1 {
  color: #000000;
  font-size: 23px;
  font-weight: 900;
  letter-spacing: -1px;
}

.logo h1 a {
  text-decoration: none;
  color: #000000;
  transition: all 0.3s ease;
}

.logo h1 a:hover {
  color: #666666;
}

/* 로그인/회원가입 버튼 - 우상단 고정 */
.auth-buttons {
  position: absolute;
  right: 40px;
  top: 25px;
  display: flex;
  gap: 15px;
  align-items: center;
  z-index: 1001;
}

.auth-buttons p {
  font-size: 14px;
  color: #666;
  font-weight: 500;
}

.auth-buttons button {
  padding: 12px;
  border-radius: 25px;
  border: none;
  cursor: pointer;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.5px;
}

.login-btn {
  background-color: transparent;
  color: #191919;
}

.login-btn:hover {
  background-color: transparent;
  color: #555555;
}

.register-btn {
  background-color: transparent;
  color: #191919;
}

.register-btn:hover {
  background: transparent;
  color: #555555;
}

/* 네비게이션 컨테이너 */
.nav-container {
  max-width: 100%;
  width: 100%;
  padding: 0 0 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #f8f9fa;
}

/* 중앙 메뉴 */
.nav-menu {
  flex: 1;
  text-align: center;
}

.nav-menu ul {
  display: inline-flex;
  list-style: none;
  gap: 40px;
}

.nav-menu ul li a {
  text-decoration: none;
  color: #333333;
  font-weight: 600;
  font-size: 16px;
  transition: all 0.3s ease;
  position: relative;
  padding: 8px 0;
}

.nav-menu ul li a:hover {
  color: #666666;
}

.nav-menu ul li a::after {
  content: '';
  position: absolute;
  width: 0;
  height: 2px;
  bottom: 0;
  left: 50%;
  background-color: #666666;
  transition: all 0.3s ease;
  transform: translateX(-50%);
}

.nav-menu ul li a:hover::after {
  width: 100%;
}

/* 중앙 메뉴 */
.nav-menu {
  flex: 1;
  text-align: center;
}

.nav-menu ul {
  display: inline-flex;
  list-style: none;
  gap: 40px;
}

.nav-menu ul li a {
  text-decoration: none;
  color: #333333;
  font-weight: 600;
  font-size: 16px;
  transition: all 0.3s ease;
  position: relative;
  padding: 8px 0;
}

.nav-menu ul li a:hover {
  color: #666666;
}

.nav-menu ul li a::after {
  content: '';
  position: absolute;
  width: 0;
  height: 2px;
  bottom: 0;
  left: 50%;
  background-color: #666666;
  transition: all 0.3s ease;
  transform: translateX(-50%);
}

.nav-menu ul li a:hover::after {
  width: 100%;
}

/* 게시물 카드 스타일 */
.container {
    max-width: 800px;
    min-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

.post-card {
    background-color: white;
    border: 1px solid #ddd;
    overflow: hidden;
    margin: 70px auto;
    padding-top: 10px;
}

.post-header {
    display: flex;             /* 가로 정렬 */
    align-items: center;       /* 수직 중앙 정렬 */
    padding: 15px 20px;
    border-bottom: 1px solid #eee;
}

.post-title {
    flex: 1;                  /* 남은 공간 차지 */
    margin: 0;                /* h1 기본 margin 제거 */
}

.post-button{
  display: flex;             /* 가로 정렬 */
  gap: 10px;                 /* 버튼 사이 간격 */
  justify-content: flex-end; /* 오른쪽 정렬 */
}

.post-button button{
	color: #777;
	border: none;
	background-color: white;
	border-bottom: 1px solid #eee;
}

.post-button button:hover{
	cursor: pointer;
}


.post-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 5px;
}

.post-image {
	width: 100%;
	height: 100%;
	object-fit: cover;   /* 이미지가 꽉 차도록 */
    overflow: hidden;
}

.post-img {
    width: 100%;
    height: auto;
    object-fit: cover;
    display: block;
}

.post-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin: 10px 20px;
    padding-bottom: 10px;
    border-bottom: 1px solid #eee;
}

.post-tag {
    background-color: #f2f2f2;
    color: #555;
    font-size: 12px;
    padding: 3px 8px;
    border-radius: 12px;
}

.post-stats {
    display: flex;
    gap: 20px;
    padding: 10px 20px;
    border-bottom: 1px solid #eee;
    background-color: #f9f9f9;
}

.stat {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 14px;
    color: #666;
}

.stat i {
    font-size: 14px;
}

.like-button{
	border: none;
    background-color: #f9f9f9;
    color: #666;
}

.like-button i{
	font-size: 15px;
    color: white; /* 내부 글자 색 */
  	-webkit-text-stroke: 1px red; /* 테두리 색 */
}

.like-button i:hover{
	cursor: pointer;
}

.like-button i.active{
	color: red;
}

.post-content {
    padding: 20px;
    line-height: 1.6;
    color: #333;
    border-bottom: 1px solid #eee;
}

.post-writer {
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
    color: #777;
    background-color: #f9f9f9;
}

/* 댓글 섹션 스타일 */
.replys-section {
    padding: 20px;
}

.replys-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 15px;
    color: #333;
}

.reply {
    padding: 15px;
    border-bottom: 1px solid #eee;
}

.reply:last-child {
    border-bottom: none;
}

.reply-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 8px;
}

.reply-writer {
	font-size: 15px;
    font-weight: 500;
    color: #333;
}

.reply-date {
    font-size: 12px;
    color: #777;
}

.reply-content {
    color: #555;
    line-height: 1.5;
    font-size: 16px;
}

.reply-button{
  display: flex;             /* 가로 정렬 */
  gap: 10px;                 /* 버튼 사이 간격 */
  justify-content: flex-end; /* 오른쪽 정렬 */
}

.reply-button button{
	color: #777;
	border: none;
	background-color: white;
	border-bottom: 1px solid #eee;
}

.reply-button button:hover{
	cursor: pointer;
}


/* 댓글 수정 폼 */
.reply-content-edit {
	width: 100%;
	height: 50px; 
	resize: none; 
	font-size: 15px; 
	color: #555;
	border: 1px solid #e0e0e0;
}


/* 댓글 입력 폼 */
.reply-form {
    border-top: 1px solid #eee;
    padding-top: 20px;
    position: relative;
}

.reply-input {
    width: 100%;
    min-height: 80px;
   	resize: none;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-bottom: 10px;
    font-size: 14px;
}

.bottom-buttons {
    display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    gap: 10px; /* 버튼 사이 간격 */
}

.reply-submit {
    background-color: #191919;
    color: white;
    border: none;
    padding: 5px 15px;
    border-radius: 4px;
    cursor: pointer;
    font-weight: 500;
    float: right;
    margin-bottom: 15px;
}

.return-btn {
	text-decoration: none;
	background-color: white;
    color: #333333;
    border: 1px solid #333333;
    padding: 5px 15px;
    border-radius: 4px;
    cursor: pointer;
    font-weight: 500;
    float: right;
    margin-bottom: 15px;
	font-size: 13px;
}

</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header class="header">

		<!-- 로고 -->
		<div class="logo">
		<img class="logo-image" alt="로고이미지" src="/trip/resources/images/main_logo.png">
			<h1><a href="index2.jsp">동틀무렵</a></h1>
		</div>
				
		<!-- 로그인/회원가입 버튼 -->
		<div class="auth-buttons">
			<c:choose>
				<c:when test="${not empty sessionScope.loginUser}">
					<p>${sessionScope.loginUser.human_id}님 환영합니다!</p>
					<button class="login-btn" onclick="location.href='logout'">로그아웃</button>
					<button class="login-btn" onclick="location.href='memberUpdate'">정보수정</button>
				</c:when>
				<c:otherwise>
					<button class="login-btn" onclick="location.href='getHuman'">로그인</button>
					<button class="register-btn" onclick="location.href='memberForm'">회원가입</button>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- 네비게이션 -->
		<div class="nav-container">
			<!-- 중앙 메뉴 -->
			<div class="nav-menu">
				<ul>
					<li><a href="walking_redesign">산책코스</a></li>
					<li><a href="running">러닝코스</a></li>
					<li><a href="hiking">등산코스</a></li>
					<li><a href="game">대회정보</a></li>
					<li><a href="hotspot">주변명소</a></li>
					<li><a href="board">커뮤니티</a></li>
					<li><a href="qna/qna_list">QnA</a></li>
					<li><a href="bookmark">나의 북마크</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- 헤더 끝 -->

  		<!-- 게시판 컨텐츠 영역 -->
		<div class="container">
			<div class="post-card">
				<div class="post-header">
					<h1 class="post-title">${board.board_title}</h1>
					<input type="hidden" name="board_id" id="board_id" value="${board.board_id}">
					
					<span class="post-button">
						<c:if test="${board.human_id == sessionScope.loginUser.human_id}">
							<button type="button" class="post-modify" id="edit-btn">수정</button>
							<button type="button" class="post-delete">삭제</button>
						</c:if>
					</span>
				</div>
			
				<div class="post-writer">
					<span>작성자: ${board.human_id}</span>
					<span>${board.board_date}</span>
				</div>
				<!-- resources/images/main_image3.jpg -->
				<div class="post-image">
					<c:choose>
                       <c:when test="${not empty board.board_fname}">
                           <img src="${pageContext.request.contextPath}/resources/images/${board.board_realfname}_${board.board_fname}" alt="이미지" class="post-img">
                       </c:when>
                       <c:otherwise>
                           
                       </c:otherwise>
                	</c:choose>
				</div>
				
				<!-- <div class="post-tags">
					<span class="post-tag">#러닝</span>
					<span class="post-tag">#오런완</span>
				</div>
				 -->
				<div class="post-content">
					<p id="content-view">${board.board_content}</p>
				</div>
				
				<div class="post-stats">
					<!-- <div class="stat">
						<i class="fas fa-eye"></i>조회수
						<span class="board-count">0</span>
					</div> -->
					<div class="stat">
						<i class="fas fa-comment"></i>댓글
						<span class="replys-count">0</span>
					</div>
					<div class="stat liked">
						<button class="like-button">
							<i class="fas fa-heart"></i> 좋아요
							<span class="like-count">0</span>
						</button>
					</div>
				</div>
				
				<div class="replys-section">
					<h3 class="replys-title">댓글
						(<span class="replys-count">0</span>)
					</h3>
					
				<!-- <div class="reply">
						<div class="reply-header">
							<input class="reply-id" type="hidden">reply_id</input>
							<span class="reply-writer">runner_kim</span>
							<span class="reply-date">2025.05.03</span>
						</div>
						<div class="reply-content">저도 오늘 한강에서 러닝했어요!! 날씨 최고ㅎㅎ</div>
						<div class="reply-button">	
							<button type="button" class="reply-modify">수정</button>
							<button type="button" class="reply-delete">삭제</button>
						</div>	
					</div> -->
					
					<div id="listReply"></div>

						
					<form name="replyForm" id="replyForm">
						<div class="reply-form">
							<textarea class="reply-input" name="reply_content" placeholder="댓글을 입력해주세요..."></textarea>
							<input type="hidden" name="reply_writer" value="${sessionScope.loginUser.human_id}">
							<input type="hidden" name="board_id" id="board_id" value="${board.board_id}">
							<div class="bottom-buttons">
						      <a href="board" class="return-btn">목록</a>
						      <button type="button" class="reply-submit" id="replyConfirm">등록</button>
						    </div>
						</div>
					</form>
					
				</div>
			</div>
		</div>

	<script>
	const human_id = '${sessionScope.loginUser.human_id}';
	
	// 게시글 기능
	$(function(){
		//게시글 수정
		$(document).on("click", ".post-modify", function(){
			
			// p 태그를 textarea로 대체
			const $p = $("#content-view");
			const currentContent = $p.text();
			const $textarea = $("<textarea></textarea>")
				.attr("id", "content-edit")
				.val(currentContent) 
				.css({
			        width: "100%",
			        height: "150px",
		        	resize: "none",
		        	"font-size": "15px"
			    });
			
			$p.replaceWith($textarea);

			$(this).text("저장").removeClass("post-modify").addClass("post-save");
	    });
		
		// 저장 버튼 클릭 시 Ajax로 서버 전송
	    $(document).on("click", ".post-save", function() {
	        const newContent = $("#content-edit").val();
	        const board_id = $("#board_id").val();
	        
			$.ajax({
				url: "modifyBoard"
				,type: "post"
				,data: {
					board_id: board_id
					,board_content: newContent
				}
				,success: function(){
					const $p = $("<p></p>").attr("id", "content-view").text(newContent);
					$("#content-edit").replaceWith($p);
					$(".post-save").text("수정").removeClass("post-save").addClass("post-modify");
				}
				,error: function(err){
					console.log(err);
					alert("게시글 수정 실패");
				}
			});
		});
		
		//게시글 삭제
		$(".post-delete").click(function(){
			
				$.ajax({
					url: "deleteBoard?board_id=" + $('#board_id').val()
					,type: "delete"
					,success: function(){
						console.log("삭제완");	
						window.location.href = "/trip/board";
					}
					,error: function(err){
						console.log(err);
					}
				});
		});
	});
	
	
	// 좋아요 기능
		
		// 페이지 로드 시 좋아요 개수 가져오기
		console.log($('#board_id').val());
		
		likeCount();
		likeHeart();
		
		function likeCount(){
			
			$.ajax({
				url: "likeCount"
				,type: "get"
				,data: {board_id : $('#board_id').val()}
				,success: function(result){
					$('.like-count').text(result);
				}
				,error: function(err){
					alert('좋아요count실패');
				}
			});
		}
		
		// 게시글페이지 로드 시 ♥유지
		function likeHeart(){
			console.log("🔥 likeHeart() 호출됨");
			$.ajax({
				url: "likeHeart"
				,type: "get"
				,data: {board_id : $('#board_id').val()}
				,success: function(result){
					console.log(result);
					if (result === true) {
				        $('.like-button i').addClass('active');
				    } else {
				        $('.like-button i').removeClass('active');
				    }
				}
				,error: function(err){
					alert('likeHeart실패');
					console.log(err);
				}
			});
		}
		
		
		
		
		// 좋아요 버튼 이벤트
		$('.liked').click(function(){
			const icon = $(this).find('i');
		 	/* const like = $(this).find('.like-count');
		    let count = parseInt(like.text()); */
		    
		    if (icon.hasClass('active')) {
		      icon.removeClass('active');
		      
		      $.ajax({
		    	url: 'unLike'
		    	,type: 'get'
		    	,data: {board_id : $('#board_id').val()}
				,success: function(){
					likeCount();
				}
		    	,error: function(err){
		    		alert("unLike 실패");
		    	}
		      });
		      
		    } else {
		      icon.addClass('active');
		      
		      $.ajax({
			    	url: 'addLike'
			    	,type: 'get'
			    	,data: {board_id : $('#board_id').val()}
					,success: function(result){
						if (result === "liked") {
							likeCount();
				        } else if (result === "already_liked") {
				            alert("이미 좋아요를 누르셨습니다.");
				        } else if (result === "not_logged_in") {
				            alert("로그인이 필요합니다.");
				            window.location.href = '/login';
				        }
					}
			    	,error: function(err){
			    		alert("addLike 실패");
			    	}
			   });
		    }
		});
	
	//	댓글 기능
		
		// 1. 페이지 로딩 시 댓글 목록 출력
		listReply();
		countReply();
		
		// 2. 댓글등록 버튼 이벤트
		$("#replyConfirm").click(function(){
			//alert('ok');
			var params = $("#replyForm").serialize();
			console.log(params);
			
			$.ajax({
				url: 'replynew'
				,type: 'post'
				,data: params
				,success: function(result){
					//alert("댓글작성" + result);
					$(".reply-input").val('');
					listReply();	//댓글목록
					countReply();	//댓글개수
				}
				,error: function(err){
					alert("댓글입력 실패");
					console.log(err)
				}
			});
			
		});// end of 댓글등록
		
		// 3. 댓글목록 가져오기
		function listReply(){
			$.ajax({
				url: 'replyList'
				,type: 'get'
				,data: {board_id : $('#board_id').val()}
				,success: function(result){
					//alert("댓글 불러오기 시작");
					console.log(result);
					
					const listReply = $("#listReply")
					
					listReply.empty();
					
					for(const row of result ){
						//console.log(row);
						const replyDiv = $('<div/>').addClass('reply');
						const headerDiv = $('<div/>').addClass('reply-header');
						const hiddenInput = $('<input/>').attr('type', 'hidden').addClass('reply-id').attr('value', row.reply_id);;
						const writerSpan = $('<span/>').addClass('reply-writer').text(row.reply_writer);
						const dateSpan = $('<span/>').addClass('reply-date').text(row.reply_date);
						headerDiv.append(hiddenInput).append(writerSpan).append(dateSpan);
						
						const contentDiv = $('<div/>').addClass('reply-content').text(row.reply_content);
						const buttonDiv = $('<div/>').addClass('reply-button');
						
						if(row.reply_writer == human_id){
						const modifyButton = $('<button/>').addClass('reply-modify').text("수정");
						const deleteButton = $('<button/>').addClass('reply-delete').text("삭제");
						buttonDiv.append(modifyButton).append(deleteButton);
						}
						
						replyDiv.append(headerDiv).append(contentDiv).append(buttonDiv);
						listReply.append(replyDiv);
					}
				}
				,error: function(err){
					alert("댓글 불러오기 실패");
					console.log(err);
				}
			}); //end of ajax
		}// end of 댓글목록
		
		
		// 4. 댓글 삭제
		$('#listReply').on('click', '.reply-delete', function(){
			
			const reply_id = $(this).closest('.reply').find('.reply-id').val();
			
			$.ajax({
				url: 'replyDelete/'+reply_id
				, type: 'delete'
				, success: function(result){
					//alert("댓글이 삭제되었습니다.");
					listReply();
					countReply();
				}
				, error: function(err){
					alert("삭제실패");
					console.log(err)
				}
			});
		});
		
		
		//5. 댓글 수정
		$('#listReply').on('click', '.reply-modify', function(){
			//alert("ok");
			
			const $replyDiv = $(this).closest('.reply');
			const $contentDiv = $replyDiv.find('.reply-content')
			
			// 현재 댓글 텍스트 가져오기
			const currentText = $contentDiv.text();
			
			// div 내용을 textarea로 변경
			const contentTextarea = $('<textarea/>').addClass('reply-content-edit').text(currentText);
			$contentDiv.empty().append(contentTextarea);
			
			// 수정 완료 버튼 생성 (기존 수정 버튼 텍스트 변경)
		    $(this).text('완료').removeClass('reply-modify').addClass('reply-modify-complete');
		});
		
		// 수정내용 반영
		$('#listReply').on('click', '.reply-modify-complete', function(){
			
			const $replyDiv			= $(this).closest('.reply');
			const reply_id			= $replyDiv.find('.reply-id').val();
			const reply_writer		= $replyDiv.find('.reply-writer').text();
			const $contentTextarea	= $replyDiv.find('.reply-content-edit');
			const newContent		= $contentTextarea.val();
			const reply_date		= $replyDiv.find('.reply-date').val();
			
			const params = {
					reply_id: reply_id,
					reply_writer: reply_writer,
					reply_content: newContent,
					reply_date: reply_date
					};
			
			$.ajax({
				url: 'replyModify'
				,type: 'post'
				,data: params
				,success: function(result){
					// 수정된 댓글 내용으로 갱신
					$replyDiv.find('.reply-content').text(newContent);
					// 버튼 원복
					$replyDiv.find('.reply-modify-complete').text('수정').removeClass('reply-modify-complete').addClass('reply-modify');
					
					//alert("댓글이 수정되었습니다.");
				}
				,error: function(){
					alert("댓글수정실패");
					console.log(err)
				}
			});
		});
	
		
		// 6. 댓글 수 카운트
		function countReply(){
			$.ajax({
				url: 'replyCount'
				,type: 'get'
				,data: {board_id : $('#board_id').val()}
				,success: function(result){
					const replyCount = $('.replys-count');
					replyCount.text(result);
				}
				,error: function(err){
					alert("댓글카운트실패")
				}
			});
		}
	
	</script>
    
</body>

</html>
