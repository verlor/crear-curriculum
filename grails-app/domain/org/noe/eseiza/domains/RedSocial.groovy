package org.noe.eseiza.domains

class RedSocial {
    String redSocial;
    String perfilUrl;
    static constraints = {
        redSocial blank : false
        perfilUrl blank : false
    }
    String  toString(){
        return perfilUrl
    }
    static mapping = {
        version false
        id column: 'idRedSocial'
    }
    
}
