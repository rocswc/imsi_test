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

/* 좌측 사이드바 */



/* 기본 스타일 */
* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
}

body {
   background-color: #FFFFFA;
   min-height: 100vh;
}

/* 헤더 스타일 */
.header {
  width: 100%;
  background-color: #FFFFFA;
  padding: 20px 0 0;
  border-bottom: 1px solid #eee;
}

/* 로고 스타일 */
.logo {
  text-align: center;
  margin-bottom: 20px;
}

.logo h1 {
  color: #156206;
  font-size: 28px;
  font-weight: 700;
}

/* 네비게이션 컨테이너 */
.nav-container {
  /* max-width: 1200px;
  margin: 0 auto;
  display: flex;
  padding: 0 20px 15px;
  align-items: center;
  justify-content: space-between; */
  
   max-width: 100%;
  width: 100%;
  padding: 0 0 15px;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

/* 중앙 메뉴 */
.nav-menu {
  flex: 1;
  text-align: center;
}

.nav-menu ul {
  display: inline-flex;
  list-style: none;
  gap: 24px;
}

.nav-menu ul li a {
  text-decoration: none;
  color: #333;
  font-weight: 500;
  font-size: 16px;
}

.nav-menu ul li a:hover {
  color: #156206;
}

/* 로그인/회원가입 버튼 */
.auth-buttons {
  /* display: flex;
  gap: 10px; */
  position: absolute;
  right: 30px;
  top: 50%;
  transform: translateY(-50%);
  display: flex;
  gap: 10px;
}

.auth-buttons button {
  padding: 8px 18px;
  border-radius: 20px;
  border: none;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.3s;
}

.auth-buttons p {
  padding: 8px 18px;
  border-radius: 20px;
  border: none;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.3s;
}

.login-btn {
  background-color: #FFFFFA;
  color: #156206;
  border: 1px solid #156206;
}

.register-btn {
  background-color: #156206;
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
   background-color: #FFFFFA;
   padding-right: 200px;
}

/* 슬라이더 영역 */
.slider-container {
   position: relative;
   margin-bottom: 40px;
   overflow: hidden;
   border-radius: 0;
   max-width: 80%;
   padding-top: 3/4;
   margin-left: auto;
   margin-right: auto;
}

.slider {
   display: flex;
   transition: transform 0.5s ease;
}

.slide {
   min-width: 100%;
   height: 600px;
   background-size: cover;
   background-position: center;
   position: relative;
}

.slide-content {
   position: absolute;
   bottom: 0;
   left: 0;
   width: 100%;
   padding: 60px 40px 40px;
   background: linear-gradient(to top, rgba(0, 0, 0, 0.75), transparent);
   color: white;
}

.slide-content h2 {
   font-size: 32px;
   margin-bottom: 15px;
   font-weight: 700;
   text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
}

.slide-content p {
   font-size: 18px;
   opacity: 0.95;
   max-width: 600px;
   line-height: 1.6;
   text-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
}

.slider-arrows {
   position: absolute;
   top: 50%;
   width: 100%;
   display: flex;
   justify-content: space-between;
   transform: translateY(-50%);
   padding: 0 20px;
}

.arrow:hover {
   background-color: rgba(255, 255, 255, 1);
   transform: scale(1.1);
}

.slider-dots {
   position: absolute;
   bottom: 20px;
   left: 50%;
   transform: translateX(-50%);
   display: flex;
   gap: 8px;
}

.dot {
   width: 10px;
   height: 10px;
   background-color: rgba(255, 255, 255, 0.5);
   border-radius: 50%;
   cursor: pointer;
   transition: all 0.3s;
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
   display: flex;
   gap: 30px;
   max-width: 80%;
   margin: 0 auto;
}

.section {
   flex: 1;
   background-color: white;
   border-radius: 0;
   overflow: hidden;
   transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.section:hover {
   transform: translateY(-6px);
   cursor: pointer;
}

.section-image {
   height: 200px;
   background-size: cover;
   background-position: center;
}

.section-content {
   padding: 25px;
   position: relative;
}

.section-content h3 {
   font-size: 20px;
   margin-bottom: 12px;
   color: #2c3e50;
   font-weight: 600;
}

.section-content p {
   color: #666;
   font-size: 15px;
   line-height: 1.7;
}

.section-tag {
   position: absolute;
   top: 20px;
   right: 20px;
   background-color: #156206;
   color: white;
   padding: 8px 15px;
   border-radius: 0;
   font-size: 14px;
   font-weight: 500;
   box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
   opacity: 0;
   transition: opacity 0.3s ease;
   pointer-events: none;
}

.section:hover .section-tag {
   opacity: 1;
   pointer-events: auto;
}


</style>
</head>
<body><!-- 좌측 사이드바 -->
	
	
	
	

	<!-- 헤더 시작 -->
	<header class="header">
		<!-- 로고 -->
		<div class="logo">
  <h1><a href="index.jsp" style="text-decoration: none; color: #156206;">동틀무렵</a></h1>
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
					<li><a href="#">커뮤니티</a></li>
					<li><a href="bookmark_hiking">마이페이지</a></li>
				</ul>
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