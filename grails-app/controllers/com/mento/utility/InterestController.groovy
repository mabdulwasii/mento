package com.mento.utility

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class InterestController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Interest.list(params), model: [interestCount: Interest.count()]
    }

    def show(Interest interest) {
        respond interest
    }

    def create() {
        respond new Interest(params)
    }

    @Transactional
    def save(Interest interest) {
        if (interest == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (interest.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond interest.errors, view: 'create'
            return
        }

        interest.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'interest.label', default: 'Interest'), interest.id])
                redirect interest
            }
            '*' { respond interest, [status: CREATED] }
        }
    }

    def edit(Interest interest) {
        respond interest
    }

    @Transactional
    def update(Interest interest) {
        if (interest == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (interest.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond interest.errors, view: 'edit'
            return
        }

        interest.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'interest.label', default: 'Interest'), interest.id])
                redirect interest
            }
            '*' { respond interest, [status: OK] }
        }
    }

    @Transactional
    def delete(Interest interest) {

        if (interest == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        interest.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'interest.label', default: 'Interest'), interest.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'interest.label', default: 'Interest'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
