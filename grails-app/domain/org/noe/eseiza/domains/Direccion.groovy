package org.noe.eseiza.domains

class Direccion {
    int codigoPostal
    int numero
    String calle
    Estado estado
    static constraints = {
        codigoPostal blank : false
        numero blank : false, range : 0..10000
        calle blank : false
        estado blank : false
    }
    String  toString(){
        return calle
    }
    static mapping = {
        version false
        id column: 'idDireccion'
    }
}
