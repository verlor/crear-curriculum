package org.noe.eseiza.db.domain

class Estado {
    String estado
    static constraints = {
    }
    static mapping = {
        version false
        id column: 'idEstado'
    }
    String  toString(){
        return estado
    }
}
