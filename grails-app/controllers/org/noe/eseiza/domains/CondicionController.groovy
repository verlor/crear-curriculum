package org.noe.eseiza.domains

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.noe.eseiza.security.domains.User

@Secured(['ROLE_USER'])

class CondicionController {
    
    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [condicionInstanceList: Condicion.list(params), condicionInstanceTotal: Condicion.count()]
    }

    def create() {
        [condicionInstance: new Condicion(params)]
    }

    def save() {
        def condicionInstance = new Condicion(params)
        User user = springSecurityService.currentUser
        if (!condicionInstance.save(flush: true)) {
            render(view: "create", model: [condicionInstance: condicionInstance])
            return
        }
        user.setCondicion(condicionInstance)
        flash.message = message(code: 'default.created.message', args: [message(code: 'condicion.label', default: 'Condicion'), condicionInstance.id])
        redirect(controller: 'escuela', action: 'create')
    }

    def show(Long id) {
        def condicionInstance = Condicion.get(id)
        if (!condicionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicion.label', default: 'Condicion'), id])
            redirect(action: "list")
            return
        }

        [condicionInstance: condicionInstance]
    }

    def edit(Long id) {
        def condicionInstance = Condicion.get(id)
        if (!condicionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicion.label', default: 'Condicion'), id])
            redirect(action: "list")
            return
        }

        [condicionInstance: condicionInstance]
    }

    def update(Long id, Long version) {
        def condicionInstance = Condicion.get(id)
        if (!condicionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicion.label', default: 'Condicion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (condicionInstance.version > version) {
                condicionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'condicion.label', default: 'Condicion')] as Object[],
                          "Another user has updated this Condicion while you were editing")
                render(view: "edit", model: [condicionInstance: condicionInstance])
                return
            }
        }

        condicionInstance.properties = params

        if (!condicionInstance.save(flush: true)) {
            render(view: "edit", model: [condicionInstance: condicionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'condicion.label', default: 'Condicion'), condicionInstance.id])
        redirect(action: "show", id: condicionInstance.id)
    }

    def delete(Long id) {
        def condicionInstance = Condicion.get(id)
        if (!condicionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'condicion.label', default: 'Condicion'), id])
            redirect(action: "list")
            return
        }

        try {
            condicionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'condicion.label', default: 'Condicion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'condicion.label', default: 'Condicion'), id])
            redirect(action: "show", id: id)
        }
    }
}
