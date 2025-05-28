<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동틀무렵 - 아이디 찾기</title>
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
            background-color: #F3F2F1;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .find-id-container {
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
            color: #426B1F;
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
            background-color: #426B1F;
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
            background-color: #426B1F;
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
            border-color: #426B1F;
            outline: none;
            box-shadow: 0 0 0 2px rgba(66, 107, 31, 0.2);
        }
        
        .next-btn {
            width: 100%;
            padding: 12px;
            background-color: #426B1F;
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
            background-color: #365818;
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
            color: #426B1F;
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
        
        .result-id {
            background-color: #f8f9f7;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 18px;
            font-weight: 500;
        }
        
        .login-btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: #426B1F;
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
            background-color: #365818;
        }
        
        /* 반응형 */
        @media (max-width: 480px) {
            .find-id-container {
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
    
    <div class="find-id-container">
        <div class="logo">동틀무렵</div>
        <div class="title">아이디 찾기</div>
        
        <div class="steps">
            <div class="step active">1</div>
            <div class="step">2</div>
        </div>
        
        <div id="step1" class="step-container">
            <form id="findIdForm"  method="post">
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name = "human_name" value ="${human.human_name}" class="form-control" placeholder="이름을 입력하세요">
                </div>
                
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name = "human_email" value ="${human.human_email}" class="form-control" placeholder="가입 시 등록한 이메일을 입력하세요">
                </div>
                <div id = "loginerr" style="display: none; color: red;" >입력하신 정보와 일치하는 아이디는 없습니다</div>
                <button type="button" id="nextBtn"   class="next-btn">확인</button>
            </form>
        </div>
        
        <div id="step2" class="step-container result-container">
            <div class="result-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <div class="result-message">
                입력하신 정보와 일치하는 아이디를 찾았습니다.
            </div>
            <div class="result-id" id="foundId">
				
			</div>
            <a href="getHuman" class="login-btn">로그인하기</a>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    const step1 = document.getElementById('step1');
    const step2 = document.getElementById('step2');
    const steps = document.querySelectorAll('.step');

    function isValidEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }

    $('#nextBtn').on('click', function(e) {
        e.preventDefault();

        const name = $('#name').val();
        const email = $('#email').val();

        // 입력값 검증
        if (!name || !email) {
            alert('이름과 이메일을 모두 입력해주세요.');
            return;
        }

        if (!isValidEmail(email)) {
            alert('유효한 이메일 주소를 입력해주세요.');
            return;
        }

        // 서버 요청
        $.ajax({
            type: 'post',
            url: 'findId',
            data: {
                human_name: name,
                human_email: email
            },
            dataType: 'json',
            success: function(result) {
                if (result.status === 'success') {
                    $('#foundId').text(result.human_id);
                    $('#loginerr').hide();

                    step1.style.display = 'none';
                    step2.style.display = 'block';
                    steps[0].classList.remove('active');
                    steps[1].classList.add('active');
                } else {
                    $('#loginerr').show();
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