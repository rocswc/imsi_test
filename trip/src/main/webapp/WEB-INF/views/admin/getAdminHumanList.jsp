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

form {
    width: 100%;
    display: flex;
    justify-content:center;
    margin-top: 30px;
}

/* 테이블 컨테이너 스타일 */
.table-container {
    width: 100%;
    display: flex;
    justify-content: center;
    margin-top: 30px;
}

/* 테이블 스타일 */
#adminHumanList {
    border-collapse: collapse;
    text-align: center;
    width: auto;
}

#adminHumanList th {
    padding: 10px;
    border: 1px solid #ddd;
    background-color: #f2f2f2;
}

#adminHumanList td {
    padding: 8px;
    border: 1px solid #ddd;
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
				
			<form name="form1" method="post" action="getAdminHumanList">	
				<select name="searchOption">
				   <option value="human_name" <c:out value="${searchOption == 'human_name'?'selected':''}"/> >회원명</option>
				   <option value="human_blacklist" <c:out value="${searchOption == 'human_blacklist'?'selected':''}"/> >블랙리스트</option>
				   <option value="human_state" <c:out value="${searchOption == 'human_state'?'selected':''}"/> >회원상태</option>
				</select>
			<input name="keyword" value="${keyword}">
			<input type="submit" value="조회">
			</form>	
	
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
					      <td>${item.human_blacklist}</td>
					      <td>${item.human_state}</td>
					      <td>
					        <button class="modify" value="${item.human_id}">수정</button>
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