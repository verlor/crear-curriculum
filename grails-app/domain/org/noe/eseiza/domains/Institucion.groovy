package org.noe.eseiza.domains

class Institucion {
    String institucion
    static constraints = {
        institucion blank : false
    }
    static mapping = {
        version false
        id column: 'idInstitucion'
    }
    String  toString(){
        return institucion
    }
}
