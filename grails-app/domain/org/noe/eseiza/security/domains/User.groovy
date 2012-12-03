package org.noe.eseiza.security.domains

import org.noe.eseiza.domains.*
class User {

    transient springSecurityService
        
    String nombre
    Condicion condicion
    Contacto contacto
    Direccion direccion
    static hasMany = [nacionalidades:Nacionalidad,idiomas:Idioma,habilidades:Habilidad,escuelas:Escuela,companias:Compania]
    
    String username
    String password
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        username blank: false, unique: true
        password blank: false
        condicion blank:true, nullable: true
        contacto blank:true, nullable: true
        direccion blank:true, nullable: true
        nombre blank:false
    }

    static mapping = {
        version false
        password column: '`password`'
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
