package fr.istic.tpjpa2024_spring;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@OpenAPIDefinition(info = @Info(title = "User API", version = "1.0", description = "Documentation for User API"))
public class Tpjpa2024SpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(Tpjpa2024SpringApplication.class, args);
	}

}
