package org.noe.eseiza.db.domain

class Institucion {
    String institucion
    static constraints = {
    }
    static mapping = {
        version false
        id column: 'idInstitucion'
    }
    String  toString(){
        return institucion
    }
}
