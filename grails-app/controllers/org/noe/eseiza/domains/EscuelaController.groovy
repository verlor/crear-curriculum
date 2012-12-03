package org.noe.eseiza.domains

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])

class EscuelaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [escuelaInstanceList: Escuela.list(params), escuelaInstanceTotal: Escuela.count()]
    }

    def create() {
        [escuelaInstance: new Escuela(params)]
    }

    def save() {
        def escuelaInstance = new Escuela(params)
        if (!escuelaInstance.save(flush: true)) {
            render(view: "create", model: [escuelaInstance: escuelaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'escuela.label', default: 'Escuela'), escuelaInstance.id])
        redirect(action: "show", id: escuelaInstance.id)
    }

    def show(Long id) {
        def escuelaInstance = Escuela.get(id)
        if (!escuelaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escuela.label', default: 'Escuela'), id])
            redirect(action: "list")
            return
        }

        [escuelaInstance: escuelaInstance]
    }

    def edit(Long id) {
        def escuelaInstance = Escuela.get(id)
        if (!escuelaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escuela.label', default: 'Escuela'), id])
            redirect(action: "list")
            return
        }

        [escuelaInstance: escuelaInstance]
    }

    def update(Long id, Long version) {
        def escuelaInstance = Escuela.get(id)
        if (!escuelaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escuela.label', default: 'Escuela'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (escuelaInstance.version > version) {
                escuelaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'escuela.label', default: 'Escuela')] as Object[],
                          "Another user has updated this Escuela while you were editing")
                render(view: "edit", model: [escuelaInstance: escuelaInstance])
                return
            }
        }

        escuelaInstance.properties = params

        if (!escuelaInstance.save(flush: true)) {
            render(view: "edit", model: [escuelaInstance: escuelaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'escuela.label', default: 'Escuela'), escuelaInstance.id])
        redirect(action: "show", id: escuelaInstance.id)
    }

    def delete(Long id) {
        def escuelaInstance = Escuela.get(id)
        if (!escuelaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'escuela.label', default: 'Escuela'), id])
            redirect(action: "list")
            return
        }

        try {
            escuelaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'escuela.label', default: 'Escuela'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'escuela.label', default: 'Escuela'), id])
            redirect(action: "show", id: id)
        }
    }
}
