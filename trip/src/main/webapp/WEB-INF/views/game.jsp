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
  font-size: 17px;
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

/* 정보 표시 영역 스타일 */

.course-header {
  display: flex;
  justify-content: center;  /* 수평 가운데 정렬 */
  align-items: center;
  margin-top: 20px;
  margin-bottom: 20px;
  padding: 20px;
}
.course-header table {
  margin: 0 auto;  /* 테이블도 수평 가운데 정렬 */
}
.course-header td {
  padding: 0 10px;  /* 셀 간 간격 */
}

.course-header h3 {
    font-size: 18px;
    color: #333333;
}

/* 배너 이미지 스타일 */
.banner-section {
  width: 100%;
  max-width: 1520px;
  margin: 0 auto 40px auto;
  padding: 0 40px;
}

.banner-image {
  width: 100%;
  height: 200px;
  background: url('/trip/resources/images/running_banner3.jpg') center/cover no-repeat;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: black;
  font-size: 32px;
  font-weight: bold;
  text-align: center;
}

/* 페이지네이션 */
.month-select {
  padding: 6px 12px;
  font-size: 15px;
  border: 1px solid #ccc;
  border-radius: 4px;
  width: 120px; /* 👉 너비 조절 가능: 원하면 140~160px도 가능 */
  background-color: #fff;
  color: #333;
  cursor: pointer;
}

.pagination {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
}

.page-btn {
    padding: 10px 15px;
    border: 1px solid #ddd;
    background-color: #fff;
    color: #333;
    text-decoration: none;
    border-radius: 4px;
    transition: all 0.3s ease;
    font-size: 14px;
    min-width: 45px;
    text-align: center;
    display: inline-block;
}

.page-btn:hover {
	cursor: pointer;
    background-color: #f5f5f5;
    border-color: #999;
    text-decoration: none;
}

.page-btn.active {
    background-color: #f5f5f5;
    color: #333;
    border-color: #999;
}
/* 게임 리스트 그리드 스타일 */
.game-list {
  padding: 20px 40px;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  max-width: 1520px;
  margin: 0 auto;
}

.game-item {
  border: 1px solid #ddd;
  padding: 20px;
  border-radius: 8px;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  cursor: pointer;
  text-decoration: none;
  color: inherit;
  display: block;
}

.game-item:hover {
  text-decoration: none;
  color: inherit;
}

.game-item h4 {
  margin-bottom: 12px;
  color: #222222;
  font-size: 16px;
  font-weight: 600;
}

.game-item p {
  margin-bottom: 8px;
  font-size: 15px;
  line-height: 1.4;
}

.game-item p:last-child {
  margin-bottom: 0;
}

.pagination {
  margin: 20px;
  text-align: center;
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
				
		<!-- 로그인/회원가입 버튼 -->
		<div class="auth-buttons">
			<c:choose>
				<c:when test="${not empty sessionScope.loginUser}">
					<p>${sessionScope.loginUser.human_id}님 환영합니다!</p>
					<button class="login-btn" onclick="location.href='logout'">로그아웃</button>
					<button class="login-btn" onclick="location.href='memberUpdate'">정보수정</button>
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
			
			<!-- 로그인/회원가입 버튼 -->
			<div class="auth-buttons">
				<c:choose>
					<c:when test="${not empty sessionScope.loginUser}">
						<p>${sessionScope.loginUser.human_id}님 환영합니다!</p>
						<button class="login-btn" onclick="location.href='logout'">로그아웃</button>
						<button class="login-btn" onclick="location.href='memberUpdate'">정보수정</button>
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

    <!-- 대회정보 -->
    <div class="running-course">
      <div class="course-header">
        <table>
          <tr>
            <td><h3>월별 대회정보</h3></td>
            <td>
              <select id="monthSelect" class="month-select">
                <option value="03">3월</option>
                <option value="04">4월</option>
                <option value="05">5월</option>
              </select>
            </td>
          </tr>
        </table>
      </div>
    </div>

    <!-- 배너 이미지 -->
    <div class="banner-section">
      <div class="banner-image">
          2025 마라톤 대회 일정
      </div>
    </div>

    <!-- 게임 리스트 -->
  <div id="game-list" class="game-list"></div>

<!-- 페이지네이션 -->
<div id="pagination" class="pagination"></div>


  <!-- JS -->
  <script>
  $(document).ready(function () {
	  loadGameList("03", 1);  // 기본 3월 로딩

	  $("#monthSelect").change(function () {
	    var selectedMonth = $(this).val();
	    loadGameList(selectedMonth, 1);
	  });
	});

	function loadGameList(month, page) {
	  var size = 6;

	  $.ajax({
	    type: "GET",
	    url: "gameMap",
	    data: {
	      month: month,
	      page: page,
	      size: size
	    },
	    dataType: "json",
	    success: function (response) {
	      console.log("🔥 response:", response);
	      renderGameList(response.games);
	      createPagination(response.totalPages, response.currentPage, month);
	    },
	    error: function (err) {
	      console.error("에러:", err);
	    }
	  });
	}

	function renderGameList(list) {
	  $("#game-list").empty();  // 기존 내용 비움

	  if (list.length === 0) {
	    $("#game-list").html("<p>해당 월에 대회가 없습니다.</p>");
	    return;
	  }

	  for (var i = 0; i < list.length; i++) {
	    var game = list[i];
	    // 대회 링크 URL 생성 (game_link 필드가 있다고 가정)
	    var gameLink = game.game_link || 'http://www.marathon.pe.kr/index_calendar.html';
	    var item = '<a href="' + gameLink + '" class="game-item" target="_blank">'
	      + '<h4>🏃‍♂️ ' + game.game_name + '</h4>'
	      + '<p><strong>날짜:</strong> ' + game.game_date + '</p>'
	      + '<p><strong>장소:</strong> ' + game.game_place + '</p>'
	      + '<p><strong>주최:</strong> ' + game.game_main + '</p>'
	      + '<p><strong>종목:</strong> ' + game.game_type + '</p>'
	      + '</a>';
	    $("#game-list").append(item);
	  }
	}

	function createPagination(totalPages, currentPage, month) {
		  $("#pagination").empty();

		  for (let i = 1; i <= totalPages; i++) {
		    let btn = $("<button>")
		      .text(i)
		      .addClass("page-btn" + (i === currentPage ? " active" : ""));

		    btn.on("click", function () {
		      loadGameList(month, i);
		    });

		    $("#pagination").append(btn);
		  }
		}
</script>
    
</body>

</html>