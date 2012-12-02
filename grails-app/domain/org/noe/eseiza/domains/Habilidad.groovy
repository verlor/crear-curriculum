package org.noe.eseiza.domains

class Habilidad {
    String habilidad
    String descripcion
    Certificacion certificacion
    static constraints = {
        certificacion blank:true, nullable: true
        descripcion blank : false
        habilidad blank : false
    }
    
    String  toString(){
        return habilidad
    }
    static mapping = {
        version false
        id column: 'idHabilidad'
    }
}
