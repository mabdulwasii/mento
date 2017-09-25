package com.mento.event

class Request {

    String title
    String location
    String description
    Date eventDate
    Integer proposedNoOfDays

    static constraints = {
        title blank: true, nullable: true
        location blank: true, nullable: true
        eventDate blank: true, nullable: true
        proposedNoOfDays blank: true, nullable: true
        description blank: true, nullable: true
    }
}
