package com.mento.utility.user

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class SystemStudentUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SystemStudentUser.list(params), model: [systemStudentUserCount: SystemStudentUser.count()]
    }

    def show(SystemStudentUser systemStudentUser) {
        respond systemStudentUser
    }

    def create() {
        respond new SystemStudentUser(params)
    }

    @Transactional
    def save(SystemStudentUser systemStudentUser) {
        if (systemStudentUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemStudentUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemStudentUser.errors, view: 'create'
            return
        }

        systemStudentUser.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'systemStudentUser.label', default: 'SystemStudentUser'), systemStudentUser.id])
                redirect systemStudentUser
            }
            '*' { respond systemStudentUser, [status: CREATED] }
        }
    }

    def edit(SystemStudentUser systemStudentUser) {
        respond systemStudentUser
    }

    @Transactional
    def update(SystemStudentUser systemStudentUser) {
        if (systemStudentUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (systemStudentUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond systemStudentUser.errors, view: 'edit'
            return
        }

        systemStudentUser.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'systemStudentUser.label', default: 'SystemStudentUser'), systemStudentUser.id])
                redirect systemStudentUser
            }
            '*' { respond systemStudentUser, [status: OK] }
        }
    }

    @Transactional
    def delete(SystemStudentUser systemStudentUser) {

        if (systemStudentUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        systemStudentUser.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemStudentUser.label', default: 'SystemStudentUser'), systemStudentUser.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemStudentUser.label', default: 'SystemStudentUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
