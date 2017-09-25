package com.mento.utility.user

class SystemAcademyOfficerUser {

    Date dateCreated
    Date lastUpdated
    String username
    String title
    String firstName
    String middleName
    String lastName
    Integer age
    Date birthDate
    String gender
    String email
    String martialStatus
    String address
    String contact
    String position

    byte[] photo
    static mapping = {
        photo type: "binary" // or "blob"?
    }

    static constraints = {
        title inList: ["Mr.", "Mrs.", 'Dr.', 'Dr. Mrs.', 'Prof.']
        firstName nullable: true, size: 0..50
        middleName nullable: true, size: 0..50
        lastName nullable: true, size: 0..50
        email nullable: true, email: true, notEqual: "bill@microsoft.com"
        age nullable: true, range: 0..150
        gender nullable: true, inList: ["Male", "Female"]
        martialStatus nullable: true, inList: ["Single", "Married"]
        birthDate nullable: true, max: new Date()
        address blank: true, nullable: true
        contact blank: true, nullable: true
        photo(maxSize: 2048000, blank: true, minsize: 1) // 250kb
    }
}
