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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Do Tien Dung
 */
public class Products {
    List<Product> list=new ArrayList<Product>();
    public Products(){
    
}
    public void delete(String masp){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://mssql42881-dungdt.jelastic.skali.net:1433;databaseName=AsmSOF301";
            Connection con=DriverManager.getConnection(url,"sa","AHKygz49511");
            String sql="delete from Products where Code=?";
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setString(1, masp);
            stm.executeUpdate();
            stm.close();
            con.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void insert(String masp, String tensp, float gia){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://mssql42881-dungdt.jelastic.skali.net:1433;databaseName=AsmSOF301";
            Connection con=DriverManager.getConnection(url,"sa","AHKygz49511");
            String sql="insert into Products values(?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, masp);
            stm.setString(2, tensp);
            stm.setFloat(3, gia);
            stm.executeUpdate();
            stm.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public void update(String masp, String tensp, float gia){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://mssql42881-dungdt.jelastic.skali.net:1433;databaseName=AsmSOF301";
            Connection con=DriverManager.getConnection(url,"sa","AHKygz49511");
            String sql="update Products set Name=?, Price=? where Code=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, tensp);
            stm.setFloat(2, gia);
            stm.setString(3, masp);
            stm.executeUpdate();
            stm.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public List<Product> showProduct(String tensp){
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://mssql42881-dungdt.jelastic.skali.net:1433;databaseName=AsmSOF301";
            Connection con=DriverManager.getConnection(url, "sa", "AHKygz49511");
            String sql="select * from Products where Name like '%"+tensp+"%'";
            Statement stm=con.createStatement();
            ResultSet rs=stm.executeQuery(sql);
          
            while(rs.next()){
                String code=rs.getString("Code");
                String name=rs.getString("Name");
                float price=rs.getFloat("Price");
                Product sp=new Product(code,name,price);
                list.add(sp);
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
