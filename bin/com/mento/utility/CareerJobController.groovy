package com.mento.utility

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CareerJobController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CareerJob.list(params), model:[careerJobCount: CareerJob.count()]
    }

    def show(CareerJob careerJob) {
        respond careerJob
    }

    def create() {
        respond new CareerJob(params)
    }

    @Transactional
    def save(CareerJob careerJob) {
        if (careerJob == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (careerJob.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond careerJob.errors, view:'create'
            return
        }

        careerJob.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'careerJob.label', default: 'CareerJob'), careerJob.id])
                redirect careerJob
            }
            '*' { respond careerJob, [status: CREATED] }
        }
    }

    def edit(CareerJob careerJob) {
        respond careerJob
    }

    @Transactional
    def update(CareerJob careerJob) {
        if (careerJob == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (careerJob.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond careerJob.errors, view:'edit'
            return
        }

        careerJob.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'careerJob.label', default: 'CareerJob'), careerJob.id])
                redirect careerJob
            }
            '*'{ respond careerJob, [status: OK] }
        }
    }

    @Transactional
    def delete(CareerJob careerJob) {

        if (careerJob == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        careerJob.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'careerJob.label', default: 'CareerJob'), careerJob.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'careerJob.label', default: 'CareerJob'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
