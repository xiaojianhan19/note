package com.note.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
 
@Component
public class ConfigBeanValue {
 
    @Value("${demo.name}")
    public String name;
 
    @Value("${demo.age}")
    public String age;

}