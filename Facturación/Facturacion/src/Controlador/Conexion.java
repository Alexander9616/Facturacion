/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;

/**
 *
 * @author Lab2
 */
public class Conexion {
    Connection objConexionMySql;
    Statement ejecutaSentencia;

    Connection abrirConexionMysql(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            objConexionMySql = (Connection)DriverManager.getConnection("jdbc:mysql://localhost/bdFactura", "root", "");            
            ejecutaSentencia = (Statement)objConexionMySql.createStatement();
        } catch (Exception e) {
            objConexionMySql = null;
            System.out.println(e.getMessage() + " --- 3 ");
        }       
        return objConexionMySql;
    }
    public void cerrarConexionMySql(){        
        try {
            if (objConexionMySql != null) {
                objConexionMySql.close();
            }
        } catch (Exception e) {
            objConexionMySql = null; 
            System.out.println(e.getMessage() + " --- 2 ");
        }
    }
    public boolean ejecutarConsultaSql(String consultaSql){
        boolean estado = false;
        try {
            abrirConexionMysql();
            ejecutaSentencia.execute(consultaSql);
            estado = true;
        } catch (Exception e) {
            estado = false;
            System.out.println(e.getMessage() + " --- 1 ");
        }
        finally{
            cerrarConexionMySql();
        }                
        return estado;
    }
    public ResultSet consultaUsuario(String consultaSql){
        ResultSet objResultado = null;
        try {
            abrirConexionMysql();
            objResultado = ejecutaSentencia.executeQuery(consultaSql);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }        
        return objResultado;
    }
}
