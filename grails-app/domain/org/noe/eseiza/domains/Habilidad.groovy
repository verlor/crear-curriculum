package org.noe.eseiza.db.domain

class Habilidad {
    String habilidad
    String descripcion
    Certificacion certificacion
    static constraints = {
        certificacion blank:true, nullable: true
    }
    
    String  toString(){
        return habilidad
    }
    static mapping = {
        version false
        id column: 'idHabilidad'
    }
}
