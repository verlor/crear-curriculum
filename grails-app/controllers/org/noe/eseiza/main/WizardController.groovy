package org.noe.eseiza.main

import grails.plugins.springsecurity.Secured

class WizardController {
    
    @Secured(['ROLE_USER'])
    def index() { }
}
