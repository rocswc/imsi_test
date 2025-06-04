<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동틀무렵 - 로그인</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
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
        
        .login-container {
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
            color: #000;
            margin-bottom: 30px;
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
            border-color: #999;
            outline: none;
        }
        
        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #111;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .login-btn:hover {
            background-color: #333;
        }
        
        .links {
            margin-top: 25px;
            display: flex;
            justify-content: center;       /* 수평 중앙 정렬 */
		    align-items: center;           /* 세로축 중앙 */
		    gap: 20px;                     /* 요소 사이 간격 */
            font-size: 14px;
        }
        
        .links a {
            color: #666;
            text-decoration: none;
            display: flex;               /* 아이콘, 텍스트 중앙 정렬용 */
    		align-items: center;
            transition: all 0.3s;
        }
        
        .links a:hover {
            color: #444;
            text-decoration: underline;
        }
        
        .divider {
            margin: 30px 0;
            border-top: 1px solid #eee;
            position: relative;
        }
        
        .divider span {
            position: absolute;
            top: -10px;
            left: 50%;
            transform: translateX(-50%);
            background-color: white;
            padding: 0 15px;
            color: #999;
            font-size: 14px;
        }
        
        .register-btn {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: white;
            color: #333;
            border: 1px solid #333;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
            text-decoration: none;
        }
        
        .register-btn:hover {
            background-color: #f6f6f6;
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
        
    </style>
</head>
<body>
    <a href="index2.jsp" class="back-link">
        <i class="fas fa-arrow-left"></i> 홈으로 돌아가기
    </a>
    
    <div class="login-container">
        <div class="logo">동틀무렵</div>
  
        <form  method="post" id ="login_f">
   
        
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="username" name = "human_id" value ="${human.human_id}" class="form-control" placeholder="아이디를 입력하세요">
            </div>
            
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name = "human_pass" value ="${human.human_pass}" class="form-control" placeholder="비밀번호를 입력하세요">
            </div>
            
            <button type="submit" class="login-btn">로그인</button>
            
            <div id="login_msg" style="color:red; font-size:15px; font-weight:bold; margin-top:10px;"></div>
            
            <div class="links">
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=0b582480692a1acc336163c086a3eb8d&redirect_uri=http://localhost:8080/trip/kakaoLogin&response_type=code">
   			 <img src="/trip/resources/images/kakao.png" />
   			 </a>
                <a href="getHumanId">아이디 찾기</a>
                <a href="getHumanPass">비밀번호 찾기</a>
            </div>
            
            <div class="divider">
                <span>또는</span>
            </div>
            
            <a href="memberForm" class="register-btn">회원가입</a>
        </form>
    </div>
<script type="text/javascript">$('#login_f').on('submit', function(e){
		// 카테고리 번호 확인
		//alert($(this).val());
		e.preventDefault();
		 
		var param = {human_id: $('#username').val(),
				human_pass: $('#password').val()}
		
		$.ajax({  
			type : 'post'
			, url  : 'getLogin'
			, data : param
			, dataType : 'json'
			, success : function (result){
			//alert('댓글입력성공'+ result);
			$('#username').val('');
			$('#password').val('');
			
			if (result.status === 'success') {
				if(result.id === 'admin'){
					location.href = "admin/adminDashBoard";  
				}else{
					location.href = "index2.jsp";
				}
			} else {
			    $('#login_msg').text('아이디 또는 비밀번호가 틀렸습니다.');
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
	        
		})</script>
</body>
</html>