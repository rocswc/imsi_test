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

<title>동틀무렵 - 마이페이지</title>
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
   width: 1905px;
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
    left: 30px;
    top: 15px;
    display: flex;
    align-items: center;
    width: 110px;
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

/* 콘텐츠 영역 */
.content {
   flex: 1;
   padding: 50px 5%;
   background-color: #ffffff;
   max-width: 100%;
}

/* 마이페이지 섹션 */
.mypage-section {
  padding: 50px 5%;
  background: #f8f9fa;
  min-height: 70vh;
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

/* 탭 컨테이너 */
.tab-container {
  max-width: 1200px;
  margin: 0 auto;
  background: white;
  border-radius: 20px;
  overflow: hidden;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

/* 탭 네비게이션 */
.tab-navigation {
  display: flex;
  border-bottom: 1px solid #eee;
  background: #f8f9fa;
}

.tab-nav-item {
  padding: 20px 30px;
  cursor: pointer;
  border: none;
  background: none;
  font-size: 16px;
  font-weight: 600;
  color: #666;
  transition: all 0.3s ease;
  border-bottom: 3px solid transparent;
  white-space: nowrap;
}

.tab-nav-item:hover {
  color: #333;
  background: rgba(255, 255, 255, 0.5);
}

.tab-nav-item.active {
  color: #333;
  background: white;
  border-bottom-color: #666;
}

/* 탭 콘텐츠 */
.tab-content {
  padding: 40px;
  min-height: 500px;
}

.tab-pane {
  display: none;
}

.tab-pane.active {
  display: block;
}

/* 북마크 아이템 스타일 */
.bookmark-item {
    display: flex;
    align-items: flex-start;
    padding: 25px;
    border-bottom: 1px solid #eee;
    transition: all 0.3s ease;
    background: white;
    margin-bottom: 15px;
    border-radius: 15px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.bookmark-item:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
}

.bookmark-info {
    flex: 1;
    margin-right: 20px;
}

.bookmark-title {
    font-weight: 700;
    font-size: 18px;
    margin-bottom: 8px;
    color: #333;
}

.bookmark-url {
    font-size: 14px;
    color: #666;
    margin-bottom: 5px;
}

.bookmark-info-text {
    font-size: 14px;
    color: #888;
    line-height: 1.5;
    margin-bottom: 15px;
}

.bookmark-actions {
    display: flex;
    align-items: center;
}

[class*="action-btn"] {
    background: #ff4757;
    color: white;
    border: none;
    cursor: pointer;
    padding: 10px 20px;
    border-radius: 25px;
    font-size: 14px;
    font-weight: 600;
    transition: all 0.3s ease;
}

[class*="action-btn"] {
    background: #ff3742;
    transform: translateY(-2px);
}

/* 지도 스타일 */
.course-map {
  width: 100%;
  max-width: 400px;
  height: 200px;
  margin-top: 15px;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* 빈 상태 메시지 */
.empty-state {
  text-align: center;
  padding: 80px 20px;
  color: #666;
}

.empty-state i {
  font-size: 48px;
  color: #ddd;
  margin-bottom: 20px;
}

.empty-state h3 {
  font-size: 20px;
  margin-bottom: 10px;
  color: #555;
}

.empty-state p {
  color: #888;
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header class="header">
		<!-- 로고 -->
		<div class="logo">
		<img class="logo-image" alt="로고이미지" src="/trip/resources/images/main_logo.png">
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

	<!-- 마이페이지 섹션 -->
	<div class="mypage-section">
		<div class="section-title">
			<h2>나의 북마크</h2>
			<p>나만의 코스를 확인해보세요</p>
		</div>
		
		<div class="tab-container">
			<div class="tab-navigation">
				<button class="tab-nav-item active" data-tab="bookmark-walking">나의 산책코스</button>
				<button class="tab-nav-item " data-tab="bookmark-running">나의 러닝코스</button>
				<button class="tab-nav-item" data-tab="bookmark-hiking">나의 등산코스</button>
			</div>
			
			
				
				<!-- 나의 산책코스 탭 -->
				<div class="tab-pane active" id="bookmark-walking">
					<div class="bookmark-section">
						<div class="bookmark-header"></div>
					</div>
				</div>
				
				<!-- 나의 러닝코스 탭 -->
				<div class="tab-pane" id="bookmark-running">
					<div class="bookmarkrun-section">
						<div class="bookmarkrun-header"></div>
						</div>
				</div>
				
				<!-- 나의 등산코스 탭 -->
				<div class="tab-pane" id="bookmark-hiking">
					<div class="bookmarkhi-section">
						<div class="bookmarkhi-header"></div>
						  </div> 
				</div>
			</div>
		</div>
	

	<script>
		// 탭 전환 기능
		document.addEventListener('DOMContentLoaded', function() {
			const tabNavItems = document.querySelectorAll('.tab-nav-item');
			const tabPanes = document.querySelectorAll('.tab-pane');
			
			tabNavItems.forEach(item => {
				item.addEventListener('click', function() {
					const targetTab = this.getAttribute('data-tab');
					
					// 모든 탭 네비게이션 비활성화
					tabNavItems.forEach(nav => nav.classList.remove('active'));
					// 현재 클릭된 탭 활성화
					this.classList.add('active');
					
					// 모든 탭 패널 숨기기
					tabPanes.forEach(pane => pane.classList.remove('active'));
					// 대상 탭 패널 보이기
					document.getElementById(targetTab).classList.add('active');
				});
			});
		});

		// 북마크 데이터 로드 및 관련 기능
		$(function () {
		  $.ajax({
		    type: "GET",
		    url: "bookmarkwalking",
		    dataType: "json",
		    success: function (res) {
		      if (res.status === "success") {
		        var list = res.data;
		        if (list.length === 0) {
		          $(".bookmark-section").append(`
		            <div class="empty-state">
		              <i class="fas fa-bookmark"></i>
		              <h3>북마크된 산책코스가 없습니다</h3>
		              <p>마음에 드는 산책코스를 북마크해보세요!</p>
		            </div>
		          `);
		          return;
		        }
		        for (var i = 0; i < list.length; i++) {
		          var item = list[i];
		          var mapId = "map-" + item.walking_id;
		          var info = $("<div>").addClass("bookmark-info").append(
		            $("<div>").addClass("bookmark-title").text(item.walking_name),
		            $("<div>").addClass("bookmark-url").text(item.walking_distance + "km"),
		            $("<div>").addClass("bookmark-info-text").text(item.walking_info),
		            $("<div>").attr("id", mapId).addClass("course-map")
		          );
		          var hiddenInput = $("<input>").attr("type", "hidden").addClass("walking-id-hidden").val(item.walking_id);
		          var button = $("<div>").addClass("bookmark-actions").append(
		            $("<button>").addClass("action-btn-walking").text("⭐ 삭제")
		          );
		          var box = $("<div>").addClass("bookmark-item").append(info, button, hiddenInput);
		          $(".bookmark-section").append(box);
		          var map = new kakao.maps.Map(document.getElementById(mapId), {
		            center: new kakao.maps.LatLng(item.walking_latitude, item.walking_longitude),
		            level: 4
		          });
		          new kakao.maps.Marker({
		            map: map,
		            position: new kakao.maps.LatLng(item.walking_latitude, item.walking_longitude),
		            title: item.walking_name
		          });
		        }
		      } else {
		        $(".bookmark-section").append(`
		          <div class="empty-state">
		            <i class="fas fa-exclamation-triangle"></i>
		            <h3>데이터를 불러올 수 없습니다</h3>
		            <p>잠시 후 다시 시도해주세요.</p>
		          </div>
		        `);
		      }
		    },
		    error: function () {
		      console.error("AJAX 실패");
		      $(".bookmark-section").append(`
		        <div class="empty-state">
		          <i class="fas fa-wifi"></i>
		          <h3>서버와 연결할 수 없습니다</h3>
		          <p>네트워크 연결을 확인해주세요.</p>
		        </div>
		      `);
		    }
		  });
		});

		$(document).on("click", ".action-btn-walking", function () {
		  const $item = $(this).closest(".bookmark-item");
		  const walkingName = $item.find(".bookmark-title").text();
		  const walkingId = Number($item.find(".walking-id-hidden").val());
		  if (!confirm(`"${walkingName}" 북마크를 삭제하시겠습니까?`)) return;
		  $.ajax({
		    type: "POST",
		    url: "deletebookmarkwalking",
		    data: JSON.stringify(walkingId),
		    contentType: "application/json",
		    success: function (res) {
		      if (res > 0) {
		        alert("북마크가 삭제되었습니다.");
		        $item.fadeOut(300, function() {
		          $(this).remove();
		          // 삭제 후 남은 아이템이 없으면 빈 상태 메시지 표시
		          if ($(".bookmark-item").length === 0) {
		            $(".bookmark-section").append(`
		              <div class="empty-state">
		                <i class="fas fa-bookmark"></i>
		                <h3>북마크된 산책코스가 없습니다</h3>
		                <p>마음에 드는 산책코스를 북마크해보세요!</p>
		              </div>
		            `);
		          }
		        });
		      } else {
		        alert("삭제에 실패했습니다.");
		      }
		    },
		    error: function () {
		      alert("서버 오류로 삭제에 실패했습니다.");
		    }
		  });
		});
		
		/////////////////////////////////////////////////////////////////////
		
		
		
		
	
			
			document.querySelector('[data-tab="bookmark-running"]').addEventListener('click', function () {
				  if (!$('.bookmarkrun-section').hasClass('loaded')) {
				    loadRunningBookmark();
				    $('.bookmarkrun-section').addClass('loaded');
				  }
				});

				function loadRunningBookmark() {
				  $.ajax({
				    type: "GET",
				    url: "bookmarkrunning",
				    dataType: "json",
				    success: function (res) {
				      if (res.status === "success") {
				        var list = res.data;
				        if (list.length === 0) {
				          $(".bookmarkrun-section").append(`
				            <div class="empty-state">
				              <i class="fas fa-bookmark"></i>
				              <h3>북마크된 러닝코스가 없습니다</h3>
				              <p>마음에 드는 러닝코스를 북마크해보세요!</p>
				            </div>
				          `);
				          return;
				        }
				        for (var i = 0; i < list.length; i++) {
				          var item = list[i];
				          var mapIdrun = "map-running-" + item.running_id;

				          var info = $("<div>").addClass("bookmark-info").append(
				            $("<div>").addClass("bookmark-title").text(item.running_name),
				            $("<div>").addClass("bookmark-url").text(item.running_distance + "km"),
				            $("<div>").addClass("bookmark-info-text").text(item.running_info),
				            $("<div>").attr("id", mapIdrun).addClass("course-map")
				          );

				          var hiddenInput = $("<input>").attr("type", "hidden").addClass("running-id-hidden").val(item.running_id);
				          var button = $("<div>").addClass("bookmark-actions").append(
				            $("<button>").addClass("action-btn-running").text("⭐ 삭제")
				          );

				          var box = $("<div>").addClass("bookmark-item").append(info, button, hiddenInput);
				          $(".bookmarkrun-section").append(box);

				          // ★ 지도 렌더링은 약간 지연
				          setTimeout(function(mapId, lat, lng, title) {
				            return function() {
				              var map = new kakao.maps.Map(document.getElementById(mapId), {
				                center: new kakao.maps.LatLng(lat, lng),
				                level: 4
				              });
				              new kakao.maps.Marker({
				                map: map,
				                position: new kakao.maps.LatLng(lat, lng),
				                title: title
				              });
				            };
				          }(mapIdrun, item.running_latitude, item.running_longitude, item.running_name), 200);
				        }
				      } else {
				        $(".bookmarkrun-section").append(`
				          <div class="empty-state">
				            <i class="fas fa-exclamation-triangle"></i>
				            <h3>데이터를 불러올 수 없습니다</h3>
				            <p>잠시 후 다시 시도해주세요.</p>
				          </div>
				        `);
				      }
				    },
				    error: function () {
				      $(".bookmarkrun-section").append(`
				        <div class="empty-state">
				          <i class="fas fa-wifi"></i>
				          <h3>서버와 연결할 수 없습니다</h3>
				          <p>네트워크 연결을 확인해주세요.</p>
				        </div>
				      `);
				    }
				  });
				}

				// 삭제 이벤트는 그대로 유지
				$(document).on("click", ".action-btn-running", function () {
				  const $item = $(this).closest(".bookmark-item");
				  const courseName = $item.find(".bookmark-title").text();
				  const courseId = Number($item.find(".running-id-hidden").val());

				  if (!confirm(`"${courseName}" 북마크를 삭제하시겠습니까?`)) return;

				  $.ajax({
				    type: "POST",
				    url: "deletebookmarkrunning",
				    data: JSON.stringify(courseId),
				    contentType: "application/json",
				    success: function (res) {
				      if (res > 0) {
				        alert("북마크가 삭제되었습니다.");
				        $item.fadeOut(300, function () {
				          $(this).remove();
				          if ($(".bookmark-item").length === 0) {
				            $(".bookmarkrun-section").append(`
				              <div class="empty-state">
				                <i class="fas fa-bookmark"></i>
				                <h3>북마크된 러닝코스가 없습니다</h3>
				                <p>마음에 드는 러닝코스를 북마크해보세요!</p>
				              </div>
				            `);
				          }
				        });
				      } else {
				        alert("삭제에 실패했습니다.");
				      }
				    },
				    error: function () {
				      alert("서버 오류로 삭제에 실패했습니다.");
				    }
				  });
				});
			////////////////////////////////////////////////////////////////
			
			
			
				
				document.querySelector('[data-tab="bookmark-hiking"]').addEventListener('click', function () {
					  if (!$('.bookmarkhi-section').hasClass('loaded')) {
					    loadHikingBookmark();
					    $('.bookmarkhi-section').addClass('loaded');
					  }
					});

					function loadHikingBookmark() {
					  $.ajax({
					    type: "GET",
					    url: "bookmark_hiking",
					    dataType: "json",
					    success: function (res) {
					      if (res.status === "success") {
					        var list = res.data;
					        if (list.length === 0) {
					          $(".bookmarkhi-section").append(`
					            <div class="empty-state">
					              <i class="fas fa-bookmark"></i>
					              <h3>북마크된 등산코스가 없습니다</h3>
					              <p>마음에 드는 등산코스를 북마크해보세요!</p>
					            </div>
					          `);
					          return;
					        }
					        for (var i = 0; i < list.length; i++) {
					          var item = list[i];
					          var mapIdhi = "map-hiking-" + item.hiking_id;

					          var info = $("<div>").addClass("bookmark-info").append(
					            $("<div>").addClass("bookmark-title").text(item.hiking_name),
					            $("<div>").addClass("bookmark-url").text(item.hiking_distance + "km"),
					            $("<div>").addClass("bookmark-ht").text(item.hiking_height + "M"),
					            $("<div>").addClass("bookmark-info-text").text(item.hiking_info),
					            $("<div>").attr("id", mapIdhi).addClass("course-map")
					          );

					          var hiddenInput = $("<input>").attr("type", "hidden").addClass("hiking-id-hidden").val(item.hiking_id);
					          var button = $("<div>").addClass("bookmark-actions").append(
					            $("<button>").addClass("action-btn-hiking").text("⭐ 삭제")
					          );

					          var box = $("<div>").addClass("bookmark-item").append(info, button, hiddenInput);
					          $(".bookmarkhi-section").append(box);

					          // ★ 지도 렌더링은 약간 지연
					          setTimeout(function(mapId, lat, lng, title) {
					            return function() {
					              var map = new kakao.maps.Map(document.getElementById(mapId), {
					                center: new kakao.maps.LatLng(lat, lng),
					                level: 4
					              });
					              new kakao.maps.Marker({
					                map: map,
					                position: new kakao.maps.LatLng(lat, lng),
					                title: title
					              });
					            };
					          }(mapIdhi, item.hiking_latitude, item.hiking_longitude, item.hiking_name), 200);
					        }
					      } else {
					        $(".bookmarkhi-section").append(`
					          <div class="empty-state">
					            <i class="fas fa-exclamation-triangle"></i>
					            <h3>데이터를 불러올 수 없습니다</h3>
					            <p>잠시 후 다시 시도해주세요.</p>
					          </div>
					        `);
					      }
					    },
					    error: function () {
					      $(".bookmarkhi-section").append(`
					        <div class="empty-state">
					          <i class="fas fa-wifi"></i>
					          <h3>서버와 연결할 수 없습니다</h3>
					          <p>네트워크 연결을 확인해주세요.</p>
					        </div>
					      `);
					    }
					  });
					}

					// 삭제 이벤트는 그대로 유지
					$(document).on("click", ".action-btn-hiking", function () {
					  const $item = $(this).closest(".bookmark-item");
					  const courseName = $item.find(".bookmark-title").text();
					  const courseId = Number($item.find(".hiking-id-hidden").val());

					  if (!confirm(`"${courseName}" 북마크를 삭제하시겠습니까?`)) return;

					  $.ajax({
					    type: "POST",
					    url: "deletebookmarkhiking",
					    data: JSON.stringify(courseId),
					    contentType: "application/json",
					    success: function (res) {
					      if (res > 0) {
					        alert("북마크가 삭제되었습니다.");
					        $item.fadeOut(300, function () {
					          $(this).remove();
					          if ($(".bookmark-item").length === 0) {
					            $(".bookmarkhi-section").append(`
					              <div class="empty-state">
					                <i class="fas fa-bookmark"></i>
					                <h3>북마크된 등산코스가 없습니다</h3>
					                <p>마음에 드는 등산코스를 북마크해보세요!</p>
					              </div>
					            `);
					          }
					        });
					      } else {
					        alert("삭제에 실패했습니다.");
					      }
					    },
					    error: function () {
					      alert("서버 오류로 삭제에 실패했습니다.");
					    }
					  });
					});
				
				
				
	</script>
</body>
</html>