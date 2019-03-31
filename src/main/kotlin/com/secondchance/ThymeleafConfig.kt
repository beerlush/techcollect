package com.secondchance

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.ApplicationContext
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.LocaleResolver
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import org.thymeleaf.extras.springsecurity5.dialect.SpringSecurityDialect
import org.thymeleaf.spring5.templateresolver.SpringResourceTemplateResolver
import org.thymeleaf.spring5.SpringTemplateEngine
import org.thymeleaf.spring5.view.ThymeleafViewResolver
import org.thymeleaf.templateresolver.ServletContextTemplateResolver
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor
import org.springframework.web.servlet.i18n.SessionLocaleResolver
import java.util.*


@Configuration
class ThymeleafConfig @Autowired constructor(private val appCtx : ApplicationContext) : WebMvcConfigurer {
    @Bean
    fun templateEngine(): SpringTemplateEngine {
        val templateEngine = SpringTemplateEngine()
        templateEngine.setTemplateResolver(templateResolver())
        templateEngine.addDialect(SpringSecurityDialect())
        return templateEngine
    }

    @Bean
    fun templateResolver(): SpringResourceTemplateResolver {
        val templateResolver = SpringResourceTemplateResolver()
        templateResolver.setApplicationContext(appCtx)
        templateResolver.prefix = "/templates/"
        templateResolver.suffix = ".html"
        templateResolver.setTemplateMode("HTML5")
        templateResolver.setCacheable(false)
        return templateResolver
    }

    @Bean
    fun localeResolver(): LocaleResolver {
        val slr = SessionLocaleResolver()
        slr.setDefaultLocale(Locale.US)
        return slr
    }

    @Bean
    fun localeChangeInterceptor(): LocaleChangeInterceptor {
        val lci = LocaleChangeInterceptor()
        lci.paramName = "lang"
        return lci
    }

    override fun configureViewResolvers(registry:ViewResolverRegistry) {
        val viewResolver = ThymeleafViewResolver()
        viewResolver.templateEngine = templateEngine()
        registry.viewResolver(viewResolver)
    }

    override fun configurePathMatch(configurer: PathMatchConfigurer) {
        configurer.setUseRegisteredSuffixPatternMatch(true)
    }

    override fun addInterceptors(registry: InterceptorRegistry) {
        registry.addInterceptor(localeChangeInterceptor())
    }
}