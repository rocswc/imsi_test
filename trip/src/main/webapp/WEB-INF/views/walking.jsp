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



   
   .nav-menu {
      margin-bottom: 15px;
   }
   
   .nav-menu ul {
      flex-wrap: wrap;
      justify-content: center;
   }
   
   .auth-buttons {
      margin-top: 10px;
   }
   
   .walking-course {
  /*   margin-top: 30px;
    margin-bottom: 20px;
    padding: 0 30px; */
    
     margin: 30px auto 20px;
    padding: 0 30px;
    max-width: 1000px;
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
    width : 70px;
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
     #map {
    width: 650px;
    height: 350px;
    background: #eee;
  }
  

</style>
</head>
<body>

  	 

	<!-- 헤더 시작 -->
	<header class="header">
		<!-- 로고 -->
		<div class="logo">
			<h1>
				<a href="index.jsp" style="text-decoration: none; color: #156206;">동틀무렵</a>
			</h1>
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
					<li><a href="#">커뮤니티</a></li>
					<li><a href="bookmark_walking">마이페이지</a></li>
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
		
		<!-- 코스 정보 영역 (이미지와 같은 형태로 수정) -->
		<div class="walking-course">
			<div class="course-header">
				<h3>산책코스</h3>
				<button id="bookmark-btn" class="bookmark-btn">북마크</button>
			</div>
			<div class="info-form">
			<input type="hidden" id="walking-id">
				<div class="info-item">
					<label for="my-location">내위치</label>
					<div id="map"></div>
				</div>
				<br>
				<div class="info-item">
					<label for="course-name">산책로</label> <input type="text"
						id="course-name" readonly>
				</div>
				<div class="divider"></div>
				<div class="info-item">
					<label for="course-distance">총거리</label> <input type="text"
						id="course-distance" readonly>km
				</div>
				<div class="divider"></div>
				<div class="info-item">
					<label for="course-info">코스정보</label>
					<button id="translate-btn" style="margin-left: 10px;">번역하기</button>
					<div id="course-info"></div>
				</div>
			</div>
		</div>
	
	
		<script>
  	 	// 현재 위치 가져오기
  		navigator.geolocation.getCurrentPosition(function(position) {
			const lat = position.coords.latitude;
			const lon = position.coords.longitude;
			//console.log('latitude',lat);
			//console.log('longitude',lon);
	
	        //지도 띄우기
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(lat, lon), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
		
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
  	 		// 내 위치 마커
 	 	     const marker = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(lat, lon),
				map: map,
				title: '내 위치'
           	 });
			
 			// 주변 코스 위치			
			var param = { walking_latitude : lat , walking_longitude : lon}
 			
 			console.log(param);
				// 페이지 로드 시 Ajax 자동 실행
				$.ajax({
					type: "GET"
					, url: "walkingMap"
					, data: param
					, dataType: "json"
					, success: function(response){
						console.log("성공:",response);
						response.forEach(function(course){
							const walkingMarker = new kakao.maps.LatLng(course.walking_latitude, course.walking_longitude);
							const marker = new kakao.maps.Marker({
			                    position: walkingMarker
			                    ,map: map
			                    ,title: course.walking_name
							});
							
							// 마커 클릭 시 해당 정보 출력
							kakao.maps.event.addListener(marker, 'click', function(){
								 
								 $("#walking-id").val(course.walking_id);
								$("#course-name").val(course.walking_name);
								$("#course-distance").val(course.walking_distance);
								$("#course-info").text(course.walking_info);
								/*  $("#walking-latitude").val(course.walking_latitude);
							  	 $("#walking-longitude").val(course.walking_longitude); */
							  	 
							 	$.ajax({
							  	 	  type: "POST",
							  	 	  url: "insertWalking",
							  	 	data: JSON.stringify({ walking_id: $("#walking-id").val() }), // VO 필드와 맞춰서 전송
							  	 	  contentType: "application/json",
							  	 	  success: function (res) {
							  	 	    alert(res);  // 👉 여기에 "ok"가 출력됨
							  	 	  },
							  	 	  error: function () {
							  	 	    alert("실패!");
							  	 	  }
							  	 	});
							});
						});
					}, error: function(err){
						console.error("에러:",err);
					}
				});
  		});
  	 	
  	 	// 북마크 저장 및 해제
  	 	$("#bookmark-btn").click(function(){
  	 		const $btn = $(this);
  	 		const currentIcon = $btn.text();
  	 		if(currentIcon === "북마크"){
  	 			$btn.text("북마크⭐");
  	 		} else{
  	 			$btn.text("북마크");
  	 		}
  	 	});
  	 	
  	 	$("#bookmark-btn").click(function () {
  	 	  const courseName = $("#course-name").val();

  	 	  if (!courseName) {
  	 	    alert("먼저 코스를 선택하세요!");
  	 	    return;
  	 	  }

  	 	  const courseData = {
  	 			walking_id: $("#walking-id").val(),
  	 	    walking_name: $("#course-name").val(),

  	 
  	 	  };

  	 	  $.ajax({
  	 	    type: "POST",
  	 	    url: "addbookmarkwalking",
  	 	    contentType: "application/json",
  	 	    data: JSON.stringify(courseData),
  	 	    success: function (res) {
  	 	      if (res.status === "success") {
  	 	        alert("북마크에 저장되었습니다!");
  	 	        $("#bookmark-btn").text("북마크⭐"); // 텍스트만 변경
  	 	      }
  	 	    },
  	 	    error: function () {
  	 	      alert("북마크 저장 실패");
  	 	    }
  	 	  });
  	 	});
  	 	$("#translate-btn").click(function () {
  	 	
  	 	  const param = {
  	 			 walking_id: parseInt($("#walking-id").val()),
  	 	        walking_name: $("#course-name").val(),
  	 	        walking_distance: $("#course-distance").val(),
  	 	        walking_info: $("#course-info").text()
  	 	  };
  	 	 console.log("보내는 값:", param); 

  	 	  $.ajax({
  	 	    type: "POST",
  	 	    url: "/controller/translate",
  	 	    contentType: "application/json",
  	 	    data: JSON.stringify(param),
  	 	    success: function (data) {
  	 	      // 예: 번역된 코스를 콘솔에 출력 (또는 변수 처리)
  	 	     $("#course-name").val(data.walking_name);
             $("#course-distance").val(data.walking_distance);
             $("#course-info").text(data.walking_info);
             
             
             $("label[for='course-name']").text("Course");
             $("label[for='course-distance']").text("Distance");
             $("label[for='my-location']").text("My Location");
             $("label[for='course-info']").text("Course Info");
             $(".course-header h3").text("Walking Course");
             $("#bookmark-btn").text("Bookmark");
             $(".logo h1 a").text("Dawn Walk");
             $(".nav-menu ul li:nth-child(1) a").text("Walking");
             $(".nav-menu ul li:nth-child(2) a").text("Running");
             $(".nav-menu ul li:nth-child(3) a").text("Hiking");
             $(".nav-menu ul li:nth-child(4) a").text("Events");
             $(".nav-menu ul li:nth-child(5) a").text("Hotspots");
             $(".nav-menu ul li:nth-child(6) a").text("Community");
             $(".nav-menu ul li:nth-child(7) a").text("My Page");
             $(".login-btn").text("Logout");
  	 	      console.log("번역 결과:", data);
  	 	   $("#course-info").text(data.walking_info);
  	 	    },
  	 	    error: function () {
  	 	      alert("번역 실패");
  	 	    }
  	 	  });
  	 	});
  	 
  	 	
	</script>
    
</body>

</html>
