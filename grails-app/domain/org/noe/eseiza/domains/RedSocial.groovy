package org.noe.eseiza.db.domain

class RedSocial {
    String redSocial;
    String perfilUrl;
    static constraints = {
    }
    String  toString(){
        return perfilUrl
    }
    static mapping = {
        version false
        id column: 'idRedSocial'
    }
    
}
