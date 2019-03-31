package com.secondchance.controller

import com.secondchance.model.User
import com.secondchance.service.UserSvc
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model

@Controller
class Home @Autowired constructor(private val userSvc: UserSvc) {

    @RequestMapping("/login")
    fun loginAction(): String {
        return "login"
    }

    @RequestMapping("/login-error")
    fun loginError(model: Model): String {
        model.addAttribute("loginError", true)
        return "login"
    }

    @RequestMapping("/")
    fun home(model: Model): String {
        val user = SecurityContextHolder.getContext().authentication.principal as User
        if (user.defaultRole?.name == "Sales") {
            model.addAttribute("customers", userSvc.getCustomers(user))
            return "sales"
        } else if (user.defaultRole?.name == "Agent") {

        } else {

        }
        return "index"
    }

    @RequestMapping("/logout")
    fun logout(): String {
        return "login"
    }
}