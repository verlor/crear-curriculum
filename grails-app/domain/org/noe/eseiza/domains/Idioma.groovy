package org.noe.eseiza.domains

class Idioma {
    String idioma
    Certificacion certificacion
    static constraints = {
        idioma blank : false
        certificacion blank : true
    }
    static mapping = {
        version false
        id column: 'idIdioma'
    }
    String  toString(){
        return idioma
    }
}
