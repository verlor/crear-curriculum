package org.noe.eseiza.main

import grails.plugins.springsecurity.Secured
import org.noe.eseiza.security.domains.User

class WizardController {
    
    @Secured(['ROLE_USER'])
    def index() { 
    }
}
