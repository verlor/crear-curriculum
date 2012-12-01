package org.noe.eseiza.db.domain
import org.noe.eseiza.security.User
class Persona {
    String nombre
    Condicion condicion
    Contacto contacto
    Direccion direccion
    User userName
    static hasMany = [nacionalidades:Nacionalidad,idiomas:Idioma,habilidades:Habilidad,escuelas:Escuela,companias:Compania]
    
    static constraints = {
        condicion blank:true, nullable: true
        contacto blank:true, nullable: true
        direccion blank:true, nullable: true
        nombre blank:false
        
    }
    
    static mapping = {
        version false
        id column: 'idPersona'
    }
}
