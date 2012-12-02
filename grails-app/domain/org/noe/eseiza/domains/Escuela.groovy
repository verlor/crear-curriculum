package org.noe.eseiza.domains

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
        escuela blank : false
        tiempoCursado blank : false, range : 0..15
        grado blank : false
        promedio blank : false, range : 6.0..10.0
        institucion blank : false
        graduacion blank : false
    }
    static mapping = {
        version false
        id column: 'idEscuela'
    }
    String  toString(){
        return escuela
    }
}
