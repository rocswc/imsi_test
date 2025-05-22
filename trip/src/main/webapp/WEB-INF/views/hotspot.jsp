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
<title>동틀무렵 - 산책코스</title>
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
	

	<!-- 메인 콘텐츠 영역 -->
	<!-- 메인 콘텐츠 영역 -->
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

  <!-- ✅ 여기가 등산코스 본문 위치입니다 -->
  <div class="walking-course">
    <div class="course-header">
      <h3>명소</h3>
    
    </div>
    <div class="info-form">
      <div class="info-item">
        <label for="my-location">내위치</label>
        <div id="map"></div>
      </div>
      <br>

      <div class="info-item">
        <label for="course-name">명소이름</label>
        <input type="text" id="course-name" readonly>
      </div>


    

      <div class="divider"></div>

      <div class="info-item">
        <label for="course-info">명소정보</label>
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
			var param = { hotspot_latitude : lat , hotspot_longitude : lon}
 			
 			console.log(param);
				// 페이지 로드 시 Ajax 자동 실행
				$.ajax({
					type: "GET"
					, url: "hotspotMap"
					, data: param
					, dataType: "json"
					, success: function(response){
						console.log("성공:",response);
						response.forEach(function(course){
							const runningMarker = new kakao.maps.LatLng(course.hotspot_latitude, course.hotspot_longitude);
							const marker = new kakao.maps.Marker({
			                    position: runningMarker
			                    ,map: map
			                    ,title: course.hotspot_name
							});
							
							// 마커 클릭 시 해당 정보 출력
							kakao.maps.event.addListener(marker, 'click', function(){
								$("#course-name").val(course.hotspot_name);
								
								$("#course-info").text(course.hotspot_info);
								
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
  	 	
	</script>
    
</body>

</html>
