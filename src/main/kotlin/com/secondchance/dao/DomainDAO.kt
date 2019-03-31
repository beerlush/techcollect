package com.secondchance.dao

import com.secondchance.model.Domain
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import java.sql.ResultSet
import org.springframework.dao.EmptyResultDataAccessException
import org.springframework.stereotype.Component

@Component
class DomainDAO @Autowired constructor(private val jdbcTemplate: JdbcTemplate) {
    inner class DomainRowMapper: RowMapper<Domain> {
        override fun mapRow(rs: ResultSet, rowNum:Int):Domain {
            return DomainDAO.initFromRs(rs)
        }
    }
    companion object {
        fun initFromRs(rs: ResultSet): Domain {
            var domain = Domain(rs.getString("d_id"))
            domain.name = rs.getString("d_name")
            domain.active = rs.getBoolean("d_active")
            domain.timezone = rs.getString("d_timezone")
            return domain
        }
    }

    fun findById(id: String): Domain {
        val sql = "select * from domain where do_id=?"
        var domain:Domain? = null
        try {
            domain = jdbcTemplate.queryForObject(sql, DomainRowMapper(), id)
        } catch (e: EmptyResultDataAccessException) {

        }
        return domain ?: Domain("")
    }

    fun findByUserId(userId:String):List<Domain> {
        val sql = "select * from domain where d_id in (select du_d_id from domain_user where du_u_id=?) order by d_name";
        return jdbcTemplate.query(sql, DomainRowMapper(), userId)
    }
}