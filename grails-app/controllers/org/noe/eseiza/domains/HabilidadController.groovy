package org.noe.eseiza.domains

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.noe.eseiza.security.domains.User

@Secured(['ROLE_USER'])

class HabilidadController {

    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [habilidadInstanceList: Habilidad.list(params), habilidadInstanceTotal: Habilidad.count()]
    }

    def create() {
        [habilidadInstance: new Habilidad(params)]
    }

    def save() {
        def habilidadInstance = new Habilidad(params)
        User user = springSecurityService.currentUser
        if (!habilidadInstance.save(flush: true)) {
            render(view: "create", model: [habilidadInstance: habilidadInstance])
            return
        }
        user.addToHabilidades(habilidadInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'habilidad.label', default: 'Habilidad'), habilidadInstance.id])
        redirect(action: "create")
    }

    def show(Long id) {
        def habilidadInstance = Habilidad.get(id)
        if (!habilidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'habilidad.label', default: 'Habilidad'), id])
            redirect(action: "list")
            return
        }

        [habilidadInstance: habilidadInstance]
    }

    def edit(Long id) {
        def habilidadInstance = Habilidad.get(id)
        if (!habilidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'habilidad.label', default: 'Habilidad'), id])
            redirect(action: "list")
            return
        }

        [habilidadInstance: habilidadInstance]
    }

    def update(Long id, Long version) {
        def habilidadInstance = Habilidad.get(id)
        if (!habilidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'habilidad.label', default: 'Habilidad'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (habilidadInstance.version > version) {
                habilidadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'habilidad.label', default: 'Habilidad')] as Object[],
                          "Another user has updated this Habilidad while you were editing")
                render(view: "edit", model: [habilidadInstance: habilidadInstance])
                return
            }
        }

        habilidadInstance.properties = params

        if (!habilidadInstance.save(flush: true)) {
            render(view: "edit", model: [habilidadInstance: habilidadInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'habilidad.label', default: 'Habilidad'), habilidadInstance.id])
        redirect(action: "show", id: habilidadInstance.id)
    }

    def delete(Long id) {
        def habilidadInstance = Habilidad.get(id)
        if (!habilidadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'habilidad.label', default: 'Habilidad'), id])
            redirect(action: "list")
            return
        }

        try {
            habilidadInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'habilidad.label', default: 'Habilidad'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'habilidad.label', default: 'Habilidad'), id])
            redirect(action: "show", id: id)
        }
    }
}
