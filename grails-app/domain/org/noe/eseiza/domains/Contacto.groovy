package org.noe.eseiza.domains

class Contacto {
    String telefonoCelular
    String telefonoLocal
    String mail
    
    
    static constraints = {
        telefonoCelular blank : false
        telefonoLocal blank : false
        mail email:true, blank : false
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
