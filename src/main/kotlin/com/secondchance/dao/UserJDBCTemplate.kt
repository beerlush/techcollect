package com.secondchance.dao

import com.secondchance.model.Domain
import com.secondchance.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import java.sql.ResultSet
import org.springframework.dao.EmptyResultDataAccessException
import org.springframework.stereotype.Component
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId

@Component
class UserJDBCTemplate @Autowired constructor(private val jdbcTemplate: JdbcTemplate) {
    inner class UserRowMapper: RowMapper<User> {
        override fun mapRow(rs: ResultSet, rowNum:Int):User {
            return UserJDBCTemplate.initFromRs(rs)
        }
    }

    companion object {
        fun initFromRs(rs: ResultSet): User {
            var user = User(rs.getString("u_id"))
            user.lastName = rs.getString("u_last_name")
            user.firstName = rs.getString("u_first_name")
            user.password = rs.getString("u_password")
            user.active = rs.getBoolean("u_active")
            user.email = rs.getString("u_email")
            user.lastLogin = Instant.ofEpochMilli(rs.getLong("u_last_login"))
                    .atZone(ZoneId.systemDefault()).toLocalDateTime()
            user.num = rs.getString("u_num")
            user.phone = rs.getString("u_phone")
            user.quota = rs.getFloat("u_quota")
            user.title = rs.getString("u_title")
            user.security = rs.getInt("u_security")
            user.alias = rs.getString("u_alias")
            return user
        }
    }

    fun findById(id: String): User? {
        val sql = "select * from `user` where u_id=?"
        var user:User? = null
        try {
            user = jdbcTemplate.queryForObject(sql, UserRowMapper(), id)
        } catch (e: EmptyResultDataAccessException) {

        }
        return user
    }

    fun findByEmail(email: String): User? {
        val sql = "select * from `user` where u_email=?"
        var user:User? = null
        try {
            user = jdbcTemplate.queryForObject(sql, UserRowMapper(), email)
        } catch (e: EmptyResultDataAccessException) {

        }
        return user
    }
}