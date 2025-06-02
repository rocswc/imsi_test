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
<title>동틀무렵 - 등산코스 추천</title>
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

/* 헤더 스타일 - index2.jsp와 동일 */
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
    width: 40px;
    height: auto;
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

/* 메인 컨테이너 - 좌우 2분할 */
.main-container {
  display: flex;
  min-height: calc(100vh - 120px);
  gap: 0;
  background-color: #f8f9fa;
}

/* 왼쪽 영역 - 기존 산책 코스 지도 */
.left-section {
  flex: 1;
  background-color: #ffffff;
  margin: 20px;
  margin-right: 10px;
  border-radius: 20px;
  padding: 40px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

/* 오른쪽 영역 - 추천 코스 리스트 */
.right-section {
  flex: 1;
  background-color: #ffffff;
  margin: 20px;
  margin-left: 10px;
  border-radius: 20px;
  padding: 40px;
  overflow-y: auto;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

/* 왼쪽 영역 스타일 개선 */
.walking-course {
  max-width: 100%;
}

.walking-course h3 {
    margin-bottom: 15px;
    font-size: 24px;
    color: #333333;
    font-weight: 700;
    letter-spacing: -0.5px;
}

.course-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 2px solid #f0f0f0;
}

.course-header h3 {
    font-size: 24px;
    color: #333333;
    font-weight: 700;
}

.info-form {
	width: 100%;
}

.info-item {
 	display: flex;
    margin-bottom: 20px;
    align-items: flex-start;
}

.info-item label {
    display: inline-block;
    font-weight: 600;
    color: #333333;
    margin-right: 15px;
    width: 80px;
    margin-top: 8px;
    font-size: 16px;
}

.info-item input[type="text"] {
    border: none;
    background-color: #f8f9fa;
    font-size: 16px;
    flex: 1;
    padding: 12px 15px;
    border-radius: 8px;
    font-weight: 500;
    color: #333333;
}

.info-item input[type="text"]:focus {
    outline: none;
    background-color: #e9ecef;
}

.divider {
  width: 100%;
  height: 1px;
  background-color: #e9ecef;
  margin: 25px 0;
}

#course-info {
    width: 100%;
    border: none;
    border-radius: 8px;
    background-color: #f8f9fa;
    min-height: 120px;
    font-size: 16px;
    padding: 20px;
    line-height: 1.6;
    color: #333333;
    font-weight: 400;
}

.bookmark-btn {
	background: #444444;
	color: white;
	border: none;
	padding: 12px 20px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 600;
	transition: all 0.3s ease;
	border-radius: 25px;
	letter-spacing: 0.5px;
}

.bookmark-btn:hover {
	background: #333333;
	transform: translateY(-2px);
}

#map {
    width: 100%;
    height: 350px;
    background: #eee;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

#translate-btn {
    background-color: #444444;
    color: white;
    border: none;
    padding: 10px 18px;
    border-radius: 20px;
    cursor: pointer;
    font-size: 12px;
    font-weight: 600;
    margin-left: 15px;
    transition: all 0.3s ease;
    letter-spacing: 0.5px;
}

#translate-btn:hover {
    background-color: #333333;
    transform: translateY(-2px);
}

/* 오른쪽 영역 - 추천 코스 리스트 스타일 */
.recommendation-header {
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 2px solid #f0f0f0;
}

.recommendation-header h2 {
    font-size: 24px;
    color: #333333;
    margin-bottom: 10px;
    font-weight: 700;
    letter-spacing: -0.5px;
}

.recommendation-header p {
    color: #666666;
    font-size: 16px;
    font-weight: 400;
}

.course-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.course-card {
    background: #f8f9fa;
    border-radius: 15px;
    padding: 25px;
    transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    cursor: pointer;
    border-left: 4px solid #444444;
    position: relative;
}

.course-card:hover {
    transform: translateY(-5px);
    background: #ffffff;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.course-card-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 18px;
}

.course-name {
    font-size: 18px;
    font-weight: 700;
    color: #333333;
    margin: 0;
    letter-spacing: -0.3px;
}

.distance-badge {
    background-color: #444444;
    color: white;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 0.5px;
}

.course-details {
    display: flex;
    gap: 25px;
    margin-bottom: 18px;
}

.detail-item {
    display: flex;
    align-items: center;
    gap: 6px;
    color: #666666;
    font-size: 14px;
    font-weight: 500;
}

.detail-item i {
    color: #444444;
    font-size: 13px;
}

.course-description {
    color: #777777;
    font-size: 14px;
    line-height: 1.6;
    margin-bottom: 20px;
    font-weight: 400;
}

.course-actions {
    display: flex;
    gap: 12px;
}

.action-btn {
    padding: 10px 18px;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-size: 12px;
    font-weight: 600;
    transition: all 0.3s ease;
    letter-spacing: 0.3px;
}

.select-btn {
    background-color: #444444;
    color: white;
}

.select-btn:hover {
    background-color: #333333;
    transform: translateY(-2px);
}

.bookmark-card-btn {
    background-color: transparent;
    color: #666666;
    border: 1px solid #ddd;
}

.bookmark-card-btn:hover {
    background-color: #f0f0f0;
    color: #333333;
    transform: translateY(-2px);
}

.loading-spinner {
    text-align: center;
    padding: 60px;
    color: #666666;
}

.loading-spinner i {
    font-size: 24px;
    margin-bottom: 15px;
    color: #444444;
}

.loading-spinner p {
    font-size: 16px;
    font-weight: 500;
}

.no-courses {
    text-align: center;
    padding: 60px;
    color: #999999;
    font-style: italic;
    font-size: 16px;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    body {
        width: 100%;
    }
    
    .main-container {
        flex-direction: column;
    }
    
    .left-section, .right-section {
        flex: none;
        margin: 10px;
    }
    
    .auth-buttons {
        position: static;
        transform: none;
        margin-top: 10px;
        justify-content: center;
    }
    
    .nav-container {
        flex-direction: column;
        gap: 10px;
    }
    
    .nav-menu ul {
        gap: 20px;
    }
    
    .nav-menu ul li a {
        font-size: 14px;
    }
}
</style>
</head>
<body>

	<!-- 헤더 시작 -->
	<header class="header">
		<!-- 로고 -->
		<div class="logo">
		<img class="logo-image" alt="로고이미지" src="/trip/resources/images/main_logo.jpg">
			<h1><a href="index2.jsp">동틀무렵</a></h1>
		</div>
		
		<!-- 로그인/회원가입 버튼 - 우상단 -->
		<div class="auth-buttons">
			<c:choose>
				<c:when test="${not empty sessionScope.loginUser}">
					<p>${sessionScope.loginUser.human_id}님 환영합니다!</p>
					<button class="login-btn" onclick="location.href='logout'">로그아웃</button>
					<button class="login-btn2" onclick="location.href='memberUpdate'">정보수정</button>
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
					<li><a href="qna/qna_list">QnA</a></li>
					<li><a href="bookmark">나의 북마크</a></li>
				</ul>
			</div>
		</div>
	</header>
	<!-- 헤더 끝 -->

	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<!-- 왼쪽 영역 - 기존 산책 코스 지도 -->
		<div class="left-section">
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
						<label for="course-name">등산코스명</label> 
						<input type="text" id="course-name" readonly>
					</div>
					<div class="divider"></div>
					<div class="info-item">
						<label for="course-distance">총거리</label> 
						<input type="text" id="course-distance" readonly>km
					</div>
					<div class="info-item">
						<label for="course-height">고도</label> 
						<input type="text" id="course-height" readonly>M
					</div>
					<div class="divider"></div>
					<div class="info-item">
						<label for="course-info">코스정보</label>
						<button id="translate-btn">Translate</button>
					</div>
					<div id="course-info"></div>
				</div>
			</div>
		</div>

		<!-- 오른쪽 영역 - 추천 산책코스 리스트 -->
		<div class="right-section">
			<div class="recommendation-header">
				<h2>내 주변 추천 등산코스</h2>
				<p>가까운 거리순으로 정렬된 추천 코스입니다</p>
			</div>
			
			<div id="course-list" class="course-list">
				<div class="loading-spinner">
					<i class="fas fa-spinner fa-spin"></i>
					<p>주변 코스를 찾는 중...</p>
				</div>
			</div>
		</div>
	</div>

	<script>
	
	
	function selectCourseFromList(id) {
		var i;
		for (i = 0; i < allCourses.length; i++) {
			if (allCourses[i].hiking_id === parseInt(id)) {
				break;
			}
		}

		if (i === allCourses.length) return;

		var course = allCourses[i];

		document.getElementById("walking-id").value = course.hiking_id;
		document.getElementById("course-name").value = course.hiking_name;
		document.getElementById("course-distance").value = course.hiking_distance;
		document.getElementById("course-height").value = course.hiking_height;
		document.getElementById("course-info").innerText = course.hiking_info;

		var newCenter = new kakao.maps.LatLng(course.hiking_latitude, course.hiking_longitude);
		map.setCenter(newCenter);

		var selectedMarker = new kakao.maps.Marker({
			position: newCenter,
			map: map,
			title: course.hiking_name
		});

		$.ajax({
			type: "POST",
			url: "inserthiking",
			data: JSON.stringify({ hiking_id: course.hiking_id }),
			contentType: "application/json"
		});
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	let userLat, userLon;
	let map;
	let allCourses = [];
	function translateCardText($card, i, res) {
		$card.find(".course-name").text(res.hiking_name || "");
		$card.find(".course-description").text(res.hiking_info || "");
		 const rawDistance = (res.hiking_distance || "").replace(/[^0-9.]/g, "");
		  $card.find(".detail-item").eq(0).find("span").text("Distance: " + rawDistance + "km");
		  const rawHeight = (res.hiking_height || "").replace(/[^0-9.]/g, "");
		  $card.find(".detail-height span").text("Height: " + rawHeight + "M");
		$card.find(".detail-item").eq(1).find("span").text("Ranked #" + (i + 1));
		$card.find(".select-btn").text("Select");
		$(".recommendation-header").find("h2").text("Recommended Hiking Courses Nearby");
		$(".recommendation-header").find("p").text("Sorted by closest distance");
		$card.find(".translate-btn").text("Translated ✅");
	}


	navigator.geolocation.getCurrentPosition(function(position) {
		userLat = position.coords.latitude;
		userLon = position.coords.longitude;

		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(userLat, userLon),
			level: 3
		};

		map = new kakao.maps.Map(container, options);

		const marker = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(userLat, userLon),
			map: map,
			title: '내 위치'
		});

		// 첫 번째 AJAX: walkingMap
		$.ajax({
			type: "GET",
			url: "hikingMap",
			data: { hiking_latitude: userLat, hiking_longitude: userLon },
			dataType: "json",
			success: function(response) {
				allCourses = response;
				response.forEach(function(course) {
					const walkingMarker = new kakao.maps.LatLng(course.hiking_latitude, course.hiking_longitude);
					const marker = new kakao.maps.Marker({
						position: walkingMarker,
						map: map,
						title: course.hiking_name
					});
					kakao.maps.event.addListener(marker, 'click', function() {
						selectCourse(course);
					});
				});
			},
			error: function(err) {
				console.error("에러:", err);
				document.getElementById('course-list').innerHTML =
					'<div class="no-courses">코스를 불러오는데 실패했습니다.</div>';
			}
		});
		
		

		// 두 번째 AJAX: recommendCourse
		$.ajax({
			type: "POST",
			url: "recommendCourseHiking",
			data: JSON.stringify({ user_lat: userLat, user_lon: userLon }),
			dataType: "json",
			contentType: "application/json",
			success: function(response) {
				allCourses = response;
				$("#course-list").empty();

				for (var i = 0; i < response.length; i++) {
					var course = response[i];

					var $card = $("<div>").addClass("course-card");
					$("#course-list").append($card);

					var $header = $("<div>").addClass("course-card-header");
					var $name = $("<h3>").addClass("course-name").text(course.hiking_name);
					var $badge = $("<span>").addClass("distance-badge").text(course.distance.toFixed(2) + "km");
					$header.append($name).append($badge);
					$card.append($header);

					var $details = $("<div>").addClass("course-details");
					var distanceText = course.hiking_distance ? course.hiking_distance + "km" : "정보 없음";
					var $distance = $("<div>").addClass("detail-item").html('<i class="fas fa-route"></i><span>총 거리: ' + distanceText + '</span>');
					var $rank = $("<div>").addClass("detail-item").html('<i class="fas fa-star"></i><span>추천 ' + (i + 1) + '위</span>');
					var heightText = course.hiking_height ? course.hiking_height + "M" : "정보 없음";
					var $height = $("<div>").addClass("detail-height").html('<i class="fas"></i><span>고도 ' + heightText + '</span>');
					$details.append($distance).append($height).append($rank);
					$card.append($details);

					var $description = $("<div>").addClass("course-description").text(course.hiking_info?.substring(0, 100) + "..." || "코스 정보가 없습니다.");
					$card.append($description);

					var $actions = $("<div>").addClass("course-actions");
					
					var $selectBtn = $("<button>").addClass("action-btn select-btn").text("코스 선택").attr("data-id", course.hiking_id);
					
						
						$selectBtn.click(function(e) {
							e.stopPropagation();
							var id = $(this).attr("data-id");
							selectCourseFromList(id);
						});$actions.append($selectBtn);
						
						
						
						
					
					

				

					var $translateBtn = $("<button>").addClass("action-btn translate-btn").text("번역");
					$translateBtn.click(function(e) {
						e.stopPropagation();
						const $card = $(this).closest(".course-card");
						const originalText = $card.find(".course-description").text();
						const nameText = $card.find(".course-name").text();
						const distanceText = $card.find(".detail-item").eq(0).find("span").text();
						const rankText = $card.find(".detail-item").eq(1).find("span").text();
						const selectText = $card.find(".select-btn").text();
						const heightText = $card.find(".detail-height span").text().replace(/[^0-9.]/g, "");

						$.ajax({
							type: "POST",
							url: "translatehiking",
							contentType: "application/json",
							data: JSON.stringify({
								hiking_info: originalText,
								hiking_name: nameText,
								hiking_distance: distanceText,
								hiking_height: heightText,
								rank_text: rankText,
								select_text: selectText
								
							}),
							success: function(res){
								translateCardText($card, i, res);
							}
						});
					});
					$actions.append($translateBtn);

					$card.append($actions);
				}
			},
			error: function() {
				$("#course-list").append('<div class="no-courses">추천 코스를 불러올 수 없습니다.</div>');
			}
		});
	}); // geolocation 끝

	// 개별 코스 선택 처리
	function selectCourse(course) {
		$("#walking-id").val(course.hiking_id);
		$("#course-name").val(course.hiking_name);
		$("#course-distance").val(course.hiking_distance);
		$("#course-height").val(course.hiking_height);
		$("#course-info").text(course.hiking_info);
		$.ajax({
			type: "POST",
			url: "inserthiking",
			data: JSON.stringify({ hiking_id: course.hiking_id }),
			contentType: "application/json"
		});
	}

	function bookmarkCourseFromList(hikingId, hikingName) {
		$.ajax({
			type: "POST",
			url: "addbookmarkhiking",
			contentType: "application/json",
			data: JSON.stringify({ hiking_id: hikingId, hiking_name: hikingName }),
			success: function(res) {
				if (res.status === "success") alert("북마크에 저장되었습니다!");
			},
			error: function() {
				alert("북마크 저장 실패");
			}
		});
	}

	$("#bookmark-btn").click(function() {
		const name = $("#course-name").val();
		if (!name) return alert("먼저 코스를 선택하세요!");
		const data = {
				hiking_id: $("#walking-id").val(),
				hiking_name: name
		};
		$.ajax({
			type: "POST",
			url: "addbookmarkhiking",
			contentType: "application/json",
			data: JSON.stringify(data),
			success: function(res) {
				if (res.status === "success") {
					alert("북마크에 저장되었습니다!");
					$("#bookmark-btn").text("북마크⭐");
				}
			},
			error: function() {
				alert("북마크 저장 실패");
			}
		});
	});
	
	$("#translate-btn").click(function() {
		const param = {
				hiking_id: parseInt($("#walking-id").val()),
				hiking_name: $("#course-name").val(),
				
				hiking_distance: $("#course-distance").val(),
				hiking_info: $("#course-info").text()
		};
		$.ajax({
			type: "POST",
			url: "translatehiking",
			contentType: "application/json",
			data: JSON.stringify(param),
			success: function(data) {
				$("#course-name").val(data.hiking_name);
				$("#course-distance").val(data.hiking_distance);
				$("#course-info").text(data.hiking_info);
				$("label[for='course-name']").text("Course");
				$("label[for='course-distance']").text("Distance");
				$("label[for='my-location']").text("My Location");
				$("label[for='course-info']").text("Course Info");
				$("label[for='course-height']").text("Course Height");
				$(".course-header h3").text("Hiking Course");
				$("#bookmark-btn").text("Bookmark");
				$(".logo h1 a").text("Dawn Walk");
				$(".nav-menu ul li:nth-child(1) a").text("Walking");
				$(".nav-menu ul li:nth-child(2) a").text("Running");
				$(".nav-menu ul li:nth-child(3) a").text("Hiking");
				$(".nav-menu ul li:nth-child(4) a").text("Events");
				$(".nav-menu ul li:nth-child(5) a").text("Hotspots");
				$(".nav-menu ul li:nth-child(6) a").text("Community");
				$(".nav-menu ul li:nth-child(7) a").text("My Page");
				$(".nav-menu ul li:nth-child(8) a").text("My Bookmark");
				$(".login-btn").text("Logout");
				$(".login-btn2").text("Modification of information");
			},
			error: function() {
				alert("번역 실패");
			}
		});
	});
</script>


	  


</body>
</html>