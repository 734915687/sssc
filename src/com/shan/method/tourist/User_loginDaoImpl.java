package com.shan.method.tourist;

import com.shan.User_login;
import com.shan.method.Jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by User on 2017/5/18.
 */
public class User_loginDaoImpl implements User_loginDao{
    private String sql;                    //设置储存数据库语句
    private PreparedStatement pst;         //设置准备执行sql的属性
    Jdbc jdbc=new Jdbc();                  //方便调用链接JDBC
    @Override
    //增
    public int Add(User_login a) {
        return 0;
    }

    @Override
    //删
    public int Delete(User_login a) {
        return 0;
    }

    @Override
    //改
    public int Update(User_login a) {
        return 0;
    }

    @Override
    //查
    public List<User_login> Select(User_login a) {
        List<User_login> li= new ArrayList<User_login>(); //用于存储遍历内容
        sql="select * from user_login";              //查询user_login表格
        try{
            pst=jdbc.jdbc_open().prepareStatement(sql);  //准备执行sql语句
            ResultSet rs=pst.executeQuery();              //进行查询并存入rs中
            User_login ul=new User_login();
            while(rs.next()){                            //便利集合
                ul.setUser_login_id(rs.getString("user_login_id"));
                ul.setUser_login_name(rs.getString("user_login_name"));
                ul.setUser_login_pwd(rs.getString("user_login_pwd"));
                li.add(ul);
            }
            rs.close();
            pst.close();
            jdbc.jdbc_close();
        }catch (SQLException e){
            e.printStackTrace();
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
        User_loginDaoImpl s=new User_loginDaoImpl();
        User_login ad=new User_login();
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
            User_login a=(User_login)o;
            System.out.print(a.getUser_login_id()+",");
            System.out.print(a.getUser_login_name()+",");
            System.out.println(a.getUser_login_pwd());
        }
    }
}
