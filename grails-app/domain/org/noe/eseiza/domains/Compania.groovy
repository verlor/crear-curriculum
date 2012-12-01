package org.noe.eseiza.db.domain

class Compania {
    String telefono
    String descripcion
    String nombre
    static hasMany = [logros:Logro]
    static constraints = {
        logros blank : true
    }
    static mapping = {
        version false
        id column: 'idCompania'
    }
    String  toString(){
        return nombre
    }
}
