package com.krimag.gamifiedSystemsDevelopment;

import io.camunda.zeebe.client.ZeebeClient;
import io.camunda.zeebe.spring.client.EnableZeebeClient;
import io.camunda.zeebe.spring.client.annotation.Deployment;
import io.camunda.zeebe.spring.client.annotation.ZeebeDeployment;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
@EnableZeebeClient
@ZeebeDeployment(resources = {
		"classpath:bpmn/determineUsabilityCharacteristics.bpmn",
		"classpath:bpmn/usabilityRecommendationsForGamifiedSystem.dmn"
})
public class GamifiedSystemsDevelopmentApplication {

	public static void main(String[] args) {
		SpringApplication.run(GamifiedSystemsDevelopmentApplication.class, args);
	}

	@Bean(destroyMethod = "close")
	public ZeebeClient zeebeClient() {
		return ZeebeClient.newClientBuilder()
				.gatewayAddress("127.0.0.1:26500")
				.usePlaintext() // key for local dev
				.build();
	}

	@Bean
	public CommandLineRunner testZeebe(ZeebeClient zeebe) {
		return args -> {
			var topology = zeebe.newTopologyRequest().send().join();
			System.out.println("✅ Connected to Zeebe! Brokers: " + topology.getBrokers().size());
		};
	}

	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**").allowedOrigins("http://localhost:3000");
			}
		};
	}
}
