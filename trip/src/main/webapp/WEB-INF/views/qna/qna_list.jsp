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
<title>동틀무렵 - 자주하는 질문</title>
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

/* 콘텐츠 영역 */
.content {
   flex: 1;
   padding: 0;
   background-color: #ffffff;
   max-width: 100%;
}

/* QnA 리스트 스타일 */
.qna-container {
    padding: 40px;
    max-width: 1200px;
    margin: 0 auto;
    background-color: #ffffff;
}

.qna-title {
    font-size: 32px;
    font-weight: 900;
    color: #333333;
    margin-bottom: 30px;
    text-align: center;
    letter-spacing: -1px;
}

.qna-list {
    background-color: #ffffff;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.qna-item {
    border-bottom: 1px solid #f0f0f0;
    padding: 20px;
    transition: all 0.3s ease;
}

.qna-item:hover {
    background-color: #f8f9fa;
}

.qna-item:last-child {
    border-bottom: none;
}

.qna-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.qna-id {
    font-size: 14px;
    color: #666;
    font-weight: 500;
}

.qna-date {
    font-size: 14px;
    color: #999;
}

.qna-title-link {
    font-size: 18px;
    font-weight: 600;
    color: #333;
    text-decoration: none;
    margin-bottom: 8px;
    display: block;
    transition: color 0.3s ease;
}

.qna-title-link:hover {
    color: #666;
}

.qna-content {
    font-size: 14px;
    color: #666;
    line-height: 1.6;
    margin-bottom: 10px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
}

.qna-status {
    display: inline-block;
    padding: 4px 12px;
    border-radius: 12px;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
}

.status-pending {
    background-color: #fff3cd;
    color: #856404;
}

.status-answered {
    background-color: #d4edda;
    color: #155724;
}

.register-button {
    text-align: center;
    margin-top: 40px;
}

.btn-register {
    background-color: #666666;
    color: white;
    padding: 12px 30px;
    border: none;
    border-radius: 25px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    letter-spacing: 0.5px;
}

.btn-register:hover {
    background-color: #555555;
    transform: translateY(-2px);
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header class="header">
		<!-- 로고 -->
		<div class="logo">
		<img class="logo-image" alt="로고이미지" src="">
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

	<!-- 콘텐츠 영역 -->
	<div class="content">
		<div class="qna-container">
			<h2 class="qna-title">자주하는 질문</h2>
			
			<div class="qna-list">
				<c:forEach var="item" items="${getQnAList}">
					<div class="qna-item">
						<div class="qna-header">
							<span class="qna-id">문의번호: ${item.board_id} | 작성자: ${item.human_id}</span>
							<span class="qna-date">${item.board_date}</span>
						</div>
						<a href="qna_replyboard?board_id=${item.board_id}&human_id=${item.human_id}" class="qna-title-link">
							${item.board_title}
						</a>
						<div class="qna-content">
							${item.board_content}
						</div>
						<c:choose>
							<c:when test="${item.board_status == 'pending'}">
								<span class="qna-status status-pending">답변대기</span>
							</c:when>
							<c:otherwise>
								<span class="qna-status status-answered">답변완료</span>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</div>
			
			<div class="register-button">
				<button id="btn" class="btn-register">문의 등록하기</button>
			</div>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

$("#btn").on("click",function(){
	location.href="qnaboard_insert";
});

});
</script> 

</body>
</html>