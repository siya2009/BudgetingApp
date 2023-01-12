package com.coding.budgetingapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.thymeleaf.spring5.SpringTemplateEngine;
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import org.thymeleaf.templateresolver.ITemplateResolver;

@Configuration
public class JspViewResolverConfig{

	
	
	@Bean
	public ViewResolver jspViewResolver() {
		
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/jsp/");
        //viewResolver.setSuffix(".jsp");
        viewResolver.setViewNames("*.jsp");
        viewResolver.setContentType("text/html");
        viewResolver.setOrder(1);
        
        return viewResolver;
    }
	
	  @Bean
	    public SpringResourceTemplateResolver springResourceTemplateResolver() {
	        return new SpringResourceTemplateResolver();
	    }
	  

	    @Bean
	    public SpringTemplateEngine thymeleafTemplateEngine() {

	        SpringTemplateEngine templateEngine = new SpringTemplateEngine();
	        templateEngine.setTemplateResolver(thymeleafTemplateResolver());
	        templateEngine.setEnableSpringELCompiler(true);

	        return templateEngine;
	    }
	
	@Bean
    public ViewResolver thymeleafViewResolver() {

        ThymeleafViewResolver viewResolver = new ThymeleafViewResolver();

        viewResolver.setTemplateEngine(thymeleafTemplateEngine());
        viewResolver.setCharacterEncoding("UTF-8");
        viewResolver.setOrder(0);
        viewResolver.setViewNames(new String[] { "*.html" });

        return viewResolver;
    }


  

    // Thymeleaf template resolver serving HTML 5
    @Bean
    public ITemplateResolver thymeleafTemplateResolver() {

        ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();

        templateResolver.setPrefix("/templates/");
        templateResolver.setCacheable(false);
        //templateResolver.setSuffix(".html");
        templateResolver.setOrder(0);
        templateResolver.setTemplateMode(TemplateMode.HTML);
        templateResolver.setCharacterEncoding("UTF-8");

        return templateResolver;
    }


}
