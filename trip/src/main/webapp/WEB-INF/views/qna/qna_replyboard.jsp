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
<title>동틀무렵 - 1:1 문의</title>
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

/* 메인 콘텐츠 영역 스타일 */
.main-content {
	flex: 1;
	display: flex;
	justify-content: center;
	background: #f8f9fa;
	padding: 40px 0;
}

/* 게시글 작성 영역 스타일 */
.board-container {
    width: 100%;
    max-width: 900px;
    margin: 0 auto;
    padding: 40px;
    background: #ffffff;
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.1);
    border: 1px solid #f0f0f0;
}

.board-title-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 2px solid #f0f0f0;
    position: relative;
}

.board-title-container::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 80px;
    height: 4px;
    background: #666666;
    border-radius: 2px;
}

.board-title {
    font-size: 28px;
    font-weight: 700;
    color: #333333;
    position: relative;
}

.board-title::before {
    content: '📝';
    margin-right: 10px;
    font-size: 24px;
}

.form-group {
    margin-bottom: 25px;
}

.form-control {
    width: 100%;
    padding: 18px 20px;
    border: 2px solid #f0f0f0;
    border-radius: 12px;
    background: #f8f9fa;
    font-size: 15px;
    resize: none;
    transition: all 0.3s ease;
    font-family: 'Noto Sans KR', sans-serif;
}

.form-control:focus {
    outline: none;
    border-color: #666666;
    background: white;
    box-shadow: 0 0 0 3px rgba(102, 102, 102, 0.1);
    transform: translateY(-2px);
}

.title-input {
    height: 60px;
    font-weight: 500;
}

.content-input {
    height: 350px;
    line-height: 1.6;
}

.button-group {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
    margin-top: 20px;
}

.btn {
    padding: 12px 24px;
    border-radius: 25px;
    border: none;
    cursor: pointer;
    font-size: 15px;
    font-weight: 600;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.btn-cancel {
    background: #999999;
    color: white;
}

.btn-cancel:hover {
    background: #777777;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(153, 153, 153, 0.4);
}

.btn-submit {
    background: #444444;
    color: white;
}

.btn-submit:hover {
    background: #333333;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(68, 68, 68, 0.4);
}

/* 댓글 섹션 스타일 */
.comments-section {
    margin-top: 40px;
    padding-top: 30px;
    border-top: 2px solid #f0f0f0;
}

.comments-title {
    font-size: 22px;
    font-weight: 700;
    color: #333333;
    margin-bottom: 25px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.comments-title::before {
    content: '💬';
    font-size: 20px;
}

.comments-count {
    background: #444444;
    color: white;
    padding: 4px 12px;
    border-radius: 15px;
    font-size: 14px;
    font-weight: 500;
}

.comment-list {
    margin-bottom: 30px;
}

.comment-item {
    background: #f8f9fa;
    border: 1px solid #f0f0f0;
    border-radius: 15px;
    padding: 20px;
    margin-bottom: 15px;
    transition: all 0.3s ease;
    position: relative;
}

.comment-item:hover {
    background: white;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    transform: translateY(-2px);
}

.comment-item.edit-mode {
    background: white;
    border-color: #666666;
    box-shadow: 0 0 0 3px rgba(102, 102, 102, 0.1);
}

.comment-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
    padding-bottom: 8px;
    border-bottom: 1px solid #f0f0f0;
}

.comment-author {
    display: flex;
    align-items: center;
    gap: 10px;
}

.author-avatar {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: #444444;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 14px;
}

.author-info {
    display: flex;
    flex-direction: column;
}

.author-name {
    font-weight: 600;
    color: #333333;
    font-size: 14px;
}

.author-type {
    font-size: 12px;
    color: #666666;
    background: #f0f0f0;
    padding: 2px 8px;
    border-radius: 10px;
    display: inline-block;
    margin-top: 2px;
}

.comment-actions {
    display: flex;
    gap: 8px;
}

.comment-btn {
    padding: 6px 12px;
    border: none;
    border-radius: 15px;
    cursor: pointer;
    font-size: 12px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.btn-edit {
    background: #666666;
    color: white;
}

.btn-edit:hover {
    background: #555555;
    transform: translateY(-1px);
}

.btn-delete {
    background: #999999;
    color: white;
}

.btn-delete:hover {
    background: #777777;
    transform: translateY(-1px);
}

.comment-content {
    color: #666666;
    line-height: 1.6;
    font-size: 15px;
}

/* 수정 모드 스타일 */
.edit-textarea {
    width: 100%;
    min-height: 100px;
    padding: 15px;
    border: 2px solid #666666;
    border-radius: 10px;
    background: white;
    font-size: 15px;
    line-height: 1.6;
    resize: vertical;
    font-family: 'Noto Sans KR', sans-serif;
    color: #333;
}

.edit-textarea:focus {
    outline: none;
    box-shadow: 0 0 0 3px rgba(102, 102, 102, 0.2);
}

.edit-buttons {
    display: flex;
    justify-content: flex-end;
    gap: 8px;
    margin-top: 10px;
}

.btn-save {
    background: #28a745;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 15px;
    cursor: pointer;
    font-size: 12px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.btn-save:hover {
    background: #218838;
    transform: translateY(-1px);
}

.btn-cancel-edit {
    background: #dc3545;
    color: white;
    padding: 8px 16px;
    border: none;
    border-radius: 15px;
    cursor: pointer;
    font-size: 12px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.btn-cancel-edit:hover {
    background: #c82333;
    transform: translateY(-1px);
}

/* 댓글 작성 폼 */
.comment-form {
    background: white;
    border: 2px solid #f0f0f0;
    border-radius: 15px;
    padding: 25px;
    margin-top: 20px;
}

.comment-form-title {
    font-size: 18px;
    font-weight: 600;
    color: #333333;
    margin-bottom: 15px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.comment-form-title::before {
    content: '✏️';
    font-size: 16px;
}

.comment-input-group {
    display: flex;
    gap: 12px;
    align-items: flex-end;
}

.comment-input {
    flex: 1;
    padding: 15px 18px;
    border: 2px solid #f0f0f0;
    border-radius: 25px;
    background: #f8f9fa;
    font-size: 14px;
    resize: none;
    transition: all 0.3s ease;
    font-family: 'Noto Sans KR', sans-serif;
}

.comment-input:focus {
    outline: none;
    border-color: #666666;
    background: white;
    box-shadow: 0 0 0 3px rgba(102, 102, 102, 0.1);
}

.comment-submit-btn {
    padding: 15px 25px;
    background: #444444;
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.comment-submit-btn:hover {
    background: #333333;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(68, 68, 68, 0.4);
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .board-container {
        margin: 20px;
        padding: 20px;
    }
    
    .comment-input-group {
        flex-direction: column;
        align-items: stretch;
    }
    
    .comment-submit-btn {
        margin-top: 10px;
    }
}

/* 애니메이션 */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.comment-item {
    animation: fadeInUp 0.5s ease;
}

/* 스크롤바 커스텀 */
::-webkit-scrollbar {
    width: 8px;
}

::-webkit-scrollbar-track {
    background: #f1f1f1;
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: #666666;
    border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
    background: #555555;
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header class="header">
		<!-- 로고 -->
		<div class="logo">
		<img class="logo-image" alt="로고이미지" src="/trip/resources/images/main_logo.png">
			<h1><a href="index.jsp">동틀무렵</a></h1>
		</div>
				
		<!-- 로그인/회원가입 버튼 - 우상단 -->
		<div class="auth-buttons">
			<c:choose>
				<c:when test="${not empty sessionScope.loginUser}">
					<p>${sessionScope.loginUser.human_id}님 환영합니다!</p>
					<button class="login-btn" onclick="location.href='logout'">로그아웃</button>
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
					<li><a href="walking">산책코스</a></li>
					<li><a href="running">러닝코스</a></li>
					<li><a href="hiking">등산코스</a></li>
					<li><a href="game">대회정보</a></li>
					<li><a href="hotspot">주변명소</a></li>
					<li><a href="board">커뮤니티</a></li>
					<li><a href="bookmark_walking">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- 헤더 끝 -->

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<div class="board-container">
			<div class="board-title-container">
				<h2 class="board-title">1:1 문의</h2>
				<div class="button-group">
					<button type="button" class="btn btn-cancel">취소</button>
					<button type="submit" class="btn btn-submit" id="submitBtn">수정</button>
				</div>
			</div>
						
			<div class="form-group">
				<input type="text" value="${getQnAList[0].board_title}" class="form-control title-input" placeholder="문의 제목을 입력해 주세요." name="board_title" required>
			</div>
			
			<div class="form-group">
				<textarea class="form-control content-input" placeholder="문의 내용을 자세히 입력해 주세요." name="board_content" required>${getQnAList[0].board_content}</textarea>
			</div>

			<!-- 댓글 섹션 -->
			<div class="comments-section">
				<div class="comments-title">
					답변 
					<span class="comments-count">${getQnAReplyList.size()}</span>
				</div>
				
				<div class="comment-list">
					<c:forEach var="item" items="${getQnAReplyList}">
						<div class="comment-item" data-reply-id="${item.reply_id}">
							<div class="comment-header">
								<div class="comment-author">
									<div class="author-avatar">
										${item.writer_id.substring(0,1).toUpperCase()}
									</div>
									<div class="author-info">
										<div class="author-name">${item.writer_id}</div>
										<div class="author-type">
											<c:choose>
												<c:when test="${item.writer_type == 'admin'}">관리자</c:when>
												<c:otherwise>사용자</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
								<div class="comment-actions">
									<button class="comment-btn btn-edit replyModify" type="button">
										<i class="fas fa-edit"></i> 수정
									</button>
									<button class="comment-btn btn-delete replyDelete" type="button">
										<i class="fas fa-trash"></i> 삭제
									</button>
									<input type="hidden" class="reply_id" value="${item.reply_id}">
								</div>
							</div>
							<div class="comment-content" data-original-content="${item.reply_content}">${item.reply_content}</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 댓글 작성 폼 -->
			<form class="comment-form" action="qnaBoardReplyRegister" method="post">
				<div class="comment-form-title">답변 작성</div>
				<input type="hidden" name="board_id" value="${getQnAList[0].board_id}">
				<div class="comment-input-group">
					<input type="text" name="reply_content" class="comment-input" placeholder="답변을 입력해 주세요..." required>
					<button type="submit" class="comment-submit-btn">
						<i class="fas fa-paper-plane"></i> 등록
					</button>
				</div>
			</form>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

// 수정 모드로 전환하는 함수
function enterEditMode(commentItem) {
    var contentDiv = commentItem.find('.comment-content');
    var originalContent = contentDiv.data('original-content');
    var replyId = commentItem.find('.reply_id').val();
    
    // 수정 모드 스타일 적용
    commentItem.addClass('edit-mode');
    
    // 기존 내용을 textarea로 교체
    var editHtml = `
        <div class="edit-content">
            <textarea class="edit-textarea">${originalContent}</textarea>
            <div class="edit-buttons">
                <button class="btn-save">
                    <i class="fas fa-check"></i> 저장
                </button>
                <button class="btn-cancel-edit">
                    <i class="fas fa-times"></i> 취소
                </button>
            </div>
        </div>
    `;
    
    contentDiv.html(editHtml);
    commentItem.find('.comment-actions').hide(); // 수정/삭제 버튼 숨기기
    
    // textarea에 포커스
    commentItem.find('.edit-textarea').focus();
}

// 수정 모드에서 나가는 함수
function exitEditMode(commentItem) {
    var contentDiv = commentItem.find('.comment-content');
    var originalContent = contentDiv.data('original-content');
    
    // 원래 모드로 복원
    commentItem.removeClass('edit-mode');
    contentDiv.html(originalContent);
    commentItem.find('.comment-actions').show(); // 수정/삭제 버튼 다시 보이기
}

// 수정 버튼 클릭 이벤트
$(".replyModify").on("click", function() {
    var commentItem = $(this).closest('.comment-item');
    
    // 다른 수정 모드들 종료
    $('.comment-item.edit-mode').each(function() {
        exitEditMode($(this));
    });
    
    // 현재 항목을 수정 모드로 전환
    enterEditMode(commentItem);
});

// 저장 버튼 클릭 이벤트 (동적으로 생성되는 요소이므로 이벤트 위임 사용)
$(document).on('click', '.btn-save', function() {
    var commentItem = $(this).closest('.comment-item');
    var newContent = commentItem.find('.edit-textarea').val().trim();
    var replyId = commentItem.find('.reply_id').val(); // reply_id를 comment-item에서 찾기
    var originalContent = commentItem.find('.comment-content').data('original-content');
    
    if (!newContent) {
        alert("내용을 입력해주세요.");
        return;
    }
    
    if (newContent === originalContent) {
        // 내용이 변경되지 않았으면 수정 모드만 종료
        exitEditMode(commentItem);
        return;
    }
    
    // 저장 버튼 비활성화 및 로딩 표시
    $(this).prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> 저장 중...');
    
    // AJAX로 수정 요청
    $.ajax({
        type: 'post',
        url: 'qnaUpdateReply',
        data: {
            reply_id: replyId,
            reply_content: newContent
        },
        success: function(result) {
            // 성공 시 내용 업데이트
            var contentDiv = commentItem.find('.comment-content');
            contentDiv.data('original-content', newContent);
            contentDiv.html(newContent);
            
            // 수정 모드 종료
            commentItem.removeClass('edit-mode');
            commentItem.find('.comment-actions').show();
            
            // 성공 메시지
            alert("수정이 완료되었습니다.");
        },
        error: function(err) {
            alert("수정에 실패했습니다.");
            console.log(err);
            
            // 저장 버튼 복원
            $('.btn-save').prop('disabled', false).html('<i class="fas fa-check"></i> 저장');
        }
    });
});

// 취소 버튼 클릭 이벤트 (동적으로 생성되는 요소이므로 이벤트 위임 사용)
$(document).on('click', '.btn-cancel-edit', function() {
    var commentItem = $(this).closest('.comment-item');
    exitEditMode(commentItem);
});

// ESC 키로 수정 모드 취소
$(document).on('keydown', '.edit-textarea', function(e) {
    if (e.keyCode === 27) { // ESC key
        var commentItem = $(this).closest('.comment-item');
        exitEditMode(commentItem);
    }
});

// Ctrl+Enter로 저장
$(document).on('keydown', '.edit-textarea', function(e) {
    if (e.ctrlKey && e.keyCode === 13) { // Ctrl + Enter
        var commentItem = $(this).closest('.comment-item');
        commentItem.find('.btn-save').click();
    }
});

// 삭제 버튼 클릭 이벤트
$(".replyDelete").on("click", function(){
    if(!confirm("정말로 삭제하시겠습니까?")) {
        return;
    }
    
    var commentItem = $(this).closest('.comment-item');
    var replyId = $(this).siblings('.reply_id').val();
    
    $.ajax({
        type: 'post',
        url: 'qnadeleteReply',
        data: {reply_id: replyId},
        success: function(result) {
            // 부드러운 삭제 애니메이션
            commentItem.fadeOut(500, function() {
                $(this).remove();
                // 댓글 개수 업데이트
                var currentCount = parseInt($('.comments-count').text());
                $('.comments-count').text(currentCount - 1);
            });
        },
        error: function(err) {
            alert("삭제에 실패했습니다.");
            console.log(err);	
        }
    });		
});

// 폼 제출 시 부드러운 효과
$('.comment-form').on('submit', function() {
    var submitBtn = $(this).find('.comment-submit-btn');
    submitBtn.html('<i class="fas fa-spinner fa-spin"></i> 등록 중...');
    submitBtn.prop('disabled', true);
});

});
</script> 
   
</body>
</html>