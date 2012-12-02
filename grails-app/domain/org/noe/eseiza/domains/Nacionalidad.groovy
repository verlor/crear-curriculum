package org.noe.eseiza.domains

class Nacionalidad {
    String nacionalidad
    static constraints = {
        nacionalidad blank : false
    }
    
    static mapping = {
        version false
        id column: 'idNacionalidad'
    }
    
    String  toString(){
        return nacionalidad
    }
}
