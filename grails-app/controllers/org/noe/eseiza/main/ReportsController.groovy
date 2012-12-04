package org.noe.eseiza.main
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class ReportsController {

    def index() { }
    
    def buscarIdiomaPorCertificacion(){
        def sql = sqlSession()
        def rows = sql.rows("select P.nombre, I.idioma, C.nivel, C.nombre"+
                            "from user P inner join user_idioma IP on user_idiomas_id = id"+
                            "inner join idioma I on idioma_id = idIdioma"+
                            "inner join certificacion C on certificacion_id = idCertificacion")
    }
    
    def sqlSession(){
        def db = [url:'jdbc:mysql://localhost:3306/curriculum?useUnicode=yes&characterEncoding=UTF-8', user:'root', password:'root', driver:'com.mysql.jdbc.Driver']
        def sql = Sql.newInstance(db.url, db.user, db.password, db.driver)
        return sql
    }
}
