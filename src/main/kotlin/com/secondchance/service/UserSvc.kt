package com.secondchance.service

import com.secondchance.dao.*
import com.secondchance.model.Customer
import com.secondchance.model.User
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service


@Service
class UserSvc @Autowired constructor(
        private val domainDAO: DomainDAO,
        private val userDAO: UserDAO,
        private val addressDAO: AddressDAO,
        private val customerDAO: CustomerDAO,
        private val roleDAO: RoleDAO) {

    fun getUser(user: User): User? {
        // first lookup by user
        var thisUser:User? = userDAO.findByEmail(user.email)
        if (thisUser != null) {
            // what domains are associated?
            thisUser.domains = domainDAO.findByUserId(thisUser.id ?: "")
            thisUser.domains.forEach{
                if (it.id == thisUser.defaultDomain?.id) {
                    thisUser.defaultDomain = it
                }
            }
            thisUser.roles = roleDAO.findByUserId(thisUser.id ?: "")
            thisUser.roles.forEach{
                if (it.id == thisUser.defaultRole?.id) {
                    thisUser.defaultRole = it
                }
            }

        }
        return thisUser
    }

    fun getCustomers(user: User): List<Customer>? {
        var customers = customerDAO.findByUserId(user.id ?: "")
        customers.forEach {
            it.addresses = addressDAO.findByCustomerId(it.id ?: "")
        }
        return customers
    }

    fun updateUser(user:User) {

    }
}