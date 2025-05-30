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

/* 반응형 디자인 */
@media (max-width: 768px) {
    .board-container {
        margin: 20px;
        padding: 20px;
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
		<img class="logo-image" alt="로고이미지" src="/trip/resources/images/main_logo.jpg">
			<h1><a href="/trip/index2.jsp">동틀무렵</a></h1>
		</div>
				
		<!-- 로그인/회원가입 버튼 - 우상단 -->
		<div class="auth-buttons">
			<c:choose>
				<c:when test="${not empty sessionScope.loginUser}">
					<p>${sessionScope.loginUser.human_id}님 환영합니다!</p>
					<button class="login-btn" onclick="location.href='/trip/logout'">로그아웃</button>
					<button class="login-btn2" onclick="location.href='/trip/memberUpdate'">정보수정</button>
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
					<li><a href="/trip/walking_redesign">산책코스</a></li>
					<li><a href="/trip/running">러닝코스</a></li>
					<li><a href="/trip/hiking">등산코스</a></li>
					<li><a href="/trip/game">대회정보</a></li>
					<li><a href="/trip/hotspot">주변명소</a></li>
					<li><a href="/trip/board">커뮤니티</a></li>
					<li><a href="qna_list">QnA</a></li>
					<li><a href="/trip/bookmark">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- 헤더 끝 -->

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<div class="board-container">
			<form class="board-form" action="qnaBoardRegister" method="post">
				<div class="board-title-container">
					<h2 class="board-title">1:1 문의 등록</h2>
					<div class="button-group">
						<button type="button" class="btn btn-cancel">취소</button>		
						<button type="submit" class="btn btn-submit" id="submitBtn">등록</button>
					</div>
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control title-input" placeholder="문의 제목을 입력해 주세요." name="board_title" required>
				</div>
				
				<div class="form-group">
					<textarea class="form-control content-input" placeholder="문의 내용을 자세히 입력해 주세요." name="board_content" required></textarea>
				</div>
			</form>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".btn-cancel").on("click",function(){
		location.href='qna_list';
	});
});
</script> 
</body>
</html>