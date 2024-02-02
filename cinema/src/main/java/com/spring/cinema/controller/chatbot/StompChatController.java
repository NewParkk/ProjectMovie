package com.spring.cinema.controller.chatbot;


import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.spring.cinema.model.ChatBotMessage;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class StompChatController {

    private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달


    
    @MessageMapping(value = "/chatbot/enter")
    public void enterChatBot(ChatBotMessage message){
    	log.info("StompChatController : enterChatBot()");
        template.convertAndSend("/sub/chatbot" + message.getMessage(), message);
    }
    
    @MessageMapping(value = "/chatbot/message")
    public void messageChatBot(ChatBotMessage message){
    	log.info("StompChatController : messageChatBot()");
    	
    	String menu = "";
		switch (message.getMessage()) {
		case "1":
			menu = "1.로그인 -> 2.영화 예매 -> 3.장소,시간 선택 -> 4. 영화 예매하기 ";
			break;
		case "2":
			menu = "1.회원 가입 버튼 클릭 -> 2.개인 정보 입력 -> 3.회원 가입 -> 4. 로그인";
			break;
		case "3":
			menu = "고객님의 아이디 중복 혹은 생년월일을 'YYYYMMDD' 방식으로 '-'를 제거하고 작성해주세요" ;
			break;
		case "4":
			menu = "고객센터는 000-123-456 으로 문의 주세요";
			break;
		default:
			menu = "선택한 번호는 없는 메뉴입니다. 다시 입력해주세요.";
			break;
		}
    	
    	message.setMessage(menu);
        template.convertAndSend("/sub/chatbot/message", message);
    }
}