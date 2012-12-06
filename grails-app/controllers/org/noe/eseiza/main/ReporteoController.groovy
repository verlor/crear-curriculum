package org.noe.eseiza.main

import grails.plugins.springsecurity.Secured
import org.noe.eseiza.data.controller.SqlFactory

class ReporteoController {
    
    @Secured(['ROLE_ADMIN'])
    def index() { }
    
    
    def buscarPorIdiomaYNivel(){
        def sql
        def resultado
        sql = SqlFactory.getSqlInstance()
        resultado = sql.rows("select distinct P.nombre, I.idioma, C.nombre, C.nivel, DER.nombre " +
                             "from user P inner join user_idioma IP on " + 
                             "P.id = IP.user_idiomas_id inner join idioma I " +
                             "on IP.idioma_id = I.idIdioma inner join certificacion C " +
                             "on I.certificacion_id = C.idCertificacion inner join " +
                             "(select * from user P inner join user_idioma IP on P.id = IP.user_idiomas_id) " +
                             "as DER where C.nivel like '$params.nivel' and I.idioma like '$params.idioma'") 
        if(resultado)
            [reporte: resultado]
        else
            [reporte: new Object()]      
    }
    
    def buscarPorPuesto(){
        def sql
        def resultado
        sql = SqlFactory.getSqlInstance()
        resultado = sql.rows("select p.nombre as PERSONA, condi.puesto as PUESTO, cont.mail as MAIL, cont.telefono_celular as CELULAR, cont.telefono_local as TELEFONO_PARTICULAR"+
            ", rs.perfil_url as PERFIL, rs.red_social as RED_SOCIAL"+
            "from user as p"+
            "inner join condicion as condion p.condicion_id=condi.idCondicion"+
            "inner join contacto as cont on cont.idContacto=p.contacto_id"+
            "inner join contacto_red_social as crs"+
            "on crs.contacto_redes_sociales_id=cont.idContacto"+
            "inner join red_social as rs"+
            "on rs.idredSocial=red_social_id "+
            "where condi.puesto like $params.puesto")
        if(resultado)
            [reporte: resultado]
        else
            [reporte: new Object()]
    }
    
    def buscarPorSueldo(){
        def sql
        def resultado
        sql = SqlFactory.getSqlInstance()
        resultado = sql.rows("select P.nombre, E.escuela, E.grado, E.promedio, DER.sueldo"+
            "from user as P inner join user_escuela as PE on P.idPersona = PE.user_escuelas_id"+
            "inner join escuela as E on PE.escuela_id = E.idEscuela"+
            "inner join (select C.sueldo from user as P inner join condicion as C"+ 
            "on P.condicion_id = C.idCondicion) as DER"+
            "where DER.sueldo like $params.sueldo") 
        if(resultado)
            [reporte: resultado]
        else
            [reporte: new Object()]
    }
    
    def instPorPromedio(){
        def sql
        def resultado
        sql = SqlFactory.getSqlInstance()
        resultado = sql.rows("select INS.institucion, (select avg (E.promedio)"+ 
            "from escuela order by E.promedio DESC) as PromedioGeneral"+
            "from institucion as INS inner join escuela as E on INS.IdInstitucion = E.institucion_id ")
        if(resultado)
            [reporte: resultado]
        else
            [reporte: new Object()]
    }
    
    def buscarPorHabilidad(){
        def sql
        def resultado
        sql = SqlFactory.getSqlInstance()
        resultado = sql.rows("select E.estado, P.nombre, H.habilidad, C.nombre, I.idioma, CO.sueldo "+
        "from estado as E inner join direccion as D on E.idEstado = D.idDireccion"+
        "inner join user as P on D.idDireccion= P.direccion_id"+
        "inner join user_habilidad as PH on P.idPersona = PH.user_habilidades_id"+
        "inner join habilidad as H on  PH.habilidad_id = H.IdHabilidad"+
        "inner join certificacion as C on H.certificacion_id = C.IdCertificacion "+
        "inner join idioma as I on C.IdCertificacion = I.certificacion_id"+
        "inner join user_idioma as IP on I.idIdioma = IP.idioma_id"+
        "inner join user on IP.user_idiomas_id = P.idPersona"+
        "inner join condicion as CO on P.condicion_id = CO.idCondicion"+
        "where H.habilidad like $params.habilidad")
        if(resultado)
            [reporte: resultado]
        else
            [reporte: new Object()]
    }
}
