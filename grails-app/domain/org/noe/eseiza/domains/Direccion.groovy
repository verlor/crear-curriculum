package org.noe.eseiza.db.domain

class Direccion {
    int codigoPostal
    int numero
    String calle
    Estado estado
    static constraints = {
    }
    String  toString(){
        return calle
    }
    static mapping = {
        version false
        id column: 'idDireccion'
    }
}
