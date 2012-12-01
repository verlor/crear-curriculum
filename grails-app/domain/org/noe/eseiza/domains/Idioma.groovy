package org.noe.eseiza.db.domain

class Idioma {
    String idioma
    Certificacion certificacion
    static constraints = {
    }
    static mapping = {
        version false
        id column: 'idIdioma'
    }
    String  toString(){
        return idioma
    }
}
