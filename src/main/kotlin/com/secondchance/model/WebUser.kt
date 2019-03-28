package com.secondchance.model

class WebUser(var id: String) {
    var name: String = ""
    var enabled: Boolean = true
    var awsKey: String = ""
    var awsPrivateKey: String = ""
    var s3Bucket: String = ""
    var timezone: String = ""
    var s3Url: String = ""
    var s3Region: String = ""
}