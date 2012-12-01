package org.noe.eseiza.db.domain

class Contacto {
    String telefonoCelular
    String telefonoLocal
    String mail
    
    
    static constraints = {
    }
    
    String  toString(){
        return mail
    }
    static mapping = {
        version false
        id column: 'idContacto'
    }
    
    static hasMany = [redesSociales: RedSocial]

}
