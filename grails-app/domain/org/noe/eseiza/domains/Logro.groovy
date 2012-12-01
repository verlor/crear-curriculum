package org.noe.eseiza.db.domain

class Logro {
    String logro
    String reconocimiento
    static constraints = {
    }
    static mapping = {
        version false
        id column: 'idLogro'
    }
    String toString(){
        return logro
    }
}
