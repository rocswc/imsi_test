<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>동틀무렵 - 운동코스 추천 챗봇</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<style>
* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
}

body {
   background: linear-gradient(135deg, #A8D8FF 0%, #D2F0FF 50%, #87CEEB 100%);
   min-height: 100vh;
   display: flex;
   justify-content: center;
   align-items: center;
   padding: 20px;
}

.chatbot-container {
   width: 100%;
   max-width: 500px;
   height: 700px;
   background: rgba(255, 255, 255, 0.95);
   backdrop-filter: blur(20px);
   border-radius: 25px;
   box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
   display: flex;
   flex-direction: column;
   overflow: hidden;
   animation: slideUp 0.5s ease-out;
}

@keyframes slideUp {
   from {
      opacity: 0;
      transform: translateY(30px);
   }
   to {
      opacity: 1;
      transform: translateY(0);
   }
}

.chatbot-header {
   background: linear-gradient(135deg, #4A90E2, #87CEEB);
   color: white;
   padding: 20px;
   text-align: center;
   position: relative;
}

.chatbot-title {
   font-size: 1.5rem;
   font-weight: 700;
   margin-bottom: 5px;
}

.chatbot-subtitle {
   font-size: 0.9rem;
   opacity: 0.9;
}

.status-indicator {
   position: absolute;
   top: 15px;
   right: 20px;
   width: 10px;
   height: 10px;
   background: #4CAF50;
   border-radius: 50%;
   animation: pulse 2s infinite;
}

@keyframes pulse {
   0% { opacity: 1; }
   50% { opacity: 0.5; }
   100% { opacity: 1; }
}

.chat-area {
    display: flex;
  flex-direction: column;
  padding: 20px;
  overflow-y: auto;
  background: rgba(255, 255, 255, 0.5);
}

.chat-area::-webkit-scrollbar {
   width: 6px;
}

.chat-area::-webkit-scrollbar-track {
   background: rgba(0, 0, 0, 0.1);
   border-radius: 10px;
}

.chat-area::-webkit-scrollbar-thumb {
   background: linear-gradient(135deg, #4A90E2, #87CEEB);
   border-radius: 10px;
}

.message {
    max-width: 70%;
  padding: 10px 14px;
  margin-bottom: 10px;
  border-radius: 15px;
  font-size: 0.95rem;
  word-break: break-word;
  white-space: pre-wrap;
}

@keyframes fadeIn {
   from {
      opacity: 0;
      transform: translateY(10px);
   }
   to {
      opacity: 1;
      transform: translateY(0);
   }
}

.message.user {
align-self: flex-end; /* 🔵 사용자: 우측 정렬 */
  background: #4A90E2;
  color: white;
  border-bottom-right-radius: 0;
}

.message-avatar {
   width: 35px;
   height: 35px;
   border-radius: 50%;
   display: flex;
   align-items: center;
   justify-content: center;
   font-size: 1.2rem;
   flex-shrink: 0;
}

.bot-avatar {
   background: linear-gradient(135deg, #4A90E2, #87CEEB);
   color: white;
}

.user-avatar {
   background: linear-gradient(135deg, #FF6B6B, #FF8E53);
   color: white;
}

.message-content {
   max-width: 75%;
   padding: 12px 16px;
   border-radius: 18px;
   word-wrap: break-word;
}

.bot-message {
    align-self: flex-start;
  background: #ffffff;
  color: #333;
  border: 1px solid #ccc;
  border-bottom-left-radius: 0
}

.user-message {
   background: linear-gradient(135deg, #4A90E2, #87CEEB);
   color: white;
   border-bottom-right-radius: 8px;
}

.quick-replies {
   display: flex;
   flex-wrap: wrap;
   gap: 8px;
   margin-top: 10px;
}

.quick-reply {
   background: rgba(74, 144, 226, 0.1);
   color: #4A90E2;
   border: 1px solid rgba(74, 144, 226, 0.3);
   padding: 8px 12px;
   border-radius: 15px;
   font-size: 0.85rem;
   cursor: pointer;
   transition: all 0.3s ease;
}

.quick-reply:hover {
   background: linear-gradient(135deg, #4A90E2, #87CEEB);
   color: white;
   transform: scale(1.05);
}

.course-card {
   background: white;
   border-radius: 15px;
   padding: 15px;
   margin: 10px 0;
   box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
   border-left: 4px solid #4A90E2;
}

.course-title {
   font-weight: 600;
   color: #333;
   margin-bottom: 8px;
   font-size: 1rem;
}

.course-info {
   color: #666;
   font-size: 0.9rem;
   line-height: 1.4;
}

.course-tags {
   display: flex;
   gap: 5px;
   margin-top: 8px;
   flex-wrap: wrap;
}

.course-tag {
   background: linear-gradient(135deg, #4A90E2, #87CEEB);
   color: white;
   padding: 3px 8px;
   border-radius: 12px;
   font-size: 0.75rem;
   font-weight: 500;
}

.input-area {
   padding: 20px;
   background: white;
   border-top: 1px solid rgba(0, 0, 0, 0.1);
}

.input-container {
   display: flex;
   gap: 10px;
   align-items: center;
}

.message-input {
   flex: 1;
   padding: 12px 16px;
   border: 2px solid rgba(74, 144, 226, 0.2);
   border-radius: 25px;
   outline: none;
   font-size: 0.95rem;
   transition: all 0.3s ease;
}

.message-input:focus {
   border-color: #4A90E2;
   box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
}

.send-button {
   width: 45px;
   height: 45px;
   background: linear-gradient(135deg, #4A90E2, #87CEEB);
   color: white;
   border: none;
   border-radius: 50%;
   cursor: pointer;
   display: flex;
   align-items: center;
   justify-content: center;
   font-size: 1.1rem;
   transition: all 0.3s ease;
}

.send-button:hover {
   transform: scale(1.1);
   box-shadow: 0 5px 15px rgba(74, 144, 226, 0.4);
}

.send-button:disabled {
   opacity: 0.5;
   cursor: not-allowed;
   transform: none;
}

.typing-indicator {
   display: flex;
   align-items: center;
   gap: 5px;
   padding: 10px 16px;
   background: white;
   border-radius: 18px;
   border-bottom-left-radius: 8px;
   margin-bottom: 15px;
   box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.typing-dot {
   width: 8px;
   height: 8px;
   background: #4A90E2;
   border-radius: 50%;
   animation: typingBounce 1.4s infinite;
}

.typing-dot:nth-child(2) { animation-delay: 0.2s; }
.typing-dot:nth-child(3) { animation-delay: 0.4s; }

@keyframes typingBounce {
   0%, 60%, 100% { transform: translateY(0); }
   30% { transform: translateY(-10px); }
}

@media (max-width: 768px) {
   .chatbot-container {
      height: 100vh;
      max-height: 100vh;
      border-radius: 0;
   }
   
   body {
      padding: 0;
   }
}


.message.bot {
  align-self: flex-start;
  background: #ffffff;
  color: #333;
  border: 1px solid #ccc;
  border-radius: 15px;
  border-bottom-left-radius: 0;
}
</style>
</head>
<body>
    <div class="chatbot-container">
    <div class="chatbot-header">
      <div class="status-indicator"></div>
      <h2 class="chatbot-title">동틀무렵 AI 가이드</h2>
      <p class="chatbot-subtitle">무엇이든 물어보세요</p>
    </div>
    <div class="chat-area" id="chatArea"></div>
    <div class="input-area">
      <div class="input-container">
        <input type="text" class="message-input" id="messageInput" placeholder="메시지를 입력하세요..." onkeypress="handleKeyPress(event)">
        <button type="button" class="send-button" onclick="sendMessage()"><i class="fas fa-paper-plane"></i></button>
      </div>
    </div>
  </div>

  <script>
  document.addEventListener("DOMContentLoaded", function () {
    const chatArea = document.getElementById('chatArea');
    const messageInput = document.getElementById('messageInput');

    	function addMessage(content, isUser = false) {
    		  const message = document.createElement('div');
    		  message.className = isUser ? "message user" : "message bot";

    		  message.textContent = content;
    		  message.style.whiteSpace = "pre-wrap"; // 줄바꿈 유지

    		  chatArea.appendChild(message);
    		  chatArea.scrollTop = chatArea.scrollHeight;
    		}
    function showTyping() {
      const typing = document.createElement('div');
      typing.id = 'typing-indicator';
      typing.className = 'message';
      typing.innerHTML = `
        <div class="message-avatar bot-avatar"><i class="fas fa-robot"></i></div>
        <div class="typing-indicator">
          <div class="typing-dot"></div>
          <div class="typing-dot"></div>
          <div class="typing-dot"></div>
        </div>
      `;
      chatArea.appendChild(typing);
      chatArea.scrollTop = chatArea.scrollHeight;
    }

    function removeTyping() {
      const typing = document.getElementById('typing-indicator');
      if (typing) typing.remove();
    }

    function sendMessage() {
      const msg = messageInput.value.trim();
      if (!msg) return;
      console.log("[JS 실행됨] 입력 메시지:", msg);  
      addMessage(msg, true);
      messageInput.value = '';
      showTyping();

      $.ajax({
    	    url: "http://127.0.0.1:5000/recommendapi",
    	    method: "POST",
    	    data: JSON.stringify({ question: msg }),
    	    contentType: "application/json",
    	    success: function(data) {
    	      console.log("[Flask 응답]", data);
    	      removeTyping();
    	      addMessage(data);
    	    },
    	    error: function(xhr, status, error) {
    	      console.error("[Flask 연결 오류]", error);
    	      removeTyping();
    	      addMessage("⚠️ Gemini 서버 응답 실패");
    	    }
    	  });
    	}

    function handleKeyPress(e) {
      if (e.key === 'Enter') sendMessage();
    }

    messageInput.focus();
    
    window.sendMessage = sendMessage;
    window.handleKeyPress = handleKeyPress;
  });
</script>
</body>
</html>