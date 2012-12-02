package org.noe.eseiza.domains

import org.springframework.dao.DataIntegrityViolationException

class CertificacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [certificacionInstanceList: Certificacion.list(params), certificacionInstanceTotal: Certificacion.count()]
    }

    def create() {
        [certificacionInstance: new Certificacion(params)]
    }

    def save() {
        def certificacionInstance = new Certificacion(params)
        if (!certificacionInstance.save(flush: true)) {
            render(view: "create", model: [certificacionInstance: certificacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'certificacion.label', default: 'Certificacion'), certificacionInstance.id])
        redirect(action: "show", id: certificacionInstance.id)
    }

    def show(Long id) {
        def certificacionInstance = Certificacion.get(id)
        if (!certificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificacion.label', default: 'Certificacion'), id])
            redirect(action: "list")
            return
        }

        [certificacionInstance: certificacionInstance]
    }

    def edit(Long id) {
        def certificacionInstance = Certificacion.get(id)
        if (!certificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificacion.label', default: 'Certificacion'), id])
            redirect(action: "list")
            return
        }

        [certificacionInstance: certificacionInstance]
    }

    def update(Long id, Long version) {
        def certificacionInstance = Certificacion.get(id)
        if (!certificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificacion.label', default: 'Certificacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (certificacionInstance.version > version) {
                certificacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'certificacion.label', default: 'Certificacion')] as Object[],
                          "Another user has updated this Certificacion while you were editing")
                render(view: "edit", model: [certificacionInstance: certificacionInstance])
                return
            }
        }

        certificacionInstance.properties = params

        if (!certificacionInstance.save(flush: true)) {
            render(view: "edit", model: [certificacionInstance: certificacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'certificacion.label', default: 'Certificacion'), certificacionInstance.id])
        redirect(action: "show", id: certificacionInstance.id)
    }

    def delete(Long id) {
        def certificacionInstance = Certificacion.get(id)
        if (!certificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificacion.label', default: 'Certificacion'), id])
            redirect(action: "list")
            return
        }

        try {
            certificacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'certificacion.label', default: 'Certificacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'certificacion.label', default: 'Certificacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
