package org.noe.eseiza.domains

class Condicion {
    String prestaciones
    int sueldo
    String puesto
    String diasLaborables
    
    static constraints = {
        prestaciones blank:false
        puesto blank : false
        diasLaborables blank : false
    }
    static mapping = {
        version false
        id column: 'idCondicion'
    }
}
