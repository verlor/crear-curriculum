package org.noe.eseiza.db.domain

class Condicion {
    String prestaciones
    int sueldo
    String puesto
    String diasLaborables
    
    static constraints = {
    }
    static mapping = {
        version false
        id column: 'idCondicion'
    }
}
