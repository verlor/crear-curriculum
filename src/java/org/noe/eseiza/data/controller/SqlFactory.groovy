/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.noe.eseiza.data.controller

import groovy.sql.Sql

/**
 *
 * @author neseiza
 */
class SqlFactory {
    static def sql
    private static def db
    
    public static Sql getSqlInstance(){
        db = [url:'jdbc:mysql://localhost:3306/curriculum?useUnicode=yes&characterEncoding=UTF-8', user:'root', password:'root', driver:'com.mysql.jdbc.Driver']
        return Sql.newInstance(db.url, db.user, db.password, db.driver)
    }

}

