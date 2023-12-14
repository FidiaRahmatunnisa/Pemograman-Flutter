package com.fidia.mataKuliah;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.fidia.mataKuliah")
public class MataKuliahApplication {

	public static void main(String[] args) {
		SpringApplication.run(MataKuliahApplication.class, args);
	}

}
