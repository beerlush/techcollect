package com.secondchance

import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.stereotype.Component
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException


@Component
class TechCollectAuthenticationProvider : AuthenticationProvider {
    @Throws(AuthenticationException::class)
    override fun authenticate(authentication: Authentication): Authentication? {
        val email = authentication.getName()
        val password = authentication.getCredentials().toString()
        WebUser webUser = WebUser();

        //		WebUser webUser = new WebUser();
        //		webUser.setEmail(email);
        //        webUser.setCurrentDomain(new Domain(request.getParameter("login-domain")));
        //        webUser = domainService.getWebUser(webUser);
        //
        //        if (webUser != null) {
        //            logger.traceEntry("password: " + password);
        //            if (BCrypt.checkpw(password, webUser.getPassword())) {
        //                logger.traceEntry("password passed");
        //                webUser.setLastLogin(LocalDateTime.now());
        //                domainService.updateUser(webUser);
        //                loggerService.audit(LogEntry.LogStatus.Login, webUser.getCurrentDomain(), "Login for " + authentication.getName());
        //                logger.traceEntry("authentication created");
        //                return new UsernamePasswordAuthenticationToken(webUser, password, new ArrayList<>());
        //			}
        //		}

        return null

    }

    override fun supports(authentication: Class<*>): Boolean {
        return authentication == UsernamePasswordAuthenticationToken::class.java
    }
}