<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동틀무렵 - 회원관리</title>
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

.sidebar-logo a {
	text-decoration: none;
	color: #333333;
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

.sidebar-menu li:hover {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	transform: translateX(5px);
}

.sidebar-menu li:hover a {
	color: white;
	font-weight: 600;
}

.sidebar-menu li.active {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.sidebar-menu li.active a {
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

/* 검색 폼 */
.search-form {
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	border-radius: 20px;
	padding: 30px;
	margin-bottom: 30px;
	border: 1px solid #e9ecef;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
	position: relative;
	overflow: hidden;
}

.search-form::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 4px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.search-form form {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 15px;
	flex-wrap: wrap;
}

.search-form select,
.search-form input[type="text"] {
	padding: 12px 20px;
	border: 2px solid #e9ecef;
	border-radius: 25px;
	font-size: 14px;
	font-weight: 500;
	transition: all 0.3s ease;
	background: white;
}

.search-form select:focus,
.search-form input[type="text"]:focus {
	outline: none;
	border-color: #667eea;
	box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

.search-form input[type="submit"] {
	padding: 12px 30px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	border: none;
	border-radius: 25px;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
	transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	letter-spacing: 0.5px;
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.search-form input[type="submit"]:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

/* 테이블 컨테이너 */
.table-container {
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	border-radius: 20px;
	padding: 0;
	border: 1px solid #e9ecef;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
	overflow: hidden;
	position: relative;
}

.table-container::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 4px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

/* 테이블 스타일 */
#adminHumanList {
	width: 100%;
	border-collapse: collapse;
	background: white;
	font-size: 14px;
}

#adminHumanList thead {
	background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
}

#adminHumanList th {
	padding: 20px 15px;
	font-weight: 700;
	color: #333333;
	text-align: center;
	border-bottom: 2px solid #e9ecef;
	font-size: 15px;
	letter-spacing: 0.5px;
}

#adminHumanList td {
	padding: 18px 15px;
	text-align: center;
	border-bottom: 1px solid #f1f3f4;
	color: #555555;
	font-weight: 500;
	transition: all 0.3s ease;
}

#adminHumanList tbody tr {
	transition: all 0.3s ease;
}

#adminHumanList tbody tr:hover {
	background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 100%);
	transform: translateY(-1px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

#adminHumanList tbody tr:last-child td {
	border-bottom: none;
}

/* 수정 버튼 스타일 */
.modify {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	border: none;
	padding: 8px 20px;
	border-radius: 20px;
	font-weight: 600;
	font-size: 12px;
	cursor: pointer;
	transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	letter-spacing: 0.5px;
	box-shadow: 0 2px 10px rgba(102, 126, 234, 0.3);
}

.modify:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
}

/* 상태별 라벨 스타일 */
.status-label {
	padding: 6px 12px;
	border-radius: 15px;
	font-weight: 600;
	font-size: 12px;
	letter-spacing: 0.5px;
}

.status-active {
	background: rgba(46, 204, 113, 0.1);
	color: #2ecc71;
}

.status-inactive {
	background: rgba(231, 76, 60, 0.1);
	color: #e74c3c;
}

.status-dormant {
	background: rgba(241, 196, 15, 0.1);
	color: #f1c40f;
}

/* 블랙리스트 라벨 스타일 */
.blacklist-yes {
	background: rgba(231, 76, 60, 0.1);
	color: #e74c3c;
	padding: 4px 10px;
	border-radius: 12px;
	font-weight: 600;
	font-size: 11px;
}

.blacklist-no {
	background: rgba(46, 204, 113, 0.1);
	color: #2ecc71;
	padding: 4px 10px;
	border-radius: 12px;
	font-weight: 600;
	font-size: 11px;
}

/* 반응형 디자인 */
@media (max-width: 1024px) {
	.sidebar {
		width: 240px;
	}
	
	.content {
		padding: 30px 25px;
	}
	
	.search-form form {
		flex-direction: column;
		align-items: stretch;
	}
	
	.search-form select,
	.search-form input[type="text"],
	.search-form input[type="submit"] {
		width: 100%;
		margin-bottom: 10px;
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
	
	.table-container {
		overflow-x: auto;
	}
	
	#adminHumanList {
		min-width: 800px;
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

.search-form, .table-container {
	animation: fadeInUp 0.6s ease forwards;
}

.table-container {
	animation-delay: 0.2s;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

$(".modify").on("click",function() {
	location.href="getAdminHumanForm?human_id="+$(this).val();
});

});
</script> 

</head>
<body>
	<!-- 좌측 사이드바 -->
	<div class="sidebar">
		<div class="sidebar-logo"><a href="adminDashBoard">동틀무렵</a></div>
		<div class="sidebar-category">관리자 메뉴</div>
		<ul class="sidebar-menu">
			<li>
				<a href="adminDashBoard">
					<i class="fas fa-chart-pie"></i>
					<span>대시보드</span>
				</a>
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
				<li class="active"><a href="#">회원관리</a></li>
			</ul>
			<div class="auth-buttons">
				<span class="admin-info">관리자님 환영합니다!</span>		
				<button class="register-btn" onclick="location.href='/trip/logout'">
					<i class="fas fa-sign-out-alt"></i>
					로그아웃
				</button>
			</div>
		</div>

		<!-- 콘텐츠 영역 -->
		<div class="content">
			<!-- 페이지 헤더 -->
			<div class="page-header">
				<h1>회원관리</h1>
				<p>동틀무렵 서비스 회원들의 정보를 관리하고 조회하세요</p>
			</div>

			<!-- 검색 폼 -->
			<div class="search-form">
				<form name="form1" method="post" action="getAdminHumanList">	
					<select name="searchOption">
					   <option value="human_name" <c:out value="${searchOption == 'human_name'?'selected':''}"/> >회원명</option>
					   <option value="human_blacklist" <c:out value="${searchOption == 'human_blacklist'?'selected':''}"/> >블랙리스트</option>
					   <option value="human_state" <c:out value="${searchOption == 'human_state'?'selected':''}"/> >회원상태</option>
					</select>
					<input name="keyword" value="${keyword}" placeholder="검색어를 입력하세요">
					<input type="submit" value="조회">
				</form>
			</div>
	
			<!-- 테이블 컨테이너 -->
		    <div class="table-container">	    
				<table id="adminHumanList">
					<thead>
					    <tr>
					      <th>아이디</th>
					      <th>이름</th>
					      <th>생년월일</th>
					      <th>성별</th>
					      <th>연락처</th>
					      <th>이메일</th>
					      <th>블랙리스트</th>
					      <th>회원상태</th>
					      <th>관리</th>
					    </tr>
					</thead>
	  				<tbody>
				 		<c:forEach var="item" items="${getAdminHumanList}">
				 		 <tr> 
						  <td>${item.human_id}</td>
					      <td>${item.human_name}</td>
					      <td>${item.human_birth}</td>
					      <td>${item.human_gender}</td>
					      <td>${item.human_tel}</td>
					      <td>${item.human_email}</td>
					      <td>
					      	<c:choose>
					      		<c:when test="${item.human_blacklist == 'Y'}">
					      			<span class="blacklist-yes">블랙리스트</span>
					      		</c:when>
					      		<c:otherwise>
					      			<span class="blacklist-no">정상</span>
					      		</c:otherwise>
					      	</c:choose>
					      </td>
					      <td>
					      	<c:choose>
					      		<c:when test="${item.human_state == '활성'}">
					      			<span class="status-label status-active">활성</span>
					      		</c:when>
					      		<c:when test="${item.human_state == '휴면'}">
					      			<span class="status-label status-dormant">휴면</span>
					      		</c:when>
					      		<c:otherwise>
					      			<span class="status-label status-inactive">비활성</span>
					      		</c:otherwise>
					      	</c:choose>
					      </td>
					      <td>
					        <button class="modify" value="${item.human_id}">
					        	<i class="fas fa-edit"></i>
					        	수정
					        </button>
					      </td>
					      </tr>
						</c:forEach>	
	  				</tbody>
				</table>		
			</div>

		</div>
	</div>
</body>
</html>