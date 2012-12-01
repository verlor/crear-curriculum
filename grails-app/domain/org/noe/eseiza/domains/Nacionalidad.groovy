package org.noe.eseiza.db.domain

class Nacionalidad {
    String nacionalidad
    static constraints = {
    }
    
    static mapping = {
        version false
        id column: 'idNacionalidad'
    }
    
    String  toString(){
        return nacionalidad
    }
}
