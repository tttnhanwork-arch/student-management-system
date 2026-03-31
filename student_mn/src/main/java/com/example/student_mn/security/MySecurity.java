package com.example.student_mn.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
public class MySecurity {
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }
    @Bean
    public JdbcUserDetailsManager userDetailsManager (DataSource dataSource){
        JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager(dataSource);
        jdbcUserDetailsManager.setUsersByUsernameQuery("select username, password, enabled from users where username= ?");
        jdbcUserDetailsManager.setAuthoritiesByUsernameQuery("SELECT u.username, a.name FROM users u JOIN authorities ua ON u.id = ua.user_id JOIN authority a ON ua.authority_name = a.name WHERE u.username = ?");
        return jdbcUserDetailsManager;
    }
    @Bean
    public SecurityFilterChain securityFilterChain (HttpSecurity httpSecurity) throws Exception{
        httpSecurity.authorizeHttpRequests(
                configurer -> configurer
                        .requestMatchers("/home").hasAnyRole("ADMIN", "STUDENT", "TEACHER", "PARENT", "NURSE","USER")
                        .requestMatchers("/class/**").hasAnyRole("ADMIN", "STUDENT", "TEACHER", "PARENT", "NURSE")
                        .requestMatchers("/employee/**").hasAnyRole("ADMIN", "TEACHER", "NURSE")
                        .requestMatchers("/parent/**").hasAnyRole("ADMIN", "TEACHER","STUDENT","PARENT")
                        .requestMatchers("/reportcard/**").hasAnyRole("ADMIN", "TEACHER","STUDENT","PARENT")
                        .requestMatchers("/school/**").hasAnyRole("ADMIN", "STUDENT", "TEACHER", "PARENT", "NURSE")
                        .requestMatchers("/scoresheet/**").hasAnyRole("ADMIN", "TEACHER","STUDENT","PARENT")
                        .requestMatchers("/student/**").hasAnyRole("ADMIN", "TEACHER", "STUDENT", "PARENT", "NURSE")
                        .requestMatchers("/subject/**").hasAnyRole("ADMIN", "STUDENT", "TEACHER", "PARENT", "NURSE")
                        .anyRequest().permitAll()

        ).formLogin(form -> form.loginPage("/showLoginPage")
                .loginProcessingUrl("/authenticateTheUser")
                .defaultSuccessUrl("/home")
                .permitAll()
        ).logout(logout -> logout.permitAll()
        ).exceptionHandling(configurer -> configurer.accessDeniedPage("/showPage403"))
        ;
        return httpSecurity.build();
    }
}
