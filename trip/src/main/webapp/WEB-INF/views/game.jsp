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

/* 정보 표시 영역 스타일 */
.walking-course {
    margin-top: 30px;
    margin-bottom: 20px;
    padding: 0 30px;
}

.walking-course h3 {
    margin-bottom: 15px;
    font-size: 18px;
    color: #156206;
}

.course-header {
  display: flex;
  justify-content: center;  /* 수평 가운데 정렬 */
  align-items: center;
  margin-bottom: 20px;
}
.course-header table {
  margin: 0 auto;  /* 테이블도 수평 가운데 정렬 */
}
.course-header td {
  padding: 0 10px;  /* 셀 간 간격 */
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








.page-btn {
  padding: 6px 12px;
  margin: 0 3px;
  background-color: #fff;
  color: #156206;
  border: 1px solid #156206;
  border-radius: 5px;
  cursor: pointer;
}

.page-btn.active {
  background-color: #156206;
  color: #fff;
}
.game-item {
  border: 1px solid #ddd;
  padding: 15px;
  margin-bottom: 15px;
  border-radius: 8px;
  background-color: #fff;
}

.game-list {
  padding: 20px;
}

.pagination {
  margin: 10px 20px;
}

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
</style>
</head>
<body>
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
	  var size = 4;

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
	    var item = '<div class="game-item">'
	      + '<h4>📌 ' + game.game_name + '</h4>'
	      + '<p><strong>날짜:</strong> ' + game.game_date + '</p>'
	      + '<p><strong>장소:</strong> ' + game.game_place + '</p>'
	      + '<p><strong>주최:</strong> ' + game.game_main + '</p>'
	      + '<p><strong>종목:</strong> ' + game.game_type + '</p>'
	      + '</div>';
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
