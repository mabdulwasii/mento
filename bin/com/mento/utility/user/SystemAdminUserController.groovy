package com.mento.utility.user

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SystemAdminUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SystemAdminUser.list(params), model:[systemAdminUserCount: SystemAdminUser.count()]
    }

    def show(SystemAdminUser systemAdminUser) {
        respond systemAdminUser
    }

    def create() {
        respond new SystemAdminUser(params)
    }

    @Transactional
    def save(SystemAdminUser systemAdminUser) {
        if (systemAdminUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemAdminUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemAdminUser.errors, view:'create'
            return
        }

        systemAdminUser.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'systemAdminUser.label', default: 'SystemAdminUser'), systemAdminUser.id])
                redirect systemAdminUser
            }
            '*' { respond systemAdminUser, [status: CREATED] }
        }
    }

    def edit(SystemAdminUser systemAdminUser) {
        respond systemAdminUser
    }

    @Transactional
    def update(SystemAdminUser systemAdminUser) {
        if (systemAdminUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemAdminUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemAdminUser.errors, view:'edit'
            return
        }

        systemAdminUser.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'systemAdminUser.label', default: 'SystemAdminUser'), systemAdminUser.id])
                redirect systemAdminUser
            }
            '*'{ respond systemAdminUser, [status: OK] }
        }
    }

    @Transactional
    def delete(SystemAdminUser systemAdminUser) {

        if (systemAdminUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        systemAdminUser.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemAdminUser.label', default: 'SystemAdminUser'), systemAdminUser.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemAdminUser.label', default: 'SystemAdminUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
