package com.mento.event

class Event {

    String title
    String location
    Integer price
    Date eventDate
    Date lastUpdated
    Boolean isInterested


    static constraints = {
        title blank: true, nullable: true
        location blank: true, nullable: true
        price blank: true, nullable: true, min: 1
        eventDate blank: true, nullable: true
        isInterested blank: true, nullable: true
    }
}
