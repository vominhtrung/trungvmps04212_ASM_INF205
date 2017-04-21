/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Do Tien Dung
 */
public class Customers {
    public Customers(){
    
}
    public boolean checkLogin(String user, String pass){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://mssql42881-dungdt.jelastic.skali.net:1433;databaseName=AsmSOF301";
            Connection con=DriverManager.getConnection(url,"sa","AHKygz49511");
            String sql="select * from Customes where Username=? and Password=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs=stm.executeQuery();
            boolean exist=false;
            exist=rs.next();
            rs.close();stm.close();con.close();
            if(exist){
                return true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
            return false;
    }
}
