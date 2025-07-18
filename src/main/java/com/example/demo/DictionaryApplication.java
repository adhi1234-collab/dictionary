package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class DictionaryApplication extends SpringBootServletInitializer {

    // This method is required for WAR deployment
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(DictionaryApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(DictionaryApplication.class, args);
    }
}
