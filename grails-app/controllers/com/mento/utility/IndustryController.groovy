package com.mento.utility

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class IndustryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Industry.list(params), model: [industryCount: Industry.count()]
    }

    def show(Industry industry) {
        respond industry
    }

    def create() {
        respond new Industry(params)
    }

    @Transactional
    def save(Industry industry) {
        if (industry == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (industry.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond industry.errors, view: 'create'
            return
        }

        industry.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'industry.label', default: 'Industry'), industry.id])
                redirect industry
            }
            '*' { respond industry, [status: CREATED] }
        }
    }

    def edit(Industry industry) {
        respond industry
    }

    @Transactional
    def update(Industry industry) {
        if (industry == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (industry.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond industry.errors, view: 'edit'
            return
        }

        industry.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'industry.label', default: 'Industry'), industry.id])
                redirect industry
            }
            '*' { respond industry, [status: OK] }
        }
    }

    @Transactional
    def delete(Industry industry) {

        if (industry == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        industry.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'industry.label', default: 'Industry'), industry.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'industry.label', default: 'Industry'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
