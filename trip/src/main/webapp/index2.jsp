<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>동틀무렵 - 메인페이지</title>
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

/* 슬라이더 영역 */
/* 슬라이더 영역 */
.slider-container {
   position: relative;
   margin: 0;
   overflow: hidden;
   border-radius: 0;
   width: 100%;
   height: 70vh;
   min-height: 500px;
}

.slider {
   display: flex;
   transition: transform 0.8s cubic-bezier(0.25, 0.46, 0.45, 0.94);
   height: 100%;
}

.slide {
   min-width: 100%;
   height: 100%;
   background-size: cover;
   background-position: center;
   position: relative;
   display: flex;
   align-items: center;
   justify-content: center;
}

.slide::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
   background: linear-gradient(135deg, rgba(0,0,0,0.4) 0%, rgba(0,0,0,0.2) 100%);
}

.slide-content {
   position: relative;
   z-index: 2;
   text-align: center;
   color: white;
   max-width: 800px;
   padding: 0 40px;
}

.slide-content h2 {
   font-size: 48px;
   margin-bottom: 20px;
   font-weight: 900;
   text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
   letter-spacing: -1px;
}

.slide-content p {
   font-size: 20px;
   opacity: 0.95;
   line-height: 1.8;
   text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
   font-weight: 400;
}


.slider-arrows {
   position: absolute;
   top: 50%;
   width: 100%;
   display: flex;
   justify-content: space-between;
   transform: translateY(-50%);
   padding: 0 40px;
   pointer-events: none;
}

.arrow {
   width: 60px;
   height: 60px;
   border-radius: 50%;
   cursor: pointer;
   display: flex;
   align-items: center;
   justify-content: center;
   transition: all 0.3s ease;
   pointer-events: auto;
}

.arrow::before {
   content: '';
   width: 20px;
   height: 20px;
   border-top: 3px solid #333;
   border-right: 3px solid #333;
}

.prev::before {
   transform: rotate(-135deg);
   margin-left: 5px;
}

.next::before {
   transform: rotate(45deg);
   margin-right: 5px;
}

.arrow:hover {
   transform: scale(1.1);
}

.slider-dots {
   position: absolute;
   bottom: 30px;
   left: 50%;
   transform: translateX(-50%);
   display: flex;
   gap: 12px;
}

.dot {
   width: 12px;
   height: 12px;
   background-color: rgba(255, 255, 255, 0.5);
   border-radius: 50%;
   cursor: pointer;
   transition: all 0.3s ease;
   opacity: 0;
   visibility: hidden;
}

.slider-container:hover .dot {
   opacity: 1;
   visibility: visible;
}

.dot.active {
   background-color: white;
   transform: scale(1.3);
}

/* 하단 섹션 */
.bottom-sections {
   padding: 50px 5%;
   background: #f8f9fa;
}

.section-title {
   text-align: center;
   margin-bottom: 60px;
}

.section-title h2 {
   font-size: 36px;
   font-weight: 900;
   color: #333333;
   margin-bottom: 15px;
   letter-spacing: -1px;
}

.section-title p {
   font-size: 18px;
   color: #666666;
   font-weight: 400;
}

.sections-grid {
   display: grid;
   grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
   gap: 40px;
   max-width: 1200px;
   margin: 0 auto;
}

.section {
   flex: 1;
   background-color: white;
   border-radius: 0;
   overflow: hidden;
   transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.section {
   background-color: white;
   border-radius: 20px;
   overflow: hidden;
   transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
   position: relative;
}

.section:hover {
   transform: translateY(-10px);
   cursor: pointer;
}

.section-image {
   height: 250px;
   background-size: cover;
   background-position: center;
   position: relative;
   overflow: hidden;
}

.section-image::before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
   background: linear-gradient(135deg, rgba(102, 102, 102, 0.1) 0%, rgba(119, 119, 119, 0.1) 100%);
   opacity: 0;
   transition: all 0.3s ease;
}

.section:hover .section-image::before {
   opacity: 1;
}

.section-content {
   padding: 30px;
   position: relative;
}

.section-content h3 {
   font-size: 22px;
   margin-bottom: 15px;
   color: #333333;
   font-weight: 700;
   letter-spacing: -0.5px;
}

.section-content p {
   color: #666666;
   font-size: 16px;
   line-height: 1.8;
   font-weight: 400;
}

.section-tag {
   position: absolute;
   top: 20px;
   right: 20px;
   background: #444444;
   color: white;
   padding: 8px 16px;
   border-radius: 20px;
   font-size: 12px;
   font-weight: 600;
   text-transform: uppercase;
   letter-spacing: 0.5px;
}

/* 최근 인기 게시글 섹션 */
.popular-posts {
   padding: 50px 5%;
   background: #e6eaed;
}

.popular-posts-title {
   text-align: center;
   margin-bottom: 60px;
}

.popular-posts-title h2 {
   font-size: 36px;
   font-weight: 900;
   color: #333333;
   margin-bottom: 15px;
   letter-spacing: -1px;
}

.popular-posts-title p {
   font-size: 18px;
   color: #666666;
   font-weight: 400;
}

.posts-grid {
   display: grid;
   grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
   gap: 30px;
   max-width: 1200px;
   margin: 0 auto;
}

.post-card {
   background: white;
   border-radius: 15px;
   overflow: hidden;
   transition: all 0.3s ease;
   border: 1px solid #f0f0f0;
   cursor: pointer;
}

.post-card:hover {
   transform: translateY(-5px);
}

.post-card-header {
   padding: 20px 20px 0;
   display: flex;
   align-items: center;
   gap: 12px;
}

.post-category {
   background: #444444;
   color: white;
   padding: 4px 12px;
   border-radius: 12px;
   font-size: 12px;
   font-weight: 600;
   text-transform: uppercase;
}

.post-date {
   color: #999;
   font-size: 12px;
   font-weight: 500;
}

.post-card-content {
   padding: 15px 20px 20px;
}

.post-card h4 {
   font-size: 16px;
   font-weight: 700;
   color: #333;
   margin-bottom: 8px;
   line-height: 1.4;
}

.post-card p {
   font-size: 14px;
   color: #666;
   line-height: 1.6;
   overflow: hidden;
   display: -webkit-box;
   -webkit-line-clamp: 2;
   -webkit-box-orient: vertical;
}

.post-meta {
   display: flex;
   justify-content: space-between;
   align-items: center;
   margin-top: 15px;
   padding-top: 15px;
   border-top: 1px solid #f0f0f0;
}

.post-author {
   font-size: 12px;
   color: #999;
   font-weight: 500;
}

.post-stats {
   display: flex;
   gap: 15px;
   font-size: 12px;
   color: #999;
}

.post-stats span {
   display: flex;
   align-items: center;
   gap: 4px;
}

</style>
</head>
<body><!-- 좌측 사이드바 -->
	
	
	
	

	<!-- 헤더 시작 -->
	<header class="header">

		<!-- 로고 -->
		<div class="logo">
		<img class="logo-image" alt="로고이미지" src="">
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
					<li><a href="walking_redesign">산책코스</a></li>
					<li><a href="running">러닝코스</a></li>
					<li><a href="hiking">등산코스</a></li>
					<li><a href="game">대회정보</a></li>
					<li><a href="hotspot">주변명소</a></li>
					<li><a href="board">커뮤니티</a></li>
					<li><a href="NewFile222">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- 헤더 끝 -->

	<!-- 콘텐츠 영역 -->
	<div class="content">
		<!-- 상단 슬라이더 -->
		<div class="slider-container">
			<div class="slider">
				<div class="slide"
					style="background-image: url('resources/images/main_image1.jpg');">
					<div class="slide-content">
						<h2>서울 숲 힐링 산책로</h2>
						<p>도심 속 자연을 느낄 수 있는 서울 숲의 아름다운 산책로를 만나보세요.</p>
					</div>
				</div>
				<div class="slide"
					style="background-image: url('resources/images/main_image2.jpg');">
					<div class="slide-content">
						<h2>한강변 러닝 코스</h2>
						<p>탁 트인 전망과 함께하는 한강변 러닝 코스로 활기찬 하루를 시작해보세요.</p>
					</div>
				</div>
				<div class="slide"
					style="background-image: url('resources/images/main_image3.jpg');">
					<div class="slide-content">
						<h2>북한산 등산로</h2>
						<p>도전과 성취감을 느낄 수 있는 북한산의 다양한 등산 코스를 경험해보세요.</p>
					</div>
				</div>
			</div>

			<div class="slider-arrows">
				<div class="arrow prev"></div>
				<div class="arrow next"></div>
			</div>

			<div class="slider-dots">
				<div class="dot active"></div>
				<div class="dot"></div>
				<div class="dot"></div>
			</div>
		</div>

		<!-- 하단 섹션 -->
		<div class="bottom-sections">
			<div class="section-title">
				<h2>추천 코스</h2>
				<p>당신에게 완벽한 운동 코스를 찾아보세요</p>
			</div>
			
			<div class="sections-grid">
			<div class="section">
				<div class="section-image"
					style="background-image: url('resources/images/main_image1.jpg');">
				</div>
				<div class="section-content">
					<div class="section-tag">추천</div>
					<h3>초보자를 위한 서울 둘레길</h3>
					<p>서울의 아름다운 자연을 감상하며 가볍게 걸을 수 있는 초보자 친화적인 코스입니다. 계절마다 다른 매력을
						느낄 수 있어 사계절 내내 인기가 많습니다.</p>
				</div>
			</div>
			<div class="section">
				<div class="section-image"
					style="background-image: url('resources/images/main_image3.jpg');">
				</div>
				<div class="section-content">
					<div class="section-tag">인기</div>
					<h3>등산 코스</h3>
					<p>아름다운 풍경과 함께 건강한 등산을 즐길 수 있는 코스입니다. 다양한 난이도의 코스가 준비되어 있어
						초보자부터 전문가까지 모두 만족할 수 있습니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 최근 인기 게시글 섹션 -->
		<div class="popular-posts">
			<div class="popular-posts-title">
				<h2>최근 인기 게시글</h2>
				<p>커뮤니티에서 가장 인기 있는 게시글들을 확인해보세요</p>
			</div>
			
			<div class="posts-grid">
				<div class="post-card">
					<div class="post-card-header">
						<span class="post-category">산책</span>
						<span class="post-date">2024.01.15</span>
					</div>
					<div class="post-card-content">
						<h4>서울숲 산책 후기 - 겨울철 추천 코스</h4>
						<p>겨울철에도 아름다운 서울숲의 매력을 느낄 수 있는 산책 코스를 소개합니다. 눈 내린 풍경이 정말 환상적이었어요.</p>
						<div class="post-meta">
							<span class="post-author">산책러버</span>
							<div class="post-stats">
								<span><i class="fas fa-heart"></i> 24</span>
								<span><i class="fas fa-comment"></i> 8</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="post-card">
					<div class="post-card-header">
						<span class="post-category">러닝</span>
						<span class="post-date">2024.01.14</span>
					</div>
					<div class="post-card-content">
						<h4>한강 러닝 마라톤 대회 참가 후기</h4>
						<p>지난 주말 한강에서 열린 마라톤 대회에 참가했습니다. 날씨도 좋고 분위기도 너무 좋았어요!</p>
						<div class="post-meta">
							<span class="post-author">러닝맨</span>
							<div class="post-stats">
								<span><i class="fas fa-heart"></i> 18</span>
								<span><i class="fas fa-comment"></i> 12</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="post-card">
					<div class="post-card-header">
						<span class="post-category">등산</span>
						<span class="post-date">2024.01.13</span>
					</div>
					<div class="post-card-content">
						<h4>북한산 등산 초보자 가이드</h4>
						<p>북한산 등산을 처음 시작하는 분들을 위한 완벽 가이드입니다. 준비물부터 코스 선택까지!</p>
						<div class="post-meta">
							<span class="post-author">산악인</span>
							<div class="post-stats">
								<span><i class="fas fa-heart"></i> 35</span>
								<span><i class="fas fa-comment"></i> 15</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="post-card">
					<div class="post-card-header">
						<span class="post-category">명소</span>
						<span class="post-date">2024.01.12</span>
					</div>
					<div class="post-card-content">
						<h4>운동 후 방문하기 좋은 카페 BEST 5</h4>
						<p>운동 후 휴식을 취하기 좋은 카페들을 소개합니다. 건강한 메뉴와 좋은 분위기까지!</p>
						<div class="post-meta">
							<span class="post-author">카페마니아</span>
							<div class="post-stats">
								<span><i class="fas fa-heart"></i> 42</span>
								<span><i class="fas fa-comment"></i> 20</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	<script>
		// 슬라이더 기능 구현
		document.addEventListener('DOMContentLoaded', function() {
			const slider = document.querySelector('.slider');
			const slides = document.querySelectorAll('.slide');
			const dots = document.querySelectorAll('.dot');
			const prevArrow = document.querySelector('.prev');
			const nextArrow = document.querySelector('.next');
			
			let currentSlide = 0;
			const slideCount = slides.length;
			
			// 슬라이드 이동 함수
			function goToSlide(index) {
				if (index < 0) {
					index = slideCount - 1;
				} else if (index >= slideCount) {
					index = 0;
				}
				
				slider.style.transform = `translateX(-${index * 100}%)`;
				
				// 액티브 닷 업데이트
				dots.forEach(dot => dot.classList.remove('active'));
				dots[index].classList.add('active');
				
				currentSlide = index;
			}
			
			// 이벤트 리스너 설정
			prevArrow.addEventListener('click', () => {
				goToSlide(currentSlide - 1);
			});
			
			nextArrow.addEventListener('click', () => {
				goToSlide(currentSlide + 1);
			});
			
			// 닷 클릭 이벤트
			dots.forEach((dot, index) => {
				dot.addEventListener('click', () => {
					goToSlide(index);
				});
			});
			
			// 자동 슬라이드 기능
			let slideInterval = setInterval(() => {
				goToSlide(currentSlide + 1);
			}, 5000);
			
			// 슬라이드 컨테이너에 마우스 오버 시 자동 슬라이드 정지
			const sliderContainer = document.querySelector('.slider-container');
			
			sliderContainer.addEventListener('mouseenter', () => {
				clearInterval(slideInterval);
			});
			
			sliderContainer.addEventListener('mouseleave', () => {
				slideInterval = setInterval(() => {
					goToSlide(currentSlide + 1);
				}, 5000);
			});
		});
	</script>
</body>
</html>