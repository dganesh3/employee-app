package com.jsp.employee_app_prc.config;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages ="com.jsp.employee_app_prc")
public class EmployeeConfig {

	@Bean
	public EntityManager getEntityManager()
	{
		return Persistence.createEntityManagerFactory("employee").createEntityManager();
	}
	 @Bean
	    public ViewResolver viewResolver() {
	        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	        resolver.setSuffix(".jsp");
	        return resolver;
	    }
}
