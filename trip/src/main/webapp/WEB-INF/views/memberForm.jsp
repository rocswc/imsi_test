<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <title>회원가입</title>
  <style>
    :root {
      --primary-green: #426B1F;
      --light-green: #6A994E;
      --light-beige: #FFFBEA;
      --error: #D62828;
      --success: #386641;
      --font-main: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    }

    body {
      font-family: var(--font-main);
      margin: 0;
      padding: 0;
      background-color: var(--light-beige);
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .signup-container {
      background-color: white;
      border-radius: 12px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 450px;
      padding: 25px;
    }

    .signup-title {
      color: var(--primary-green);
      font-size: 24px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 25px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .input-field, .select-field {
      width: 100%;
      height: 46px;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 6px;
      font-size: 16px;
      box-sizing: border-box;
      transition: border-color 0.3s;
    }

    .input-field:focus, .select-field:focus {
      border-color: var(--light-green);
      outline: none;
    }

    .row {
      display: flex;
      gap: 10px;
    }

    .btn {
      padding: 10px 15px;
      background-color: #000;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 14px;
      font-weight: 600;
    }

    .signup-btn {
      width: 100%;
      padding: 15px;
      background-color: #000;
      color: white;
      border: none;
      border-radius: 28px;
      font-size: 16px;
      font-weight: 600;
      margin-top: 25px;
      cursor: pointer;
    }

    .validation-message {
      font-size: 14px;
      margin-top: 5px;
      display: flex;
      align-items: center;
      padding-left: 5px;
    }

    .validation-message svg {
      margin-right: 5px;
    }

    .validation-message.error { color: var(--error); }
    .validation-message.success { color: var(--success); }

    .hidden { display: none; }

    @media (max-width: 500px) {
      .signup-container { border-radius: 0; box-shadow: none; }
      .row { flex-direction: column; gap: 15px; }
    }
  </style>
</head>
<body>
  <div class="signup-container">
    <div class="signup-title">회원가입</div>

    <form id="signupForm" action= "saveHumanVO" method="post" >
      <div class="form-group">
        <div class="row">
          <input type="text" placeholder="아이디"  name = "human_id" class="input-field" id="userid">
          <button type="button" class="btn" id="idCheckBtn">중복확인</button>
        </div>
        <div class="validation-message success hidden" id="userid-success">✔ 사용 가능한 아이디입니다</div>
        <div class="validation-message error hidden" id="userid-error">✖ 이미 사용중인 아이디입니다</div>
      </div>

      <div class="form-group">
        <div class="row">
          <input type="password" placeholder="비밀번호" class="input-field"  id="password">
          <button type="button" class="btn" id="pwCheckBtn">확인</button>
        </div>
        <div class="validation-message success hidden" id="password-success">✔ 사용 가능한 비밀번호입니다</div>
        <div class="validation-message error hidden" id="password-error">✖ 영문, 숫자, 특수문자 포함 8자 이상</div>
      </div>

      <div class="form-group">
        <input type="password" placeholder="비밀번호 재입력"  name = "human_pass" class="input-field" id="password-confirm">
        <div class="validation-message success hidden" id="password-match-success">✔ 비밀번호가 일치합니다</div>
        <div class="validation-message error hidden" id="password-match-error">✖ 비밀번호가 일치하지 않습니다</div>
      </div>

      <div class="form-group"><input type="email" placeholder="이메일"  name = "human_email"  class="input-field"></div>
      <div class="form-group"><input type="text" placeholder="성명"  name = "human_name"  class="input-field"></div>

      <div class="form-group row">
        <input type="text" placeholder="생년월일"  name = "human_birth"  class="input-field">
        <select class="select-field" name = "human_gender" >
          <option value="" disabled selected>성별</option>
          <option value="man">남</option>
          <option value="girl">여</option>
        </select>
      </div>

      <div class="form-group"><input type="tel" placeholder="전화번호"  name = "human_tel" class="input-field"></div>

      <div class="form-group">
      		<select class="select-field" >
		      <option value="" disabled selected>아이디 찾기용 질문을 선택하세요</option>
		      <option>어릴적 별명은?</option>
		      <option>반려견 이름은?</option>
		      <option>자신의 고향은?</option>
		     </select>
	  </div>
      <div class="form-group">
      	<input type="text" placeholder="힌트입력"  name = "human_hint" class="input-field">
      </div>

      <div class="form-group">
	      <select class="select-field">
		      <option value="" disabled selected>비밀번호 찾기용 질문을 선택하세요</option>
		      <option>첫사랑 이름은?</option>
		      <option>친한 친구 이름은?</option>
		      <option>좋아하는 영화는?</option>
	      </select>
	  </div>
      <div class="form-group">
     	 <input type="text" placeholder="힌트입력"  name = "human_passhint" class="input-field">
      </div>

      <button type="submit" class="signup-btn">회원가입</button>
    </form>
  </div>

  <script>
    const useridInput = document.getElementById('userid');
    const passwordInput = document.getElementById('password');
    const passwordConfirmInput = document.getElementById('password-confirm');

    const useridSuccess = document.getElementById('userid-success');
    const useridError = document.getElementById('userid-error');
    const passwordError = document.getElementById('password-error');
    const passwordSuccess = document.getElementById('password-success');
    const passwordMatchError = document.getElementById('password-match-error');
    const passwordMatchSuccess = document.getElementById('password-match-success');

    document.getElementById('idCheckBtn').addEventListener('click', () => {
    	
    	
    
    	
    	
    	
      const userid = useridInput.value.trim();
      
      $.ajax({  
			type : 'post'
			, url  : 'logincheck'
			, data :  { human_id: userid }
			, dataType : 'json'
			, success : function (result){
		
			
			if (result.status === 'success') {
				  
				//alert('가능한 아이디 입니다');
				 $('#userid-error').show();
				 $('#userid-success').hide();
				 
				    
			} else {
				// alert('이미 있는 아이디 입니다');
				
				 
				 $('#userid-success').show();
				 $('#userid-error').hide();
			}
			
			
	        },
	        error: function() {
	            alert('서버 오류가 발생했습니다.');
	        }
			/*location.href = "main"; 
			if (result.status === 'success') {
			    // 로그인 성공
			    location.href = "main";
			  } else {
			    // 로그인 실패
			    alert('아이디 또는 비밀번호가 틀렸습니다.');
			  }*/
				  
							  
						
	        
		})
      
      
      
      
     
    });

    document.getElementById('pwCheckBtn').addEventListener('click', () => {
      const password = passwordInput.value;
      const regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{8,}$/;
      const valid = regex.test(password);
      passwordSuccess.classList.toggle('hidden', !valid);
      passwordError.classList.toggle('hidden', valid);
    });

    function checkPasswordMatch() {
      const pw = passwordInput.value;
      const confirm = passwordConfirmInput.value;
      const match = pw === confirm && pw !== '';
      passwordMatchSuccess.classList.toggle('hidden', !match);
      passwordMatchError.classList.toggle('hidden', match || confirm === '');
    }

    passwordConfirmInput.addEventListener('input', checkPasswordMatch);
    passwordInput.addEventListener('input', checkPasswordMatch);

    document.getElementById('signupForm').addEventListener('submit', function() {
      
      alert('회원가입 폼이 제출되었습니다.');
    });
  </script>
</body>
</html>