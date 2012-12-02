package org.noe.eseiza.domains

class Compania {
    String telefono
    String descripcion
    String nombre
    static hasMany = [logros:Logro]
    static constraints = {
        logros blank : true
        nombre blank : false
        descripcion blank : false
        telefono blank : false
    }
    static mapping = {
        version false
        id column: 'idCompania'
    }
    String  toString(){
        return nombre
    }
}
