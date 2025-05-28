<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동틀무렵 - 메인페이지</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	display: flex;
	min-height: 100vh;
	background-color: #FFFEF9; /* 베이지 배경색 변경 */
}

/* 좌측 사이드바 */
.sidebar {
	width: 240px;
	background-color: #FFFEF9; /* 사이드바 배경색 변경 */
	padding: 30px 0;
	height: 100vh;
	position: sticky;
	top: 0;
	border-right: 1px solid #eaeaea;
}

.sidebar-logo {
	padding: 0 20px 30px;
	font-size: 22px;
	font-weight: 700;
	color: #426B1F;
	height: 60px; /* 상단 메뉴와 같은 높이로 설정 */
	border-bottom: 1px solid #eaeaea;
	margin-bottom: 30px;
}

/* 카테고리 스타일 추가 */
.sidebar-category {
	padding: 10px 20px;
	font-size: 16px;
	font-weight: 900;
	color: #25300A;
	margin-bottom: 5px;
}

.sidebar-menu {
	list-style: none;
}

.sidebar-menu li {
	padding: 15px 20px;
	cursor: pointer;
	transition: all 0.3s;
	display: flex;
	align-items: center;
}

.sidebar-menu li:hover {
	background-color: #F5EFD3; /* 베이지 색상에 맞게 호버 색상 변경 */
	color: #000000;
	font-weight: 700;
}

.sidebar-menu li.active {
	font-weight: 500;
	background-color: #F5EFD3; /* 베이지 색상에 맞게 액티브 색상 변경 */
	color: #333;
}

.sidebar-menu i {
	margin-right: 12px;
	width: 20px;
	text-align: center;
}

/* 메인 콘텐츠 영역 */
.main-content {
	flex: 1;
	display: flex;
	flex-direction: column;
	background-color: #FFFEF9; /* 메인 콘텐츠 영역 배경색 변경 */
}

/* 상단 메뉴바 */
.top-menu {
	background-color: #FFFEF9; /* 상단 메뉴바 배경색 변경 */
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 30px;
	/* box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05); */
	position: sticky;
	top: 0;
	z-index: 100;
}

.auth-buttons {
	display: flex;
}

.auth-buttons button {
	padding: 8px 18px;
	border-radius: 20px;
	border: none;
	cursor: pointer;
	margin-left: 10px;
	transition: all 0.3s;
}

.register-btn {
	background-color: #426B1F;
	color: white;
}

.auth-buttons button:hover {
	opacity: 0.9;
	transform: translateY(-2px);
}

/* 콘텐츠 영역 */
.content {
	flex: 1;
	padding: 20px 30px;
	background-color: #FFFEF9; /* 콘텐츠 영역 배경색 변경 */ 
}
	
/* 정보 표시 영역 스타일 */
.walking-course {
    margin-top: 30px;
    margin-bottom: 20px;
    padding: 0 30px;
}

.walking-course h3 {
    margin-bottom: 15px;
    font-size: 18px;
    color: #156206;
}

.course-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.course-header h3 {
    font-size: 18px;
    color: #156206;
}

.info-form {
	width: 100%;
    max-width: 1000px;
}

.info-item {
 	display: flex;
    margin-bottom: 15px;
}

.info-item label {
    display: inline-block;
    font-weight: 500;
    color: #333;
    margin-right: 10px;
    width : 80px;
}

.info-item input[type="text"] {
    border: none;
    background-color: #FFFFFA;
    font-size: 15px;
}

.info-item input[type="text"]:focus {
    outline: none; /* 포커스 테두리 제거 */
}

.divider {
  width: 100%;
  height: 1px;
  background-color: #EAEAEA;
  margin: 20px 0;
}

#course-info {
    width: 800px;
    border: none;
    border-radius: 4px;
    background-color: #FFFFFA;
    min-height: 50px;
    font-size: 15px;
}

.bookmark-btn {
	background: none;
	border: none;
	padding: 5px 2px;
    cursor: pointer;
    font-size: 15px;
    color: #156206;
	transition: transform 0.2s, color 0.2s;
}

.bookmark-btn:hover {
	border: none
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

$("#update").on("click",function() {
	location.href="updateHuman?human_id="+"${getAdminHuman.human_id}&human_blacklist="+$('#select').val()+"&human_state="+$('#select2').val();
});

});
</script>

</head>
<body>
	<!-- 좌측 사이드바 -->
	<div class="sidebar">
		<div class="sidebar-logo">동틀무렵</div>
		<div class="sidebar-category">관리자정보</div>
		<ul class="sidebar-menu">
			<li><i class="fas fa-leaf"></i> <span id="walkingCourseBtn">대시보드</span></li>
			<li><i class="fas fa-running"></i> <span><a href="getAdminHumanList">회원관리</a></span></li>
		</ul>
	</div>

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<!-- 상단 메뉴바 - 코스정보와 명소 제거, 마이페이지 추가 -->
		<div class="top-menu">
			<ul class="nav-links"></ul>
			<div class="auth-buttons">
				<button class="register-btn">로그아웃</button>
			</div>
		</div>

		<!-- 콘텐츠 영역 -->
		<div class="content">	
			<h1>회원정보</h1>
			<div class="divider"></div>

			<div class="info-item">
				<label>아이디</label>
				<input type="text" value="${getAdminHuman.human_id}" readonly>			
			</div>
			<div class="divider"></div>
			
			<div class="info-item">
				<label>성별</label>
				<input type="text" value="${getAdminHuman.human_gender}" readonly>			
			</div>
			<div class="divider"></div>
			
			<div class="info-item">
				<label>생년월일</label>
				<input type="text" value="${getAdminHuman.human_birth}" readonly>			
			</div>
			<div class="divider"></div>
			
			<div class="info-item">
				<label>연락처</label>
				<input type="text" value="${getAdminHuman.human_tel}" readonly>			
			</div>
			<div class="divider"></div>
			
			<div class="info-item">
				<label>이메일</label>
				<input type="text" value="${getAdminHuman.human_email}" readonly>			
			</div>
			<div class="divider"></div>

			<div class="info-item">
				<label>가입일</label>
				<input type="text" value="${getAdminHuman.human_join}" readonly>			
			</div>
			<div class="divider"></div>

			<div class="info-item">
				<label>블랙리스트</label>
				<select id="select">
				   <option value="Y" ${getAdminHuman.human_blacklist eq 'Y' ? 'selected' : ''}>Y</option>
				   <option value="N" ${getAdminHuman.human_blacklist eq 'N' ? 'selected' : ''}>N</option>
				</select>
			</div>
			<div class="divider"></div>
		
			<div class="info-item">
				<label>회원상태</label>
				<select id="select2">
				   <option value="normal" ${getAdminHuman.human_state eq 'normal' ? 'selected' : ''}>일반</option>
				   <option value="delete" ${getAdminHuman.human_state eq 'delete' ? 'selected' : ''}>삭제</option>
				</select>
			</div>
			<div class="divider"></div>
			
			<div><input type="button" value="회원수정" id="update"></div>	
		</div>	
			
	</div>
</body>
</html>