package com.secondchance.dao

import com.secondchance.model.Domain
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import java.sql.ResultSet
import org.springframework.dao.EmptyResultDataAccessException

class DomainMySQL @Autowired constructor(private val jdbcTemplate: JdbcTemplate) {
    inner class DomainRowMapper: RowMapper<Domain> {
        override fun mapRow(rs: ResultSet, rowNum:Int):Domain {
            return DomainMySQL.initFromRs(rs)
        }
    }
    companion object {
        fun initFromRs(rs: ResultSet): Domain {
            var domain = Domain(rs.getString("do_id"))
            domain.name = rs.getString("do_name")
            domain.enabled = rs.getBoolean("do_enabled")
            domain.awsKey = rs.getString("do_aws_key")
            domain.awsPrivateKey = rs.getString("do_aws_private_key")
            domain.s3Bucket = rs.getString("do_s3_bucket")
            domain.timezone = rs.getString("do_timezone")
            domain.s3Region = rs.getString("do_s3_region")
            domain.s3Url = rs.getString("do_s3_url")
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
}