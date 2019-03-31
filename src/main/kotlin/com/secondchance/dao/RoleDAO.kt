package com.secondchance.dao

import com.secondchance.model.Role
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import java.sql.ResultSet
import org.springframework.dao.EmptyResultDataAccessException
import org.springframework.stereotype.Component

@Component
class RoleDAO @Autowired constructor(private val jdbcTemplate: JdbcTemplate) {
    inner class RoleRowMapper: RowMapper<Role> {
        override fun mapRow(rs: ResultSet, rowNum:Int): Role {
            return RoleDAO.initFromRs(rs)
        }
    }
    companion object {
        fun initFromRs(rs: ResultSet): Role {
            var role = Role(rs.getString("r_id"))
            role.name = rs.getString("r_name")
            return role
        }
    }

    fun findById(id: String): Role {
        val sql = "select * from domain where do_id=?"
        var role:Role? = null
        try {
            role = jdbcTemplate.queryForObject(sql, RoleRowMapper(), id)
        } catch (e: EmptyResultDataAccessException) {

        }
        return role ?: Role("")
    }

    fun findByUserId(userId:String):List<Role> {
        val sql = "select * from role where r_name not in ('SysAdmin','DomainAdmin') and r_id in (select ur_r_id from user_role where ur_u_id=?) order by r_name"
        return jdbcTemplate.query(sql, RoleRowMapper(), userId)
    }
}