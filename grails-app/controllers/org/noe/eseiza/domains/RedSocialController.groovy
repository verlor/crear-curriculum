package org.noe.eseiza.domains

import org.springframework.dao.DataIntegrityViolationException

class RedSocialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [redSocialInstanceList: RedSocial.list(params), redSocialInstanceTotal: RedSocial.count()]
    }

    def create() {
        [redSocialInstance: new RedSocial(params)]
    }

    def save() {
        def redSocialInstance = new RedSocial(params)
        if (!redSocialInstance.save(flush: true)) {
            render(view: "create", model: [redSocialInstance: redSocialInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'redSocial.label', default: 'RedSocial'), redSocialInstance.id])
        redirect(action: "show", id: redSocialInstance.id)
    }

    def show(Long id) {
        def redSocialInstance = RedSocial.get(id)
        if (!redSocialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'redSocial.label', default: 'RedSocial'), id])
            redirect(action: "list")
            return
        }

        [redSocialInstance: redSocialInstance]
    }

    def edit(Long id) {
        def redSocialInstance = RedSocial.get(id)
        if (!redSocialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'redSocial.label', default: 'RedSocial'), id])
            redirect(action: "list")
            return
        }

        [redSocialInstance: redSocialInstance]
    }

    def update(Long id, Long version) {
        def redSocialInstance = RedSocial.get(id)
        if (!redSocialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'redSocial.label', default: 'RedSocial'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (redSocialInstance.version > version) {
                redSocialInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'redSocial.label', default: 'RedSocial')] as Object[],
                          "Another user has updated this RedSocial while you were editing")
                render(view: "edit", model: [redSocialInstance: redSocialInstance])
                return
            }
        }

        redSocialInstance.properties = params

        if (!redSocialInstance.save(flush: true)) {
            render(view: "edit", model: [redSocialInstance: redSocialInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'redSocial.label', default: 'RedSocial'), redSocialInstance.id])
        redirect(action: "show", id: redSocialInstance.id)
    }

    def delete(Long id) {
        def redSocialInstance = RedSocial.get(id)
        if (!redSocialInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'redSocial.label', default: 'RedSocial'), id])
            redirect(action: "list")
            return
        }

        try {
            redSocialInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'redSocial.label', default: 'RedSocial'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'redSocial.label', default: 'RedSocial'), id])
            redirect(action: "show", id: id)
        }
    }
}
