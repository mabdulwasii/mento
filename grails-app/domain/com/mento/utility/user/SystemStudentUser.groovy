package com.mento.utility.user

import com.mento.utility.CareerJob
import com.mento.utility.Interest

class SystemStudentUser {

    Date dateCreated
    Date lastUpdated
    String username
    String title
    String firstName
    String middleName
    String lastName
    Date birthDate
    String gender
    String email
    String martialStatus

    String address
    String phone

    String bio
    String primarySchool
    String secondarySchool
    String prospectSchool
    CareerJob ambition

    static hasMany = [hobbies: Interest]


    byte[] photo
    static mapping = {
        photo type: "binary" // or "blob"?
    }


    static constraints = {
        title nullable: true, blank: true
        firstName nullable: true, size: 0..50
        middleName nullable: true, size: 0..50
        lastName nullable: true, size: 0..50
        email nullable: true, email: true, notEqual: "bill@microsoft.com"
        gender nullable: true, inList: ["Male", "Female"]
        martialStatus nullable: true, blank: true
        birthDate nullable: true, max: new Date()
        photo(maxSize: 2048000, blank: true, minsize: 1) // 250kb
        ambition nullable: true, blank: true
        address nullable: true, blank: true
        phone nullable: true, blank: true
        bio nullable: true, blank: true
        primarySchool nullable: true, blank: true
        secondarySchool nullable: true, blank: true
        prospectSchool nullable: true, blank: true
        hobbies nullable: true, blank: true

    }
}
