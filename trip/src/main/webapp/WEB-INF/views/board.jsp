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

<!-- bxSlider Javascript file -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />


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
   width: 1600px;
   background-color: white;
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

/* 커뮤니티(board) 정보 표시 영역 스타일 */
.container {
    max-width: 1600px;
    margin: 0 auto;
    padding: 20px;
}

/* 슬라이드 컨테이너 스타일 */
.slider-container {
    width: 100%;
    overflow: hidden;
    margin-bottom: 40px;
}

.slider {
    display: flex;
    transition: transform 0.5s ease;
}

/* 여러 슬라이드 섹션 구분용 */
.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 30px;
    margin-bottom: 30px;
    padding-bottom: 5px;
}

.section-title {
    font-size: 20px;
    font-weight: bold;
}

/* 작성 버튼 스타일 추가 */
.section-header button {
    padding: 5px 10px;
    background-color: #fff;
    color: #333;
    border: 1px solid #ddd;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.section-header button:hover {
    background-color: #191919;
    color: #fff;
    border-color: #191919;
}

.section {
    margin-bottom: 40px;
    max-width: 1600px;
    margin-left: auto;
    margin-right: auto;
}

/* 카드 이미지 슬라이드 */
.card {
    flex: 0 0 calc(25% - 15px);
    min-width: 383px;
    max-width: 383px;
    margin: 0 7.5px;
    border: 1px solid #ddd;
    overflow: hidden;
    transition: all 0.3s;
    cursor: pointer;
    background: #fff;
    border-radius: 8px;
}

.card:hover {
	cursor: pointer;
}

.card-img-container {
    width: 100%;
    position: relative;
    aspect-ratio: 4/3;
    overflow: hidden;
}

.card-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.card-content {
    padding: 15px;
}

.card-header {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.card-tag {
    background-color: #f2f2f2;
    color: #555;
    font-size: 12px;
    padding: 3px 8px;
    border-radius: 12px;
    margin-right: 8px;
}

.card-title {
    font-weight: bold;
    font-size: 16px;
    margin: 0 0 10px 0;
    color: #333;
    line-height: 1.4;
}

.card-info {
    font-size: 13px;
    color: #777;
}

.user-date {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}

.stats {
    display: flex;
    gap: 12px;
    margin-top: 8px;
}

.stat {
    display: flex;
    align-items: center;
    gap: 4px;
}

.stat-icon {
    font-size: 14px;
}

.liked {
    color: #156206;
}

/* bxSlider 커스터마이징 */
.bx-wrapper {
    max-width: 100% !important;
    margin: 0 auto !important;
}

.bx-wrapper .bx-viewport {
    left: 0 !important;
}

</style>
</head>
<body>

	<!-- 헤더 시작 -->
	<header class="header">

		<!-- 로고 -->
		<div class="logo">
		<img class="logo-image" alt="로고이미지" src="">
			<h1><a href="index2.jsp">동틀무렵</a></h1>
		</div>
				
		<!-- 로그인/회원가입 버튼 -->
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
					<li><a href="bookmark">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- 헤더 끝 -->

  <!-- 게시판 컨텐츠 영역 -->
        <div class="container">
            	<div class="section-header">
                	<h2 class="section-title">최신 게시글</h2>
                	<button onclick="location.href='boardInsert'">작성</button>   
                </div>
         </div>
            
             
          <div class="section">
              <div class="slider-container">
                    
                    <div class="bxslider" id="popular-slider">
                  		<c:forEach var="boards" items="${boardList}">
                            <div class="card" onclick="location.href='getBoard?board_id=${boards.board_id}'">
                                <div class="card-img-container">
                                <c:if test="${not empty boards.board_fname}">
					                <img src="${pageContext.request.contextPath}/resources/images/${boards.board_realfname}_${boards.board_fname}" alt="이미지" class="card-img">
					            </c:if>
                                </div>
                                <div class="card-content">
                                    <div class="card-header">
                                        <span class="card-tag">#러닝 #오런완</span>
                                    </div>
                                    <h3 class="card-title">${boards.board_title}</h3>
                                    <div class="card-info">
                                        <div class="user-date">
                                            <span>작성자: ${boards.human_id}</span>
                                            <span>${boards.board_date}</span>
                                        </div>
                                        <div class="stats">
                                            <!-- <div class="stat">
                                                <span class="stat-icon">조회수</span>
                                                <span>45</span>
                                            </div> -->
                                            <div class="stat">
                                                <span class="stat-icon">댓글</span>
                                                <span>${boards.reply_count !=null? boards.reply_count : 0}</span>
                                            </div>
                                            <div class="stat">
                                                <span class="stat-icon">❤</span>
                                                <span>${boards.like_count !=null? boards.like_count : 3}</span>
                                            </div>
                                        </div>
                                    </div>
                                   </div>
                                   
                            </div>
                     	</c:forEach>   
                     </div>
                        
                        <!-- <div class="slider-controls">
                            <button class="slider-button prev-button" id="popular-prev">◀</button>
                            
                        <div class="indicators" id="popular-indicators">
                            <span class="indicator active" data-index="0"></span>
                            <span class="indicator" data-index="1"></span>
                            <span class="indicator" data-index="2"></span>
                            <span class="indicator" data-index="3"></span>
                            <span class="indicator" data-index="4"></span>
                        </div>
                            
                            <button class="slider-button next-button" id="popular-next">▶</button>
                        </div> -->
                        
                 	</div>
          		</div>
			

	<script>
	
	//슬라이더기능
 	$(function(){
	    $('.bxslider').bxSlider({
	     //옵션 입력
	     maxSlides: 4,
	     minSlides: 4,
	     mode: 'horizontal',
	     captions: true,
	     moveSlides: 1,
	     infiniteLoop: false,
	     pager: true
	    });
	  });

	</script>
    
</body>

</html>