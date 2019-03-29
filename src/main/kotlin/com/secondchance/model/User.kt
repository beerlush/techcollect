package com.secondchance.model

import java.time.LocalDateTime

data class User(var id:String?) {
    var active:Boolean = false
    var email: String = ""
    var password:String = ""
    var lastLogin: LocalDateTime = LocalDateTime.MIN
    var domain: Domain? = null
    var num:String = ""
    var firstName:String = ""
    var lastName:String = ""
    var alias:String = ""
    var security:Int = 0
    var title:String = ""
    var quota:Float = Float.MIN_VALUE
    var phone:String = ""

    var domains:List<Domain> = ArrayList<Domain>()
}