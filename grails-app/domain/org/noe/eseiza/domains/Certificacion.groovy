package org.noe.eseiza.db.domain

class Certificacion {
    String nivel
    Calendar realizacion
    Calendar termino
    String nombre
    static constraints = {
    }
    static mapping = {
        version false
        id column: 'idCertificacion'
    }
    String  toString(){
        return nombre
    }
}
