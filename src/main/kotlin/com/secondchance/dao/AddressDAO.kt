package com.secondchance.dao

import com.secondchance.model.Address
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.dao.EmptyResultDataAccessException
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.RowMapper
import org.springframework.stereotype.Component
import java.sql.ResultSet

@Component
class AddressDAO @Autowired constructor(private val jdbcTemplate: JdbcTemplate) {
    inner class AddressRowMapper: RowMapper<Address> {
        override fun mapRow(rs: ResultSet, rowNum:Int): Address {
            return AddressDAO.initFromRs(rs)
        }
    }
    companion object {
        fun initFromRs(rs: ResultSet): Address {
            var address = Address(rs.getString("ad_id"))
            address.name = rs.getString("ad_name")
            address.line1 = rs.getString("ad_line_1")
            address.line2 = rs.getString("ad_line_2")
            address.city = rs.getString("ad_city")
            address.state = rs.getString("ad_state")
            address.postal = rs.getString("ad_postal")
            address.type  = rs.getString("ad_type")
            return address
        }
    }

    fun findById(id: String): Address {
        val sql = "select * from domain where do_id=?"
        var addr:Address? = null
        try {
            addr = jdbcTemplate.queryForObject(sql, AddressRowMapper(), id)
        } catch (e: EmptyResultDataAccessException) {

        }
        return addr ?: Address("")
    }

    fun findByCustomerId(customerId:String):List<Address> {
        val sql = "select * from address where ad_id in (select ca_ad_id from customer_address where ca_c_id=? )order by ad_name";
        return jdbcTemplate.query(sql, AddressRowMapper(), customerId)
    }
}
