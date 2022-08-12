package com.example.redis;

import com.example.redis.entity.Person;
import com.example.redis.repository.PersonRedisRepository;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class RedisRepositoryTest {

    Logger logger = LoggerFactory.getLogger(RedisRepositoryTest.class);

    @Autowired
    private PersonRedisRepository personRedisRepository;

    @Test
    void personTest() {
        Person person = new Person("Park", 20);

        // 저장
        personRedisRepository.save(person);

        // `keyspace:id` 값을 가져옴
        Person tempPerson = personRedisRepository.findById(person.getId()).orElseThrow();
        logger.info("tempPerson = {}", tempPerson);

        long count = personRedisRepository.count();
        logger.info("count = {}", count);
    }
}
