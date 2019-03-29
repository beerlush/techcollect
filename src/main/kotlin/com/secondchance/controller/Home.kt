package com.secondchance.controller

import com.secondchance.service.UserSvc
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model

@Controller
class Home @Autowired constructor(private val userSvc: UserSvc) {

    @RequestMapping(value="/login", method=arrayOf(RequestMethod.GET))
    fun loginAction(): String {
        return "login"
    }

    @RequestMapping("/login-error", method=arrayOf(RequestMethod.GET))
    fun loginError(model: Model): String {
        model.addAttribute("loginError", true)
        return "login"
    }

    @RequestMapping("/", method=arrayOf(RequestMethod.GET))
    fun home(): String {
        return "index"
    }
}