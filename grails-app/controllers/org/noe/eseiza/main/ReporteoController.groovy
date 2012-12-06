package org.noe.eseiza.main

import org.noe.eseiza.data.controller.SqlFactory

class ReporteoController {

    def index() { }
    
    def buscarPorIdiomaYNivel(){
        def sql
        def resultado
        sql = SqlFactory.getSqlInstance()
        resultado = sql.rows("select P.nombre, I.idioma, C.nombre, C.nivel, DER.nombre" +
                             "from persona P inner join persona_idioma IP on" + 
                             "P.idPersona = IP.persona_idiomas_id inner join idioma I" +
                             "on IP.idioma_id = I.idIdioma inner join certificacion C " +
                             "on I.certificacion_id = C.idCertificacion inner join " +
                             "(select * from persona P inner join persona_idioma IP on P.idPersona = IP.persona_idiomas_id)" +
                             "as DER   where C.nivel like $params.nivel and I.idioma like $params.idioma") 
        if(resultado)
        {
            [reporte: resultado]
        }
        else
        {
            [reporte: new Object()]
        }         
    }
    
}
