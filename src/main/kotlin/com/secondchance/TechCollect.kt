package com.secondchance

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.Banner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.autoconfigure.web.servlet.WebMvcProperties
import org.springframework.boot.jdbc.DataSourceBuilder
import org.springframework.context.annotation.Bean
import org.springframework.core.env.Environment
import javax.sql.DataSource
import org.springframework.security.crypto.bcrypt.BCrypt
import org.springframework.boot.runApplication
import java.util.Locale
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor
import java.time.Instant


@SpringBootApplication
class TechCollect {
    @Autowired
    lateinit var environment: Environment

    @Bean
    fun datasource(): DataSource {
        var url = environment.getProperty("spring.datasource.url");
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

fun main(args: Array<String>) {
    System.out.println(BCrypt.hashpw("tester", BCrypt.gensalt()))

    runApplication<TechCollect>(*args) {
        setBannerMode(Banner.Mode.OFF)
    }
}
