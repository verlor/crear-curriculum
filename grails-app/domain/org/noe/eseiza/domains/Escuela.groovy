package org.noe.eseiza.db.domain

class Escuela {
    String escuela
    int tiempoCursado
    String grado
    float promedio
    Institucion institucion
    Calendar graduacion
    
    static hasMany = [logros:Logro]
    
    static constraints = {
        logros blank : true
    }
    static mapping = {
        version false
        id column: 'idEscuela'
    }
    String  toString(){
        return escuela
    }
}
