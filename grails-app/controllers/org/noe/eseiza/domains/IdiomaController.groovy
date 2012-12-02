package org.noe.eseiza.domains

import org.springframework.dao.DataIntegrityViolationException

class IdiomaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [idiomaInstanceList: Idioma.list(params), idiomaInstanceTotal: Idioma.count()]
    }

    def create() {
        [idiomaInstance: new Idioma(params)]
    }

    def save() {
        def idiomaInstance = new Idioma(params)
        if (!idiomaInstance.save(flush: true)) {
            render(view: "create", model: [idiomaInstance: idiomaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'idioma.label', default: 'Idioma'), idiomaInstance.id])
        redirect(action: "show", id: idiomaInstance.id)
    }

    def show(Long id) {
        def idiomaInstance = Idioma.get(id)
        if (!idiomaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'idioma.label', default: 'Idioma'), id])
            redirect(action: "list")
            return
        }

        [idiomaInstance: idiomaInstance]
    }

    def edit(Long id) {
        def idiomaInstance = Idioma.get(id)
        if (!idiomaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'idioma.label', default: 'Idioma'), id])
            redirect(action: "list")
            return
        }

        [idiomaInstance: idiomaInstance]
    }

    def update(Long id, Long version) {
        def idiomaInstance = Idioma.get(id)
        if (!idiomaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'idioma.label', default: 'Idioma'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (idiomaInstance.version > version) {
                idiomaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'idioma.label', default: 'Idioma')] as Object[],
                          "Another user has updated this Idioma while you were editing")
                render(view: "edit", model: [idiomaInstance: idiomaInstance])
                return
            }
        }

        idiomaInstance.properties = params

        if (!idiomaInstance.save(flush: true)) {
            render(view: "edit", model: [idiomaInstance: idiomaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'idioma.label', default: 'Idioma'), idiomaInstance.id])
        redirect(action: "show", id: idiomaInstance.id)
    }

    def delete(Long id) {
        def idiomaInstance = Idioma.get(id)
        if (!idiomaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'idioma.label', default: 'Idioma'), id])
            redirect(action: "list")
            return
        }

        try {
            idiomaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'idioma.label', default: 'Idioma'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'idioma.label', default: 'Idioma'), id])
            redirect(action: "show", id: id)
        }
    }
}
