package com.mento.school

import com.mento.utility.CareerJob
import com.mento.utility.Industry
import com.mento.utility.Interest
import com.mento.utility.Subject

class Course {

    Date dateCreated = new Date()
    String name
    Integer jambScore
    String description
    Integer maxNumberOfStudent

    static hasMany = [jambSubjects  : Subject,
                      olevelSubjects: Subject,
                      schools       : School,
                      interests     : Interest,
                      careerJobs    : CareerJob,
                      industries    : Industry]

    static mapping = {
        sort name: 'asc'
    }

    static constraints = {
        name blank: true, nullable: true
        jambScore blank: true, nullable: true, min: 120
        description blank: true, nullable: true, minSize: 100, maxSize: 5000
        jambSubjects blank: true, nullable: true, maxSize: 4
        olevelSubjects blank: true, nullable: true, minSize: 5
        interests blank: true, nullable: true
        careerJobs blank: true, nullable: true
        industries blank: true, nullable: true

    }
}
