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

/* 커뮤니티(board) 정보 표시 영역 스타일 */
.container {
    max-width: 1600px;
    margin: 0 auto;
    padding: 20px;
}

/* 섹션 헤더 */
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

/* 작성 버튼 스타일 */
.section-header button {
    padding: 5px 10px;
    background-color: #fff;
    color: #333;
    border: 1px solid #ddd;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.1s ease;
}

.section-header button:hover {
    background-color: #191919;
    color: #fff;
    border-color: #191919;
}

/* 게시글 그리드 레이아웃 */
.board-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    margin-bottom: 40px;
}

/* 카드 스타일 */
.card {
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    transition: all 0.3s ease;
    cursor: pointer;
    background: #fff;
}

.card-img-container {
    width: 100%;
    position: relative;
    aspect-ratio: 4/3;
    overflow: hidden;
    background-color: #f5f5f5;
}

.card-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.no-image {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f8f9fa;
    color: #666;
    font-size: 14px;
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
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
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

/* 게시글 없을 때 */
.no-posts {
    text-align: center;
    padding: 60px 20px;
    color: #666;
}

.no-posts i {
    font-size: 48px;
    margin-bottom: 20px;
    color: #ddd;
}

.no-posts h3 {
    font-size: 18px;
    margin-bottom: 10px;
}

.no-posts p {
    font-size: 14px;
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
		</div>
	</header>
	<!-- 헤더 끝 -->

    <!-- 게시판 컨텐츠 영역 -->
    <div class="container">
        <div class="section-header">
            <h2 class="section-title">최신 게시글</h2>
            <button onclick="location.href='boardInsert'">작성</button>   
        </div>
        
                    
            <!-- 게시판 리스트 -->
			<div id="board-list" class="board-list"></div>

			<!-- 페이지네이션 -->
			<div id="pagination" class="pagination"></div>
			
    </div>


    <script>
    
    loadBoardList(1);
    
	function loadBoardList(page){
		const size = 8;
		
		$.ajax({
			url: "boardList"
			,type: "get"
			,data:{
				page: page,
				size: size
			}
			,dataType: "json"
			,success: function(response){
				//console.log("response:", response);
				boardList(response.boardList);
				createPagination(response.totalPages, response.currentPage);
			}
			,error: function(err){
				console.error("에러:", err);
			}
		});
	}

    // 게시글 불러오기
    function boardList(list) {
    	$("#board-list").empty();  // 기존 내용 비움
    	if(list.length === 0 ){
    		$("#board-list").html(`
    			    <div class="no-posts">
    			        <i class="fas fa-clipboard-list"></i>
    			        <h3>게시글이 없습니다</h3>
    			        <p>첫 번째 게시글을 작성해보세요!</p>
    			    </div>
    			`);
    		return;
    	}

        var container = '<div class="board-grid">';

        for (var i = 0; i < list.length; i++) {
            var boardList = list[i];
            var imageUrl = boardList.board_fname
                ? "/trip/resources/images/" + boardList.board_realfname + "_" + boardList.board_fname
                : "/trip/resources/images/No_image.jpg";

            container += '<div class="card" onclick="location.href=\'getBoard?board_id=' + boardList.board_id + '\'">'
                + '<div class="card-img-container">'
                + '<img src="' + imageUrl + '" alt="이미지" class="card-img">'
                + '</div>'
                + '<div class="card-content">'
                + '<h3 class="card-title">' + boardList.board_title + '</h3>'
                + '<div class="card-info">'
                + '<div class="user-date">'
                + '<span>작성자: ' + boardList.human_id + '</span>'
                + '<span>' + boardList.board_date + '</span>'
                + '</div>'
                + '<div class="stats">'
                + '<div class="stat">'
                + '<span class="stat-icon">댓글</span>'
                + '<span>' + (boardList.reply_count != null ? boardList.reply_count : 0) + '</span>'
                + '</div>'
                + '<div class="stat">'
                + '<span class="stat-icon">❤</span>'
                + '<span>' + (boardList.like_count != null ? boardList.like_count : 0) + '</span>'
                + '</div>'
                + '</div></div></div></div>';
        }

        container += '</div>'; // board-grid 닫기

        $("#board-list").append(container);
    }
    	
    
    //페이지 생성
    function createPagination(totalPages, currentPage) {
		$("#pagination").empty();
		
		for(let i = 1; i <= totalPages; i++){
			let btn = $("<button>")
		      .text(i)
		      .addClass("page-btn" + (i === currentPage ? " active" : ""));

		    btn.on("click", function () {
		    	loadBoardList(i);
		    });

		    $("#pagination").append(btn);
		  }
	}
    	
 
    
    </script>
    
</body>
</html>