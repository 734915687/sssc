package com.shan.method;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by User on 2017/5/17.
 */
public class Jdbc {
    //链接数据库
    private String drive = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://127.0.0.1/test?useUnicode=true&characterEncoding=utf-8";
    private String user = "sss";
    private String password = "123456";

    private Connection conn=null;
    public Connection jdbc_open(){
        try {
            Class.forName(drive);
            conn= DriverManager.getConnection(url,user,password);
        }catch (ClassNotFoundException ee){
            ee.printStackTrace();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return conn;
    }
    public void jdbc_close(){
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String getDrive() {
        return drive;
    }

    public void setDrive(String drive) {
        this.drive = drive;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
}
