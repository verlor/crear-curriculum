package org.noe.eseiza.domains

class Estado {
    String estado
    static constraints = {
        estado blank : false
    }
    static mapping = {
        version false
        id column: 'idEstado'
    }
    String  toString(){
        return estado
    }
}
