package com.mento.logic

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_COUNSELLOR"])
class CounsellorController {
    def springSecurityService

    def index() {
        def user = springSecurityService.currentUser

        render view: 'index', model: [user: user]
    }
}
