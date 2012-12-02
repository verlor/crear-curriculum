package org.noe.eseiza.domains

import org.springframework.dao.DataIntegrityViolationException

class LogroController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [logroInstanceList: Logro.list(params), logroInstanceTotal: Logro.count()]
    }

    def create() {
        [logroInstance: new Logro(params)]
    }

    def save() {
        def logroInstance = new Logro(params)
        if (!logroInstance.save(flush: true)) {
            render(view: "create", model: [logroInstance: logroInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'logro.label', default: 'Logro'), logroInstance.id])
        redirect(action: "show", id: logroInstance.id)
    }

    def show(Long id) {
        def logroInstance = Logro.get(id)
        if (!logroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logro.label', default: 'Logro'), id])
            redirect(action: "list")
            return
        }

        [logroInstance: logroInstance]
    }

    def edit(Long id) {
        def logroInstance = Logro.get(id)
        if (!logroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logro.label', default: 'Logro'), id])
            redirect(action: "list")
            return
        }

        [logroInstance: logroInstance]
    }

    def update(Long id, Long version) {
        def logroInstance = Logro.get(id)
        if (!logroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logro.label', default: 'Logro'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (logroInstance.version > version) {
                logroInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'logro.label', default: 'Logro')] as Object[],
                          "Another user has updated this Logro while you were editing")
                render(view: "edit", model: [logroInstance: logroInstance])
                return
            }
        }

        logroInstance.properties = params

        if (!logroInstance.save(flush: true)) {
            render(view: "edit", model: [logroInstance: logroInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'logro.label', default: 'Logro'), logroInstance.id])
        redirect(action: "show", id: logroInstance.id)
    }

    def delete(Long id) {
        def logroInstance = Logro.get(id)
        if (!logroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'logro.label', default: 'Logro'), id])
            redirect(action: "list")
            return
        }

        try {
            logroInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'logro.label', default: 'Logro'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'logro.label', default: 'Logro'), id])
            redirect(action: "show", id: id)
        }
    }
}
