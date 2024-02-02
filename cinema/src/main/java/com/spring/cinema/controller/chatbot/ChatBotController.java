package com.spring.cinema.controller.chatbot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatBotController {
	
    @GetMapping("/chatbot")
    public String moveChatBot(){

        log.info("ChatBotController, moveChatBot()");
        
        return "chatbot/chatBot";
    }
}
