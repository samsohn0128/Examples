package com.example.rabbitmq;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

@Service
public class RabbitConsumer {
    @RabbitListener(queues = "example")
    public void receiveMessage(final String message){
        System.out.println(message);
    }
}
