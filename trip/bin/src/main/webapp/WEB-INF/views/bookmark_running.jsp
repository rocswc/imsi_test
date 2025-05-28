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

.main-wrapper {
  display: flex;
  min-height: 100vh;
}

.sidebar {
  width: 240px;
  background-color: #FFFFFA;
  padding: 24px 0;
  border-right: 1px solid #eaeaea;
  flex-shrink: 0;
  height: 100vh;
  position: sticky;
  top: 0;
}

.sidebar-logo {
	padding: 0 20px 30px;
	font-size: 22px;
	font-weight: 700;
	color: #156206;
	height: 60px;
	border-bottom: 1px solid #eaeaea;
	margin-bottom: 30px;
	white-space: nowrap;
}

.sidebar-category {
	padding: 10px 20px;
	font-size: 16px;
	font-weight: 900;
	color: #25300A;
	margin-bottom: 5px;
	white-space: nowrap;
}

.sidebar-menu {
	list-style: none;
	white-space: nowrap;
}

.sidebar-menu li {
	padding: 15px 20px;
	transition: all 0.3s;
	display: flex;
	align-items: center;
}

.sidebar-menu li:hover {
	background-color: #F5EFD3;
	color: #000000;
}

.sidebar-menu li.active {
	font-weight: 500;
	background-color: #F5EFD3;
	color: #333;
}

.sidebar-menu i {
	margin-right: 12px;
	width: 20px;
	text-align: center;
}

.sidebar-menu a {
	text-decoration: none;
	color: black;
}

.sidebar-menu a:hover {
	color: #156206;
	font-weight: 700;	
}

#bookmark-menu li:nth-child(1) {
	font-weight: bold;
}

.main-content {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.container {
    max-width: 1000px;
    min-width: 1000px;
    margin: 0 auto;
    background-color: #FFFFFA;
    overflow: hidden;
    border: none;
}

.tabs {
    display: flex;
}

.tab {
	height: 48px;
    padding: 10px 15px;
    cursor: pointer;
    border: none;
    border-radius: 10px 10px 0px 0px;
    background: none;
    font-size: 15px;
    font-weight: bold;
}

.tab:hover {
    color: white;
    background-color: #156206;
}

.tab.active {
    color: white;
    background-color: #156206;
}

.content {
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 0 8px 8px 8px;
    background-color: white;
}

.bookmark-item {
    display: flex;
    align-items: center;
    padding: 15px;
    border-bottom: 1px solid #eee;
    transition: background-color 0.2s;
}

.bookmark-item:hover {
    background-color: #f9f9f9;
}

.bookmark-icon {
    width: 48px;
    height: 48px;
    margin-right: 15px;
    border-radius: 4px;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f0f0f0;
}

.bookmark-icon img {
    max-width: 100%;
    max-height: 100%;
}

.bookmark-info {
    flex: 1;
}

.bookmark-title {
    font-weight: bold;
    margin-bottom: 5px;
    color: #333;
}

.bookmark-url {
    font-size: 14px;
    color: #888;
    text-decoration: none;
}

.bookmark-date {
    font-size: 12px;
    color: #aaa;
    margin-top: 5px;
}

.bookmark-actions {
    display: flex;
}

.action-btn {
    background: none;
    border: none;
    cursor: pointer;
    color: #999;
    margin-left: 10px;
    font-size: 18px;
}

.action-btn:hover {
    color: #156206;
}
.course-map {
  width: 100%;
  max-width: 500px;
  height: 180px;
  margin-top: 10px;
}

.header {
  width: 100%;
  background-color: #FFFFFA;
  padding: 20px 0 0;
  border-bottom: 1px solid #eee;
}

.logo {
  text-align: center;
  margin-bottom: 20px;
}

.logo h1 {
  color: #156206;
  font-size: 28px;
  font-weight: 700;
}

.nav-container {
  max-width: 100%;
  width: 100%;
  padding: 0 0 15px;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

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

.auth-buttons {
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

</style>
</head>
<body>
<div class="main-wrapper">

  <div class="sidebar">
    <div class="sidebar-category">회원정보수정</div>
    <ul class="sidebar-menu">
      <li><a href="memberUpdate" id="walkingCourseBtn"><i class="fas fa-caret-right fa-xs"></i>회원정보변경</a></li>
      <li><a href="running" id="runningCourseBtn"><i class="fas fa-caret-right fa-xs"></i>약관동의변경</a></li>
    </ul>
    <div class="sidebar-category">북마크</div>
    <ul class="sidebar-menu" id="bookmark-menu">
      <li><a href="bookmark_walking"><i class="fas fa-caret-right fa-xs"></i>나의 산책코스</a></li>
      <li><a href="bookmark_running"><i class="fas fa-caret-right fa-xs"></i>나의 러닝코스</a></li>
      <li><a href="bookmark_hiking"><i class="fas fa-caret-right fa-xs"></i>나의 등산코스</a></li>
    </ul>
  </div>

  <div class="main-content">
    <header class="header">
				<div class="logo">
					<h1>
						<a href="index.jsp" style="text-decoration: none; color: #156206;">동틀무렵</a>
					</h1>
				</div>
				<div class="nav-container">
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

    <div class="container">
      <div class="tabs">
        <button class="tab active">나의 러닝코스</button>
      </div>
      <div class="content">
        <div class="bookmark-section" id="">
          <div class="bookmark-header"></div>
        </div>
      </div>
    </div>
  </div>
</div>
	<script>
	
	
	$(function () {
		  $.ajax({
		    type: "GET",
		    url: "bookmarkrunning",
		    dataType: "json",
		    success: function (res) {
		      if (res.status === "success") {
		        var list = res.data;

		        if (list.length === 0) {
		          $(".bookmark-section").append("<p>북마크가 없습니다.</p>");
		          return;
		        }

		        for (var i = 0; i < list.length; i++) {
		          var item = list[i];
		          var mapId = "map-" + item.running_id;

		          // .bookmark-info 영역
		          var info = $("<div>").addClass("bookmark-info").append(
		            $("<div>").addClass("bookmark-title").text(item.running_name),
		            $("<div>").addClass("bookmark-url").text(item.running_distance + "km"),
		            $("<div>").addClass("bookmark-info-text").text(item.running_info),
		            $("<div>").attr("id", mapId).addClass("course-map") // ✅ 지도 div 추가
		          );
		          var hiddenInput = $("<input>").attr("type", "hidden")
                  .addClass("running-id-hidden")
                  .val(item.running_id);
		          // 북마크 버튼
		          var button = $("<div>").addClass("bookmark-actions").append(
		            $("<button>").addClass("action-btn").text("⭐ 삭제")
		          );

		          // 최종 박스
		          var box = $("<div>").addClass("bookmark-item").append(info, button,hiddenInput);
		          $(".bookmark-section").append(box);

		          // ✅ 지도 생성
		          var map = new kakao.maps.Map(document.getElementById(mapId), {
		            center: new kakao.maps.LatLng(item.running_latitude, item.running_longitude),
		            level: 4
		          });

		          new kakao.maps.Marker({
		            map: map,
		            position: new kakao.maps.LatLng(item.running_latitude, item.running_longitude),
		            title: item.running_name
		          });
		        }
		      } else {
		        $(".bookmark-section").append("<p>북마크 데이터를 불러올 수 없습니다.</p>");
		      }
		    },
		    error: function () {
		      console.error("AJAX 실패");
		      $(".bookmark-section").append("<p>서버와 연결할 수 없습니다.</p>");
		    }
		  });
		});
		
	$(document).on("click", ".action-btn", function () {
	    const $item = $(this).closest(".bookmark-item");
	    const runningName = $item.find(".bookmark-title").text();
	   const runningId = Number($item.find(".running-id-hidden").val()); // ✅ 정확하게 추출

	    if (!confirm(`"${runningName}" 북마크를 삭제하시겠습니까?`)) return;

	    $.ajax({
	        type: "POST",
	        url: "deletebookmarkrunning",
	        data: JSON.stringify(runningId),
	        contentType: "application/json",
	        success: function (res) {
	            if (res > 0) {
	                alert("북마크가 삭제되었습니다.");
	                $item.remove(); // DOM에서 삭제
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
