package com.mento.school

class School {

    String name
    String type
    String yearFounded
    String website
    String email
    String owner
    String phoneNumber
    String address
    Integer noOfStudent
    Integer noOfApplication

   /* static searchable = {
        except = ['yearFounded', 'phone', 'address', 'noOfApplication', 'noOfStudent']
    }
*/

    static constraints = {
        name blank: true, nullable: true
        type blank: true, nullable: true
        yearFounded blank: true, nullable: true
        noOfStudent blank: true, nullable: true
        noOfApplication blank: true, nullable: true
        phoneNumber blank: true, nullable: true
        address blank: true, nullable: true
        email blank: true, nullable: true
        owner blank: true, nullable: true
        website blank: true, nullable: true
    }
}
