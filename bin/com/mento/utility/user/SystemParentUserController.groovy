package com.mento.utility.user

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SystemParentUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SystemParentUser.list(params), model:[systemParentUserCount: SystemParentUser.count()]
    }

    def show(SystemParentUser systemParentUser) {
        respond systemParentUser
    }

    def create() {
        respond new SystemParentUser(params)
    }

    @Transactional
    def save(SystemParentUser systemParentUser) {
        if (systemParentUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemParentUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemParentUser.errors, view:'create'
            return
        }

        systemParentUser.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'systemParentUser.label', default: 'SystemParentUser'), systemParentUser.id])
                redirect systemParentUser
            }
            '*' { respond systemParentUser, [status: CREATED] }
        }
    }

    def edit(SystemParentUser systemParentUser) {
        respond systemParentUser
    }

    @Transactional
    def update(SystemParentUser systemParentUser) {
        if (systemParentUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemParentUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemParentUser.errors, view:'edit'
            return
        }

        systemParentUser.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'systemParentUser.label', default: 'SystemParentUser'), systemParentUser.id])
                redirect systemParentUser
            }
            '*'{ respond systemParentUser, [status: OK] }
        }
    }

    @Transactional
    def delete(SystemParentUser systemParentUser) {

        if (systemParentUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        systemParentUser.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemParentUser.label', default: 'SystemParentUser'), systemParentUser.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemParentUser.label', default: 'SystemParentUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
