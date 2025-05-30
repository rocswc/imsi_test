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
   width: 1920px;
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
    left: 40px;
    top: 25px;
    display: flex;
    align-items: center;
    width: 40px;
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

/* 게시글 작성 영역 스타일 */
.board-container {
    padding: 40px;
    width: 1000px;
    margin: 70px auto;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    background-color: #ffffff;
}

.board-title-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    border-bottom: 1px solid #eaeaea;
    padding-bottom: 15px;
}

.board-title {
    font-size: 24px;
    font-weight: 700;
    color: #333;
}

.board-form {
    width: 100%;
}

.form-group {
    margin-bottom: 20px;
}

.form-control {
    width: 100%;
    padding: 15px;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    background-color: #ffffff;
    font-size: 15px;
    resize: none;
}

.form-control:focus {
    outline: none;
    border-color: #999999;
    /* border: 2px solid #ddd; */
}

.title-input {
    height: 50px;
}

.content-input {
    height: 350px;
}

.tag-input {
    height: 50px;
}

.button-group {
    display: flex;
    justify-content: flex-end;
    margin-top: 15px;
}

.btn {
    padding: 5px 15px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s;
}

.btn-cancel {
    background-color: #f0f0f0;
    color: #555;
    margin-right: 10px;
}

.btn-submit {
    background-color: #191919;
    color: white;
}

.btn:hover {
    opacity: 0.9;
}

.file-upload-container {
    margin-bottom: 20px;
}

.file-upload-label {
    display: inline-block;
    margin-bottom: 10px;
    font-weight: 500;
    color: #333;
}

.file-upload-input {
    display: block;
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px dashed #ccc;
    border-radius: 5px;
    background-color: #f8f8f8;
}

.file-preview {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 10px;
}

.preview-item {
    position: relative;
    width: 100px;
    height: 100px;
    border-radius: 5px;
    overflow: hidden;
    border: 1px solid #e0e0e0;
}

.preview-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.counter-text {
    text-align: right;
    color: #777;
    font-size: 14px;
    margin-top: 5px;
}


</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header class="header">

		<!-- 로고 -->
		<div class="logo">
		<img class="logo-image" alt="로고이미지" src="/trip/resources/images/main_logo.jpg">
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

  	<!-- 게시글 등록 영역 -->
		<!-- 게시글 등록 영역 -->
		<div class="board-container">
			
			<form class="board-form" action="boardRegister" method="post" enctype="multipart/form-data">
			
				<div class="board-title-container">
					<h2 class="board-title">게시글 작성</h2>
						<input type="hidden" name="human_id" value="${sessionScope.loginUser.human_id}">
						<div class="button-group">
							<button type="button" class="btn btn-cancel" onclick="location.href='board'">취소</button>
							<button type="submit" class="btn btn-submit" id="submitBtn">등록</button>
						</div>
				</div>
			
				<div class="form-group">
					<input type="text" class="form-control title-input" placeholder="제목을 입력해 주세요." name="board_title" required>
				</div>
				
				<div class="file-upload-container">
					<label class="file-upload-label">이미지 업로드</label>
					<input type="file" class="file-upload-input" name="file" multiple accept="image/*">
					<div class="file-preview"></div>
				</div>

				<div class="form-group">
					<textarea class="form-control content-input" placeholder="내용을 입력하세요." name="board_content" required></textarea>
				</div>
				
				<!-- <div class="form-group">
					<input type="text" class="form-control tag-input" placeholder="#태그를 입력해주세요1 (최대 5개)" name="tags">
					<div class="counter-text">0</div>
				</div> -->
			</form>
		</div>
  
	</div>

	<script>
	/* // 태그 카운터 기능
	$(document).ready(function() {
		$('.tag-input').on('input', function() {
			let tagCount = ($(this).val().match(/#/g) || []).length;
			$('.counter-text').text(tagCount + '개');
			
			// 최대 5개 태그 제한
			if(tagCount > 5) {
				$('.counter-text').css('color', 'red');
			} else {
				$('.counter-text').css('color', '#777');
			}
		});
	}); */
	
	</script>
    
</body>

</html>