package com.secondchance

import com.secondchance.model.User
import com.secondchance.service.UserSvc
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.stereotype.Component
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.crypto.bcrypt.BCrypt
import java.time.LocalDateTime

@Component
class TechCollectAuthenticationProvider @Autowired constructor(
        private val userSvc:UserSvc) : AuthenticationProvider {


    override fun authenticate(authentication: Authentication?): Authentication? {
        val password = authentication?.credentials.toString()
        var user:User = User(null)
        user.password = password

        authentication?.getName()?.let{
            user.email = it
        }
        var thisUser:User? = userSvc.getUser(user)
        if (thisUser != null) {
            if (BCrypt.checkpw(password, thisUser.password)) {
                thisUser.lastLogin = LocalDateTime.now()
                userSvc.updateUser(thisUser)
                return UsernamePasswordAuthenticationToken(thisUser, password, java.util.ArrayList<GrantedAuthority>())
            }
        }
        return null
    }

    override fun supports(authentication: Class<*>?): Boolean {
        return authentication == UsernamePasswordAuthenticationToken::class.java
    }
}