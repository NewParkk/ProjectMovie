<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChatBot</title>
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Raleway|Ubuntu&display=swap");
body {
  background: #E8EBF5;
  padding: 0;
  margin: 0;
  font-family: Raleway;
}

.chat-box {
  height: 90%;
  width: 400px;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  margin: 0 auto;
  overflow: hidden;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  z-index: 15;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.005);
  right: 0;
  bottom: 0;
  margin: 15px;
  background: #fff;
  border-radius: 15px;
  visibility: hidden;
}
.chat-box-header {
  height: 8%;
  border-top-left-radius: 15px;
  border-top-right-radius: 15px;
  display: flex;
  font-size: 14px;
  padding: 0.5em 0;
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.2);
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.2), 0 -1px 10px rgba(172, 54, 195, 0.3);
  box-shadow: 0 1px 10px rgba(0, 0, 0, 0.025);
}
.chat-box-header h3 {
  font-family: ubuntu;
  font-weight: 400;
  float: left;
  position: absolute;
  left: 25px;
}
.chat-box-header p {
  float: right;
  position: absolute;
  right: 16px;
  cursor: pointer;
  height: 50px;
  width: 50px;
  text-align: center;
  line-height: 3.25;
  margin: 0;
}
.chat-box-body {
  height: 75%;
  background: #f8f8f8;
  overflow-y: scroll;
  padding: 12px;
}
.chat-box-body-send {
  width: 250px;
  float: right;
  background: white;
  padding: 10px 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.015);
  margin-bottom: 14px;
}
.chat-box-body-send p {
  margin: 0;
  color: #444;
  font-size: 14px;
  margin-bottom: 0.25rem;
}
.chat-box-body-send span {
  float: right;
  color: #777;
  font-size: 10px;
}
.chat-box-body-receive {
  width: 250px;
  float: left;
  background: white;
  padding: 10px 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.015);
  margin-bottom: 14px;
}
.chat-box-body-receive p {
  margin: 0;
  color: #444;
  font-size: 14px;
  margin-bottom: 0.25rem;
}
.chat-box-body-receive span {
  float: right;
  color: #777;
  font-size: 10px;
}
.chat-box-body::-webkit-scrollbar {
  width: 5px;
  opacity: 0;
}
.chat-box-footer {
  position: relative;
  display: flex;
}
.chat-box-footer button {
  border: none;
  padding: 16px;
  font-size: 14px;
  background: white;
  cursor: pointer;
}
.chat-box-footer button:focus {
  outline: none;
}
.chat-box-footer input {
  padding: 10px;
  border: none;
  -webkit-appearance: none;
  border-radius: 50px;
  background: whitesmoke;
  margin: 10px;
  font-family: ubuntu;
  font-weight: 600;
  color: #444;
  width: 280px;
}
.chat-box-footer input:focus {
  outline: none;
}
.chat-box-footer .send {
  vertical-align: middle;
  align-items: center;
  justify-content: center;
  transform: translate(0px, 20px);
  cursor: pointer;
}

.chat-button {
  padding: 25px 16px;
  background: #2C50EF;
  width: 120px;
  position: absolute;
  bottom: 0;
  right: 0;
  margin: 15px;
  border-top-left-radius: 25px;
  border-top-right-radius: 25px;
  border-bottom-left-radius: 25px;
  box-shadow: 0 2px 15px rgba(44, 80, 239, 0.21);
  cursor: pointer;
}
.chat-button span::before {
  content: "";
  height: 15px;
  width: 15px;
  background: #47cf73;
  position: absolute;
  transform: translate(0, -7px);
  border-radius: 15px;
}
.chat-button span::after {
  content: "Message Us";
  font-size: 14px;
  color: white;
  position: absolute;
  left: 50px;
  top: 18px;
}

.modal {
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  opacity: 0;
  visibility: hidden;
  transform: scale(1.1);
  transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;
}

.modal-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: white;
  padding: 1rem 1.5rem;
  width: 24rem;
  border-radius: 0.5rem;
}

.modal-close-button {
  float: right;
  width: 1.5rem;
  line-height: 1.5rem;
  text-align: center;
  cursor: pointer;
  border-radius: 0.25rem;
  background-color: lightgray;
}

.close-button:hover {
  background-color: darkgray;
}

.show-modal {
  opacity: 1;
  visibility: visible;
  transform: scale(1);
  transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
  z-index: 30;
}

@media screen only and (max-width: 450px) {
  .chat-box {
    min-width: 100% !important;
  }
}
</style>
<script src="https://kit.fontawesome.com/37dd76a909.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
<div class="chat-box">
  <div class="chat-box-header">
      <h3>Message Us</h3>
      <p>
        <i class="fa fa-times"></i> 
      </p>
  </div>
  <div id="chat-box" class="chat-box-body">
    <div class="chat-box-body-receive">
      <p>문의사항 번호를 입력해주세요.</p>
      <p>1)영화 예매 방법 2)회원 가입 방법 3)회원 가입 오류 4)고객 센터</p>
    </div>
  </div>
  <div class="chat-box-footer">
      <input id="msg" placeholder="Enter Your Message" type="text">
      <i class="send far fa-paper-plane" id="button-send"></i>
  </div>
</div>



<div class="chat-button">
  <span></span>
</div>


<div class="modal">
        <div class="modal-content">
            <span class="modal-close-button">&times;</span>
            <h1>Add What you want here.</h1>
        </div>
</div>

<script type="text/javascript">
	document.getElementsByClassName("chat-button")[0].addEventListener('click' , function(){
	  document.getElementsByClassName("chat-button")[0].style.display = "none";
	  
	  document.getElementsByClassName("chat-box")[0].style.visibility = "visible";
	});

	document.querySelector('.chat-box .chat-box-header p').addEventListener('click' , function(){
	  document.getElementsByClassName("chat-button")[0].style.display = "block";
	  document.getElementsByClassName("chat-box")[0].style.visibility = "hidden";
	})

	document.getElementsByClassName("modal-close-button")[0].addEventListener("click" , function(){
	  document.getElementByClassName("modal")[0].classList.toggle("show-modal");
	})
	
	let chatBox = document.getElementById("chat-box");
	
	var sockJs = new SockJS("/stomp/chatbot");
	var stomp = Stomp.over(sockJs);
	stomp.connect({}, function (){
	
	   stomp.subscribe("/sub/chatbot/message", function (chat) {
			var content = JSON.parse(chat.body);
			var message = content.message;
			var str = '';
			str += "<p>" + message + "</p>";
	
		    chatBox.appendChild(receiveStringToHTML(str));
	   });
	});
	
	var receiveStringToHTML = function (str) {
		  let div = document.createElement("div");
		  div.className = "chat-box-body-receive";
		  div.innerHTML = str;
		  return div;
	};
	
	var sendStringToHTML = function (str) {
		  let div = document.createElement("div");
		  div.className = "chat-box-body-send";
		  div.innerHTML = str;
		  return div;
	};

	let sendBtn = document.getElementById("button-send");
	sendBtn.addEventListener('click', (e) => { 
	
	    var msg = document.getElementById("msg");
	    var str = '';
		str += "<p>" + msg.value + "</p>";
		
	    chatBox.appendChild(sendStringToHTML(str));
	    stomp.send('/pub/chatbot/message', {}, JSON.stringify({message: msg.value}));
	    msg.value = '';
	});
</script>
</body>
</html>