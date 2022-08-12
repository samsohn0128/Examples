package com.example.redis.repository;

import com.example.redis.entity.Person;
import org.springframework.data.repository.CrudRepository;

public interface PersonRedisRepository extends CrudRepository<Person, String> {
    
}
