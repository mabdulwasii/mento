package com.mento.school

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class CourseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 6, 100)
        respond Course.list(params), model: [departmentCount: Course.count()]
    }

    def show(Course department) {
        respond department
    }

    def create() {
        respond new Course(params)
    }

    @Transactional
    def save(Course department) {
        if (department == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (department.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond department.errors, view: 'create'
            return
        }

        department.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), department.id])
                redirect department
            }
            '*' { respond department, [status: CREATED] }
        }
    }

    def edit(Course department) {
        respond department
    }

    @Transactional
    def update(Course department) {
        if (department == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (department.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond department.errors, view: 'edit'
            return
        }

        department.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), department.id])
                redirect department
            }
            '*' { respond department, [status: OK] }
        }
    }

    @Transactional
    def delete(Course department) {

        if (department == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        department.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'course.label', default: 'Course'), department.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
