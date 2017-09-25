package com.mento.utility.user

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SystemCounsellorUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SystemCounsellorUser.list(params), model:[systemCounsellorUserCount: SystemCounsellorUser.count()]
    }

    def show(SystemCounsellorUser systemCounsellorUser) {
        respond systemCounsellorUser
    }

    def create() {
        respond new SystemCounsellorUser(params)
    }

    @Transactional
    def save(SystemCounsellorUser systemCounsellorUser) {
        if (systemCounsellorUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemCounsellorUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemCounsellorUser.errors, view:'create'
            return
        }

        systemCounsellorUser.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'systemCounsellorUser.label', default: 'SystemCounsellorUser'), systemCounsellorUser.id])
                redirect systemCounsellorUser
            }
            '*' { respond systemCounsellorUser, [status: CREATED] }
        }
    }

    def edit(SystemCounsellorUser systemCounsellorUser) {
        respond systemCounsellorUser
    }

    @Transactional
    def update(SystemCounsellorUser systemCounsellorUser) {
        if (systemCounsellorUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemCounsellorUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemCounsellorUser.errors, view:'edit'
            return
        }

        systemCounsellorUser.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'systemCounsellorUser.label', default: 'SystemCounsellorUser'), systemCounsellorUser.id])
                redirect systemCounsellorUser
            }
            '*'{ respond systemCounsellorUser, [status: OK] }
        }
    }

    @Transactional
    def delete(SystemCounsellorUser systemCounsellorUser) {

        if (systemCounsellorUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        systemCounsellorUser.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemCounsellorUser.label', default: 'SystemCounsellorUser'), systemCounsellorUser.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemCounsellorUser.label', default: 'SystemCounsellorUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
