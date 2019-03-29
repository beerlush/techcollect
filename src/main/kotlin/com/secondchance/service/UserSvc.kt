package com.secondchance.service

import com.secondchance.dao.DomainJDBCTemplate
import com.secondchance.dao.UserJDBCTemplate
import com.secondchance.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service


@Service
class UserSvc @Autowired constructor(
        private val domainDAO: DomainJDBCTemplate,
        private val userDAO: UserJDBCTemplate) {

    fun getUser(user: User): User? {
        // first lookup by user
        var thisUser:User? = userDAO.findByEmail(user.email)
        if (thisUser != null) {
            // what domains are associated?
            thisUser.domains = domainDAO.findByUserId(thisUser.id ?: "")
        }
        return thisUser
    }

    fun updateUser(user:User) {

    }
}