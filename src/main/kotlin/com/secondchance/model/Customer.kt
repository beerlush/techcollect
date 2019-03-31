package com.secondchance.model

import org.joda.time.DateTime

data class Customer(var id: String?) {
    var name:String = ""
    var no:String = ""
    var status:String = ""
    var salesman:User? = null
    var originalSalesman:User? = null
    var lastUpdateTs: DateTime? = null
    var lastUpdateBy:User? = null
    var primaryAddress:Address? = null

    var addresses:List<Address>? = null
}