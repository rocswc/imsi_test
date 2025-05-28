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
<title>동틀무렵 - 커뮤니티</title>
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
   min-height: auto; /* vh 제거 */
   display: flex;
   justify-content: center;
   align-items: flex-start;
   padding-top: 20px; /* 상단 여백 축소 */
   font-size: 14px; /* 글자 크기 살짝 축소 */
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
  font-size: 24px;
  font-weight: 700;
}

/* 네비게이션 */
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
  gap: 20px;
}

.nav-menu ul li a {
  text-decoration: none;
  color: #333;
  font-weight: 500;
  font-size: 14px;
}

.nav-menu ul li a:hover {
  color: #156206;
}

/* 로그인/회원가입 버튼 */
.auth-buttons {
  position: absolute;
  right: 30px;
  top: 50%;
  transform: translateY(-50%);
  display: flex;
  gap: 8px;
}

.auth-buttons button {
  padding: 6px 14px;
  border-radius: 20px;
  border: none;
  cursor: pointer;
  font-size: 13px;
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

/* 회원정보 수정 영역 스타일 */
.profile-content {
    padding: 20px;
    max-width: 500px;
    margin: 0 auto;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.profile-title {
    font-size: 20px;
    font-weight: 700;
    color: #156206;
    margin-bottom: 20px;
    text-align: center;
    padding-bottom: 10px;
    border-bottom: 1px solid #eaeaea;
}

.form-group {
    margin-bottom: 10px;
}

.form-input {
    width: 100%;
    padding: 8px 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    background-color: #fff;
    font-size: 14px;
}

.form-input:focus {
    outline: none;
    border: 2px solid #ddd;
}

.form-label {
    display: block;
    margin-bottom: 6px;
    font-weight: 500;
    color: #333;
}

.form-select {
    width: 100%;
    padding: 8px 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
    background-color: #fff;
    font-size: 14px;
    appearance: none;
    background-repeat: no-repeat;
    background-position: right 15px center;
}

.btn-group {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
    flex-wrap: wrap;
    gap: 10px;
}

.btn {
    padding: 10px 16px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s;
}

.btn-primary {
    background-color: #156206;
    color: white;
    flex: 3;
    margin-right: 10px;
}

.btn-danger {
    background-color: #FFFFFA;
    color: #ff4757;
    border: 1px solid #ff4757;
    flex: 1;
}

.btn:hover {
    opacity: 0.9;
    transform: translateY(-2px);
}

.birthdate-container {
    display: flex;
    gap: 10px;
}

.birthdate-input {
    flex: 2;
}

.gender-select {
    flex: 1;
}

.hint-input {
    width: 100%;
}


</style>
</head>
<body>
	
        <div class="profile-content">
            <h2 class="profile-title">회원정보 수정</h2>
            
            <form id="profileForm" action="updateProfile" method="post">
                <div class="form-group">
                    <label class="form-label" for="userid">아이디</label>
                    <input type="text" id="userid" name="human_id" class="form-input" value="${sessionScope.loginUser.human_id}" readonly>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="currentPassword">현재 비밀번호</label>
                    <input type="password" id="currentPassword" name="now-pass" class="form-input" placeholder="현재 비밀번호를 입력하세요" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="newPassword">새 비밀번호</label>
                    <input type="password" id="newPassword" name="human_pass" class="form-input" placeholder="새 비밀번호를 입력하세요">
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="confirmPassword">새 비밀번호 확인</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-input" placeholder="새 비밀번호를 다시 입력하세요">
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="email">이메일</label>
                    <input type="email" id="email" name="human_email" class="form-input" value="">
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="name">성명</label>
                    <input type="text" id="name" name="human_name" class="form-input" value="" >
                </div>
                
                
                
                <div class="form-group">
                    <label class="form-label" for="phone">전화번호</label>
                    <input type="tel" id="phone" name="human_tel" class="form-input" value="" >
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="idHint">아이디 찾기용 질문</label>
                    <select id="idHint" name="idHint" class="form-select">
                        <option value="1">아이디 찾기용 질문을 선택하세요</option>
                        <option value="2">내가 졸업한 초등학교는?</option>
                        <option value="3">나의 보물 1호는?</option>
                        <option value="4">내가 가장 좋아하는 영화는?</option>
                        <option value="5">내가 가장 좋아하는 음식은?</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="idHintAnswer">힌트입력</label>
                    <input type="text" id="idHintAnswer" name="human_hint" class="form-input hint-input" placeholder="질문의 답변을 입력하세요">
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="pwHint">비밀번호 찾기용 질문</label>
                    <select id="pwHint" name="pwHint" class="form-select">
                        <option value="1">비밀번호 찾기용 질문을 선택하세요</option>
                        <option value="2">나의 출신 초등학교는?</option>
                        <option value="3">나의 첫 번째 애완동물 이름은?</option>
                        <option value="4">내가 태어난 고향은?</option>
                        <option value="5">어머니의 성함은?</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="pwHintAnswer">힌트입력</label>
                    <input type="text" id="pwHintAnswer" name="human_passhint" class="form-input hint-input" placeholder="질문의 답변을 입력하세요">
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">수정완료</button>
                    <a href="index.jsp" class="btn btn-danger">돌아가기</a>
                </div>
            </form>
        </div>
  
	  
	<script>
	</script>
    
</body>

</html>
