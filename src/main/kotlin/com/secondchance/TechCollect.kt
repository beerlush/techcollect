package com.secondchance

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.jdbc.DataSourceBuilder
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer
import org.springframework.context.annotation.Bean
import org.springframework.core.env.Environment
import javax.sql.DataSource

@SpringBootApplication
class TechCollect : SpringBootServletInitializer() {
    @Autowired
    lateinit var environment: Environment
    @Bean
    fun datasource(): DataSource {
        var url =environment.getProperty("spring.datasource.url");
        if (System.getProperty("RDS_HOSTNAME") != null) {
            url = "jdbc:mysql://" + System.getProperty("RDS_HOSTNAME", "localhost") + ":" +
                    System.getProperty("RDS_DB_PORT", "3306") + "/" +
                    System.getProperty("RDS_DB_NAME", "techcollect") + "?useSSL=false";
        }

        return DataSourceBuilder
            .create()
            .username(System.getProperty("RDS_USERNAME") ?: environment.getProperty("spring.datasource.username"))
            .password(System.getProperty("RDS_PASSWORD") ?: environment.getProperty("spring.datasource.password"))
            .url(url)
            .build()
    }
}