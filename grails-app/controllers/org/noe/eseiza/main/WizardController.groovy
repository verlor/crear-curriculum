package org.noe.eseiza.main

import grails.plugins.springsecurity.Secured
import org.noe.eseiza.security.domains.User


class WizardController {
    
    def springSecurityService
    
    @Secured(['ROLE_USER'])
    def index() { 
    }
    
    
    def curriculum(){
        User user = springSecurityService.currentUser
        [user: user]
    }
    
    @Secured(['ROLE_USER'])
    def curriculumAPdf(){
        def out = new StringBuilder()
        def err = new StringBuilder()
        def proc = "wkhtmltopdf http://localhost:8080/curriculums/wizard/showCurriculumByName?user=${params.user} myCurriculum.pdf".execute()
        proc.waitForProcessOutput(out, err)
        if (out) println "out:\n$out"
        if (err) println "err:\n$err"
        
        FileInputStream pdfImg = new FileInputStream("myCurriculum.pdf")

        // I then use needed document information to set up the rest of the response attributes to set up other parameters:

        //sresponse.setContentLength(pdfImg.documentSize)
        response.contentType = 'application/pdf' // or the appropriate image content type

        // Groovy allows me to append my pdf image to the outputstream of the response object. then I flush it and can also close it.

        response.outputStream << pdfImg
        response.outputStream.flush()
        response.outputStream.close()
        "rm myCurriculum.pdf".execute()
    }
    
    def showCurriculumByName(Long userN){        
        def userInstance = User.get(params.user)                       
        [user: userInstance]
    }
    
    def reportUno(){
        
    }        
}
