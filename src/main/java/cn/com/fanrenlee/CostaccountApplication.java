package cn.com.fanrenlee;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableWebMvc
@EnableTransactionManagement
public class CostaccountApplication {

	public static void main(String[] args) {
		SpringApplication.run(CostaccountApplication.class, args);
	}
}
