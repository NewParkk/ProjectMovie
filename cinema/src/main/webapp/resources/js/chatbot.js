document.addEventListener('DOMContentLoaded', function() {
    var toggleButton = document.getElementById('toggle');
    var navMenu = document.querySelector('.nav_menu');
    toggleButton.addEventListener('click', function() {
        navMenu.classList.toggle('active');
    });
});

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
	    chatBox.scrollTop = chatBox.scrollHeight; 
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
let msgInput = document.getElementById("msg");

// 엔터 키 이벤트 처리
msgInput.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') { // 엔터 키를 눌렀을 때
        e.preventDefault(); // 기본 엔터 키 동작 방지
        sendMessage(); // 메시지 전송 함수 호출
    }
});

sendBtn.addEventListener('click', sendMessage); // 버튼 클릭 시 메시지 전송

function sendMessage() {
    var msg = msgInput.value.trim(); // 입력된 메시지 가져오기 (공백 제거)
    if (msg !== '') { // 메시지가 비어있지 않은 경우에만 전송
        var str = "<p>" + msg + "</p>";
        chatBox.appendChild(sendStringToHTML(str)); // 보낸 메시지를 화면에 추가
        stomp.send('/pub/chatbot/message', {}, JSON.stringify({message: msg})); // 메시지 전송
        msgInput.value = ''; // 입력창 비우기
    }
}