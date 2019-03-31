package com.secondchance

import org.springframework.context.annotation.Configuration
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter

@Configuration
@EnableWebSecurity
class SpringSecurityConfig constructor(private val authProvider: AuthenticationProvider) : WebSecurityConfigurerAdapter() {
    override fun configure(auth: AuthenticationManagerBuilder) {
        auth.authenticationProvider(authProvider)
    }
    override fun configure(http: HttpSecurity) {
        http
            .csrf().disable()
            .formLogin()
            .loginPage("/login")
            .failureUrl("/login-error")
            .permitAll()
            .and()
            .authorizeRequests()
            .antMatchers(
                "/css/**",
                "/js/**",
                "/images/**",
                "/fonts/**"
            ).permitAll()
            .anyRequest().authenticated()
            .and()
            .logout()
            .logoutUrl("/logout")
    }
}