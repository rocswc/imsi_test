<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동틀무렵 - 회원 정보 관리</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap"
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
	display: flex;
	min-height: 100vh;
	background-color: #f8f9fa;
	line-height: 1.6;
}

/* 좌측 사이드바 */
.sidebar {
	width: 280px;
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	padding: 0;
	height: 100vh;
	position: sticky;
	top: 0;
	border-right: 1px solid #e9ecef;
	box-shadow: 2px 0 20px rgba(0, 0, 0, 0.05);
}

.sidebar-logo {
	padding: 30px 20px;
	font-size: 28px;
	font-weight: 900;
	color: #333333;
	height: auto;
	border-bottom: 1px solid #e9ecef;
	margin-bottom: 30px;
	text-align: center;
	background: #ffffff;
	letter-spacing: -1px;
}

.sidebar-category {
	padding: 20px 20px 15px;
	font-size: 14px;
	font-weight: 700;
	color: #666666;
	margin-bottom: 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
}

.sidebar-menu {
	list-style: none;
	padding: 0 15px;
}

.sidebar-menu li {
	margin-bottom: 8px;
	border-radius: 12px;
	overflow: hidden;
	transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.sidebar-menu li a {
	display: flex;
	align-items: center;
	padding: 18px 20px;
	text-decoration: none;
	color: #555555;
	font-weight: 500;
	font-size: 15px;
	transition: all 0.3s ease;
	border-radius: 12px;
}

.sidebar-menu li span {
	display: flex;
	align-items: center;
	padding: 18px 20px;
	color: #555555;
	font-weight: 500;
	font-size: 15px;
	transition: all 0.3s ease;
	border-radius: 12px;
	cursor: pointer;
}

.sidebar-menu li:hover {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	transform: translateX(5px);
}

.sidebar-menu li:hover a,
.sidebar-menu li:hover span {
	color: white;
	font-weight: 600;
}

.sidebar-menu li.active {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.sidebar-menu li.active a,
.sidebar-menu li.active span {
	color: white;
	font-weight: 600;
}

.sidebar-menu i {
	margin-right: 15px;
	width: 20px;
	text-align: center;
	font-size: 16px;
}

/* 메인 콘텐츠 영역 */
.main-content {
	flex: 1;
	display: flex;
	flex-direction: column;
	background-color: #f8f9fa;
}

/* 상단 헤더 */
.top-menu {
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 40px;
	position: sticky;
	top: 0;
	z-index: 100;
	border-bottom: 1px solid #e9ecef;
	box-shadow: 0 2px 20px rgba(0, 0, 0, 0.05);
}

.nav-links {
	display: flex;
	list-style: none;
	align-items: center;
}

.nav-links li {
	margin: 0 20px;
	position: relative;
	padding: 12px 8px;
}

.nav-links li a {
	text-decoration: none;
	color: #333333;
	font-weight: 600;
	font-size: 16px;
	transition: all 0.3s ease;
}

.nav-links li.active a {
	color: #667eea;
	font-weight: 700;
}

.nav-links li.active::after {
	content: '';
	position: absolute;
	height: 3px;
	width: 100%;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	bottom: 0;
	left: 0;
	border-radius: 2px;
}

.nav-links li a:hover {
	color: #667eea;
}

.auth-buttons {
	display: flex;
	align-items: center;
	gap: 15px;
}

.auth-buttons .admin-info {
	font-size: 14px;
	color: #666666;
	font-weight: 500;
}

.auth-buttons button {
	padding: 12px 24px;
	border-radius: 25px;
	border: none;
	cursor: pointer;
	font-weight: 600;
	font-size: 14px;
	transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	letter-spacing: 0.5px;
}

.register-btn {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.register-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

/* 콘텐츠 영역 */
.content {
	flex: 1;
	padding: 40px;
	background-color: #f8f9fa;
}

/* 페이지 제목 */
.page-header {
	margin-bottom: 40px;
	text-align: center;
}

.page-header h1 {
	font-size: 36px;
	font-weight: 900;
	color: #333333;
	margin-bottom: 15px;
	letter-spacing: -1px;
}

.page-header p {
	font-size: 18px;
	color: #666666;
	font-weight: 400;
}

/* 회원 정보 카드 */
.member-info-card {
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	border-radius: 20px;
	padding: 40px;
	border: 1px solid #e9ecef;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	position: relative;
	overflow: hidden;
	animation: fadeInUp 0.6s ease forwards;
}

.member-info-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 4px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

/* 정보 항목 스타일 */
.info-item {
	display: flex;
	align-items: center;
	margin-bottom: 25px;
	padding: 20px 0;
	border-bottom: 1px solid #e9ecef;
	transition: all 0.3s ease;
}

.info-item:last-child {
	border-bottom: none;
}

.info-item:hover {
	background-color: rgba(102, 126, 234, 0.02);
	border-radius: 12px;
	padding: 20px 15px;
}

.info-item label {
	display: inline-block;
	font-weight: 700;
	color: #333333;
	margin-right: 20px;
	width: 120px;
	font-size: 15px;
	letter-spacing: 0.5px;
}

.info-item input[type="text"] {
	border: none;
	background-color: transparent;
	font-size: 16px;
	color: #555555;
	font-weight: 500;
	flex: 1;
	padding: 10px 15px;
	border-radius: 8px;
	transition: all 0.3s ease;
}

.info-item input[type="text"]:focus {
	outline: none;
	background-color: #f8f9fa;
	box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.2);
}

.info-item select {
	border: 2px solid #e9ecef;
	background-color: #ffffff;
	font-size: 16px;
	color: #555555;
	font-weight: 500;
	padding: 12px 15px;
	border-radius: 12px;
	transition: all 0.3s ease;
	cursor: pointer;
	min-width: 150px;
}

.info-item select:focus {
	outline: none;
	border-color: #667eea;
	box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

.info-item select:hover {
	border-color: #667eea;
}

/* 업데이트 버튼 영역 */
.button-area {
	margin-top: 40px;
	text-align: center;
	padding-top: 30px;
	border-top: 2px solid #e9ecef;
}

.update-btn {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	border: none;
	padding: 15px 40px;
	border-radius: 25px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	letter-spacing: 0.5px;
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.update-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
}

.update-btn:active {
	transform: translateY(-1px);
}

/* 상태 배지 스타일 */
.status-badge {
	padding: 6px 15px;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 0.5px;
	margin-left: 10px;
}

.status-normal {
	background-color: #d4edda;
	color: #155724;
}

.status-delete {
	background-color: #f8d7da;
	color: #721c24;
}

.blacklist-y {
	background-color: #f8d7da;
	color: #721c24;
}

.blacklist-n {
	background-color: #d4edda;
	color: #155724;
}

/* 반응형 디자인 */
@media (max-width: 1024px) {
	.sidebar {
		width: 240px;
	}
	
	.content {
		padding: 30px 25px;
	}
	
	.member-info-card {
		padding: 30px 25px;
	}
	
	.info-item {
		flex-direction: column;
		align-items: flex-start;
	}
	
	.info-item label {
		width: 100%;
		margin-bottom: 8px;
	}
	
	.info-item input[type="text"],
	.info-item select {
		width: 100%;
	}
}

@media (max-width: 768px) {
	body {
		flex-direction: column;
	}
	
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	
	.sidebar-menu {
		display: flex;
		overflow-x: auto;
		padding: 0 15px;
	}
	
	.sidebar-menu li {
		flex-shrink: 0;
		margin-right: 10px;
	}
	
	.content {
		padding: 20px 15px;
	}
	
	.page-header h1 {
		font-size: 28px;
	}
	
	.member-info-card {
		padding: 25px 20px;
	}
}

/* 로딩 애니메이션 */
@keyframes fadeInUp {
	from {
		opacity: 0;
		transform: translateY(30px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

/* 아이콘 스타일 */
.info-icon {
	margin-right: 8px;
	color: #667eea;
	width: 16px;
	text-align: center;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

$("#update").on("click",function() {
	location.href="updateHuman?human_id="+"${getAdminHuman.human_id}&human_blacklist="+$('#select').val()+"&human_state="+$('#select2').val();
});

// 사이드바 메뉴 클릭 이벤트
$(".sidebar-menu li").on("click", function() {
	$(".sidebar-menu li").removeClass("active");
	$(this).addClass("active");
});

// 대시보드 버튼 클릭
$("#dashboardBtn").on("click", function() {
	location.href = "getAdminHumanList"; // 대시보드 URL로 수정 필요
});

});
</script>

</head>
<body>
	<!-- 좌측 사이드바 -->
	<div class="sidebar">
		<div class="sidebar-logo">동틀무렵</div>
		<div class="sidebar-category">관리자 메뉴</div>
		<ul class="sidebar-menu">
			<li>
				<span id="dashboardBtn">
					<i class="fas fa-chart-pie"></i>
					<span>대시보드</span>
				</span>
			</li>
			<li class="active">
				<a href="getAdminHumanList">
					<i class="fas fa-users"></i>
					<span>회원관리</span>
				</a>
			</li>
		</ul>
	</div>

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<!-- 상단 헤더 -->
		<div class="top-menu">
			<ul class="nav-links">
				<li class="active"><a href="#">회원 정보 관리</a></li>
			</ul>
			<div class="auth-buttons">
				<span class="admin-info">관리자님 환영합니다!</span>
				<button class="register-btn" onclick="location.href='/controller/logout'">
					<i class="fas fa-sign-out-alt"></i>
					로그아웃
				</button>
			</div>
		</div>

		<!-- 콘텐츠 영역 -->
		<div class="content">
			<!-- 페이지 헤더 -->
			<div class="page-header">
				<h1>회원 정보 관리</h1>
				<p>선택된 회원의 상세 정보를 확인하고 관리하세요</p>
			</div>

			<!-- 회원 정보 카드 -->
			<div class="member-info-card">
				<div class="info-item">
					<label><i class="fas fa-user info-icon"></i>아이디</label>
					<input type="text" value="${getAdminHuman.human_id}" readonly>
					<span class="status-badge blacklist-${getAdminHuman.human_blacklist eq 'Y' ? 'y' : 'n'}">
						${getAdminHuman.human_blacklist eq 'Y' ? '블랙리스트' : '정상회원'}
					</span>
				</div>
				
				<div class="info-item">
					<label><i class="fas fa-venus-mars info-icon"></i>성별</label>
					<input type="text" value="${getAdminHuman.human_gender}" readonly>
				</div>
				
				<div class="info-item">
					<label><i class="fas fa-calendar-alt info-icon"></i>생년월일</label>
					<input type="text" value="${getAdminHuman.human_birth}" readonly>
				</div>
				
				<div class="info-item">
					<label><i class="fas fa-phone info-icon"></i>연락처</label>
					<input type="text" value="${getAdminHuman.human_tel}" readonly>
				</div>
				
				<div class="info-item">
					<label><i class="fas fa-envelope info-icon"></i>이메일</label>
					<input type="text" value="${getAdminHuman.human_email}" readonly>
				</div>

				<div class="info-item">
					<label><i class="fas fa-user-plus info-icon"></i>가입일</label>
					<input type="text" value="${getAdminHuman.human_join}" readonly>
				</div>

				<div class="info-item">
					<label><i class="fas fa-ban info-icon"></i>블랙리스트</label>
					<select id="select">
					   <option value="Y" ${getAdminHuman.human_blacklist eq 'Y' ? 'selected' : ''}>블랙리스트</option>
					   <option value="N" ${getAdminHuman.human_blacklist eq 'N' ? 'selected' : ''}>정상</option>
					</select>
				</div>
			
				<div class="info-item">
					<label><i class="fas fa-user-check info-icon"></i>회원상태</label>
					<select id="select2">
					   <option value="normal" ${getAdminHuman.human_state eq 'normal' ? 'selected' : ''}>정상</option>
					   <option value="delete" ${getAdminHuman.human_state eq 'delete' ? 'selected' : ''}>탈퇴</option>
					</select>
					<span class="status-badge status-${getAdminHuman.human_state}">
						${getAdminHuman.human_state eq 'normal' ? '정상' : '탈퇴'}
					</span>
				</div>
				
				<div class="button-area">
					<button class="update-btn" id="update">
						<i class="fas fa-save"></i>
						회원 정보 수정
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>