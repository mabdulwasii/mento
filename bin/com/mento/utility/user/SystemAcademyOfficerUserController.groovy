package com.mento.utility.user

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SystemAcademyOfficerUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SystemAcademyOfficerUser.list(params), model:[systemAcademyOfficerUserCount: SystemAcademyOfficerUser.count()]
    }

    def show(SystemAcademyOfficerUser systemAcademyOfficerUser) {
        respond systemAcademyOfficerUser
    }

    def create() {
        respond new SystemAcademyOfficerUser(params)
    }

    @Transactional
    def save(SystemAcademyOfficerUser systemAcademyOfficerUser) {
        if (systemAcademyOfficerUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemAcademyOfficerUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemAcademyOfficerUser.errors, view:'create'
            return
        }

        systemAcademyOfficerUser.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'systemAcademyOfficerUser.label', default: 'SystemAcademyOfficerUser'), systemAcademyOfficerUser.id])
                redirect systemAcademyOfficerUser
            }
            '*' { respond systemAcademyOfficerUser, [status: CREATED] }
        }
    }

    def edit(SystemAcademyOfficerUser systemAcademyOfficerUser) {
        respond systemAcademyOfficerUser
    }

    @Transactional
    def update(SystemAcademyOfficerUser systemAcademyOfficerUser) {
        if (systemAcademyOfficerUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemAcademyOfficerUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemAcademyOfficerUser.errors, view:'edit'
            return
        }

        systemAcademyOfficerUser.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'systemAcademyOfficerUser.label', default: 'SystemAcademyOfficerUser'), systemAcademyOfficerUser.id])
                redirect systemAcademyOfficerUser
            }
            '*'{ respond systemAcademyOfficerUser, [status: OK] }
        }
    }

    @Transactional
    def delete(SystemAcademyOfficerUser systemAcademyOfficerUser) {

        if (systemAcademyOfficerUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        systemAcademyOfficerUser.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemAcademyOfficerUser.label', default: 'SystemAcademyOfficerUser'), systemAcademyOfficerUser.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemAcademyOfficerUser.label', default: 'SystemAcademyOfficerUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
