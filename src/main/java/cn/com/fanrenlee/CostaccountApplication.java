package cn.com.fanrenlee;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
@MapperScan("cn.com.fanrenlee.auth.dao")
public class CostaccountApplication{
	
	public static void main(String[] args) {
		SpringApplication.run(CostaccountApplication.class, args);
	}
}