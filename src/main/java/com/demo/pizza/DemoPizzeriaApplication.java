package com.demo.pizza;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class DemoPizzeriaApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoPizzeriaApplication.class, args);
	}

}
