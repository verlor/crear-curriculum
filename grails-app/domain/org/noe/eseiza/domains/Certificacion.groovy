package org.noe.eseiza.domains

class Certificacion {
    String nivel
    Calendar realizacion
    Calendar termino
    String nombre
    static constraints = {
        nivel blank:false
        realizacion blank:false
        termino blank:false
        nombre blank:false
    }
    static mapping = {
        version false
        id column: 'idCertificacion'
    }
    String  toString(){
        return nombre
    }
}
