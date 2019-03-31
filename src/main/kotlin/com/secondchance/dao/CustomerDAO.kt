package com.secondchance.dao

import com.secondchance.model.Customer
import com.secondchance.model.User
import org.joda.time.DateTime
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import java.sql.ResultSet
import org.springframework.dao.EmptyResultDataAccessException
import org.springframework.stereotype.Component

@Component
class CustomerDAO @Autowired constructor(private val jdbcTemplate: JdbcTemplate) {
    inner class CustomerRowMapper: RowMapper<Customer> {
        override fun mapRow(rs: ResultSet, rowNum:Int):Customer {
            return CustomerDAO.initFromRs(rs)
        }
    }
    companion object {
        fun initFromRs(rs: ResultSet): Customer {
            var customer = Customer(rs.getString("c_id"))
            customer.name = rs.getString("c_name")
            customer.no = rs.getString("c_no")
            customer.status = rs.getString("c_status")
            customer.originalSalesman = User(rs.getString("c_salesman"))
            customer.salesman = User(rs.getString("c_orig_salesman"))
            customer.lastUpdateBy = User(rs.getString("c_last_update_by"))
            customer.lastUpdateTs = DateTime(rs.getTimestamp("c_last_update_ts").toInstant().toEpochMilli())

            return customer
        }
    }

    fun findById(id: String): Customer? {
        val sql = "select * from customer where c_id=?"
        var customer:Customer? = null
        try {
            customer = jdbcTemplate.queryForObject(sql, CustomerRowMapper(), id)
        } catch (e: EmptyResultDataAccessException) {

        }
        return customer
    }

    fun findByUserId(userId:String):List<Customer> {
        val sql = "select * from customer where c_salesman=? order by c_name";
        return jdbcTemplate.query(sql, CustomerRowMapper(), userId)
    }


}