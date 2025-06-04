<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동틀무렵 - 비밀번호 찾기</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .find-pw-container {
            width: 400px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            padding: 40px 30px;
            text-align: center;
        }
        
        .logo {
            font-size: 24px;
            font-weight: 700;
            color: #000000;
            margin-bottom: 20px;
        }
        
        .title {
            font-size: 18px;
            color: #333;
            margin-bottom: 30px;
        }
        
        .steps {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }
        
        .step {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #eee;
            color: #999;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            position: relative;
            margin: 0 20px;
        }
        
        .step.active {
            background-color: #333333;
            color: white;
        }
        
        .step::after {
            content: '';
            position: absolute;
            width: 40px;
            height: 2px;
            background-color: #eee;
            top: 50%;
            left: 30px;
        }
        
        .step:last-child::after {
            display: none;
        }
        
        .step.active::after {
            background-color: #999;
        }
        
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #666;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 15px;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color: #999999;
            outline: none;
        }
        
        .next-btn {
            width: 100%;
            padding: 12px;
            background-color: #222222;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .next-btn:hover {
            opacity: 90%;
        }
        
        .back-link {
            position: absolute;
            top: 20px;
            left: 20px;
            color: #666;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 14px;
            transition: all 0.3s;
        }
        
        .back-link i {
            margin-right: 5px;
        }
        
        .back-link:hover {
            color: #444;
        }
        
        .result-container {
            display: none;
            text-align: center;
        }
        
        .result-icon {
            font-size: 50px;
            color: #426B1F;
            margin-bottom: 20px;
        }
        
        .result-message {
            font-size: 16px;
            margin-bottom: 30px;
            line-height: 1.5;
        }
        
        #hint-container {
            display: none;
        }
        
        .hint-answer {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 15px;
            transition: all 0.3s;
            margin-top: 5px;
        }
        
        .hint-answer:focus {
            border-color: #222222;
            outline: none;
        }
        
        .password-reset-form {
            text-align: left;
            margin-bottom: 20px;
            background-color: #f8f9f7;
            padding: 20px;
            border-radius: 8px;
        }
        
        .result-id {
            background-color: #f8f9f7;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 18px;
            font-weight: 500;
        }
        
        #step3 {
            padding: 20px 0;
        }
        
        .success-message {
            color: #222222;
            font-weight: 500;
            margin-bottom: 15px;
        }
        
        .login-btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: #111111;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
        }
        
        .login-btn:hover {
            opacity: 90%;
        }
        
        /* 반응형 */
        @media (max-width: 480px) {
            .find-pw-container {
                width: 90%;
                padding: 30px 20px;
            }
            
            .steps {
                margin-bottom: 20px;
            }
            
            .step {
                margin: 0 10px;
            }
        }
    </style>
</head>
<body>
    <a href="login.html" class="back-link">
        <i class="fas fa-arrow-left"></i> 로그인으로 돌아가기
    </a>
    
    <div class="find-pw-container">
        <div class="logo">동틀무렵</div>
        <div class="title">비밀번호 찾기</div>
        
        <div class="steps">
            <div class="step active">1</div>
            <div class="step">2</div>
            <div class="step">3</div>
        </div>
        
        <div id="step1" class="step-container">
            <form id="findPwForm" method="post">
                <div class="form-group">
                    <label for="userId">아이디</label>
                    <input type="text" id="userId" name="human_id" value="${human.human_id}" class="form-control" placeholder="아이디를 입력하세요">
                </div>
                
                
                <div class="form-group">
                    <label for="hintType">비밀번호 힌트</label>
                    <select id="hintType" name="hint_type" class="form-control">
                     <option value="">힌트 유형 선택</option>
                      <option>내가 졸업한 초등학교는?</option>
				      <option>첫사랑 이름은?</option>
				      <option>내가 태어난 고향은?</option>
				      <option>나의 보물 1호는?</option>
            	    </select>
                </div>
                
                <div id="hint-container" class="form-group">
                    <label for="hintAnswer">힌트 답변</label>
                    <input type="text" id="hintAnswer" name="hint_answer" class="form-control hint-answer" placeholder="선택한 힌트의 답변을 입력하세요">
                </div>
                
                <div id="loginerr" style="display: none; color: red; margin-bottom: 15px;">입력하신 정보와 일치하는 계정이 없습니다</div>
                <button type="button" id="nextBtn" class="next-btn">확인</button>
            </form>
        </div>
        
        <div id="step2" class="step-container result-container">
        <form id="updatePwForm" method="post" action ="updatepass">
            <div class="result-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <div class="result-message">
                인증이 완료되었습니다.<br>새로운 비밀번호를 설정해주세요.
            </div>
            <div class="password-reset-form">
            
              <input id = "human"type="hidden" name="human_id" value="${sessionScope.human_id}" />
                <div class="form-group">
                    <label for="newPassword">새 비밀번호</label>
                    <input type="password" id="newPassword" name="new_password" class="form-control" placeholder="새 비밀번호를 입력하세요">
                    <p style="font-size: 12px; color: #777; margin-top: 5px;">* 영문, 숫자, 특수문자 포함 8자 이상</p>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">새 비밀번호 확인</label>
                    <input type="password" id="confirmPassword" name="confirm_password" class="form-control" placeholder="새 비밀번호를 다시 입력하세요">
                </div>
                <div id="password-error" style="display: none; color: red; margin-bottom: 15px;">비밀번호가 일치하지 않습니다</div>
                <button type="button" id="resetBtn" class="next-btn">비밀번호 변경</button>
                
            </div>
              </form>
        </div>
        
        <div id="step3" class="step-container result-container">
            <div class="result-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <div class="result-message">
                <div class="success-message">비밀번호 변경 완료</div>
                비밀번호가 성공적으로 변경되었습니다.<br>새 비밀번호로 로그인해주세요.
            </div>
            <a href="getHuman" class="login-btn">로그인하기</a>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    const step1 = document.getElementById('step1');
    const step2 = document.getElementById('step2');
    const step3 = document.getElementById('step3');
    const steps = document.querySelectorAll('.step');
    
    // 힌트 유형 선택 시 힌트 답변 표시
    $('#hintType').on('change', function() {
        if ($(this).val()) {
            $('#hint-container').show();
        } else {
            $('#hint-container').hide();
        }
    });

    

    // 비밀번호 유효성 검증
    function isValidPassword(password) {
        // 최소 8자, 영문, 숫자, 특수문자 포함
        const re = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        return re.test(password);
    }

    // 다음 단계로 진행 (인증)
    $('#nextBtn').on('click', function(e) {
        e.preventDefault();

        const userId = $('#userId').val();
        const hintAnswer = $('#hintAnswer').val();

        // 입력값 검증
        if (!userId | !hintAnswer) {
            alert('모든 정보를 입력해주세요.');
            return;
        }


        // 서버 요청
        $.ajax({
            type: 'post',
            url: 'findPass',
            data: {
                human_id: userId,
            	human_passhint: hintAnswer
            },
            dataType: 'json',
            success: function(result) {
                if (result.status === 'success') {
                    $('#loginerr').hide();
                    
                    // 다음 단계 표시
                    step1.style.display = 'none';
                    step2.style.display = 'block';
                    steps[0].classList.remove('active');
                    steps[1].classList.add('active');
                } else {
                    // 모든 입력값 초기화
                    $('#userId').val('');
         			$('#hintAnswer').val('');
                    $('#hint-container').hide();
                    $('#loginerr').show();
                }	
            },		
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }		
        });			
    });				
    				
    // 비밀번호 재설정		
    $('#resetBtn').on('click', function(e) {
        e.preventDefault();
        			
        const newPassword = $('#newPassword').val();
        const confirmPassword = $('#confirmPassword').val();
        			
        // 입력값 검증	
        if (!newPassword || !confirmPassword) {
            alert('새 비밀번호를 입력해주세요.');
            return;
        }			
        			
        if (!isValidPassword(newPassword)) {
            alert('비밀번호는 영문, 숫자, 특수문자를 포함한 8자 이상이어야 합니다.');
            return;
        }			
        
        if (newPassword !== confirmPassword) {
            $('#password-error').show();
            return;
        } else {
            $('#password-error').hide();
        }
        
        // 서버 요청
        $.ajax({
            type: 'post',
            url: 'updatepass',
            data: {
                human_id: $('#human').val(), 
                human_pass: newPassword
            },
            dataType: 'json',
            success: function(result) {
                if (result.status === 'success') {
                    // 비밀번호 변경 완료 단계 표시
                    step2.style.display = 'none';
                    step3.style.display = 'block';
                    steps[1].classList.remove('active');
                    steps[2].classList.add('active');
                } else {
                    alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.');
                }
            },
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }
        });
    });
</script>
</body>
</html>