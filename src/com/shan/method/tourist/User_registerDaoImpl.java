package com.shan.method.tourist;

import com.shan.User_register;
import com.shan.method.Jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User_registerDaoImpl implements User_registerDao {
    private String sql;                    //设置储存数据库语句
    private PreparedStatement pst;         //设置准备执行sql的属性
    Jdbc jdbc=new Jdbc();                  //方便调用链接JDBC

    @Override
    //增
    public int Add(User_register a) {
        sql="insert into user_register(user_register_phone,user_register_pwd) values (?,?)";
        try{
        PreparedStatement pst=jdbc.jdbc_open().prepareStatement(sql);
        pst.setString(1,a.getUser_register_phone());
        pst.setString(2,a.getUser_register_pwd());
        pst.executeUpdate();
        pst.close();
        jdbc.jdbc_close();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    //删
    public int Delete(User_register a) {
        return 0;
    }

    @Override
    //改
    public int Update(User_register a) {
        return 0;
    }

    @Override
    //查
    public List<User_register> Select(User_register a){
        String sql="select * from user_register";
        //写一个集合接受获得的值
        List<User_register> li=new ArrayList<User_register>();
        try {
            PreparedStatement pst=jdbc.jdbc_open().prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                User_register ur=new User_register();
                ur.setUser_register_id(rs.getString("User_register_id"));
              ur.setUser_register_name(rs.getString("User_register_name"));
              ur.setUser_register_phone(rs.getString("User_register_phone"));
              ur.setUser_register_pwd(rs.getString("User_register_pwd"));
              li.add(ur);
            }
            rs.close();
            pst.close();
            jdbc.jdbc_close();
            }
        catch (SQLException e) {
            e.printStackTrace();
            //用rs接受结果集
        }
        return li;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public PreparedStatement getPst() {
        return pst;
    }

    public void setPst(PreparedStatement pst) {
        this.pst = pst;
    }
    //测试
    public static void main(String[] args) {

        System.out.println("$$");
        User_registerDaoImpl s=new User_registerDaoImpl();
        User_register ad=new User_register();
        ad.setUser_register_phone("15083088326");
        ad.setUser_register_pwd("123456");
        s.Add(ad);
        //Admin ad=new Admin();
        //ad.setAdmin_id("-1");
        //ad.setAdmin_name("嘿嘿");
        //ad.setAdmin_pwd("啦啦啦");
        //s.Add(ad);
        //s.Delete(18);
        //s.Update("宙斯啊", "雷霆之怒", 7);
        //System.out.println(s.conn);
        System.out.println("****");
        for (Object o:s.Select(ad)) {
            User_register a=(User_register)o;
            System.out.print(a.getUser_register_id()+",");
            System.out.print(a.getUser_register_name()+",");
            System.out.println(a.getUser_register_phone()+",");
            System.out.println(a.getUser_register_pwd());
        }
    }
}
