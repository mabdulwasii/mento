package com.mento.utility.user

class SystemCounsellorUser {

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
    String contact
    String schoolAttended
    String profession
    String bio
    String yearsOfExperience
    String degrees
    Boolean isVerified = false

    Byte[] cv
    byte[] photo
    static mapping = {
        photo type: "binary" // or "blob"?
        cv type: "blob" // or "blob"?
    }

    static constraints = {
        title nullable: true, blank: true
        firstName nullable: true,size: 0..50
       lastName nullable: true,size: 0..50
        email nullable: true,email: true, notEqual: "bill@microsoft.com"
        gender nullable: true,inList: ["Male", "Female"]
        martialStatus nullable: true,inList: ["Single", "Married"]
        birthDate nullable: true, max: new Date()
        address blank: true, nullable: true
        contact blank: true, nullable: true

        schoolAttended blank: true, nullable: true
        profession blank: true, nullable: true
        bio blank: true, nullable: true, minSize: 200
        yearsOfExperience blank: true, nullable: true
        cv maxSize: 2048000, blank:true, minsize: 1
        middleName nullable: true,size: 0..50
        photo(maxSize: 2048000, blank:true, minsize: 1) // 250kb
    }
}
