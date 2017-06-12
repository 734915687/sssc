package com.shan.method.back;

import com.shan.Back_notice;
import com.shan.method.Jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by User on 2017/6/7.
 */
public class Back_noticeDaoImpl implements Back_noticeDao {
    private String sql;                    //设置储存数据库语句
    private PreparedStatement pst;         //设置准备执行sql的属性
    Jdbc jdbc=new Jdbc();                  //方便调用链接JDBC
    //增
    @Override
    public int Add(Back_notice a) {
        sql="insert into notice(notice_name,notice_time,notice_value) values (?,?,?)";
        try{
            PreparedStatement pst=jdbc.jdbc_open().prepareStatement(sql);
            pst.setString(1,a.getNotice_name());
            pst.setString(2,a.getNotice_time());
            pst.setString(3,a.getNotice_value());
            pst.executeUpdate();
            pst.close();
            jdbc.jdbc_close();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
    //删
    @Override
    public int Delete(int a) {
        sql="delete from notice where notice_id=?;";
        try{
            PreparedStatement pst=jdbc.jdbc_open().prepareStatement(sql);
            pst.setInt( 1,a );
            pst.executeUpdate();
            pst.close();
            jdbc.jdbc_close();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
    //改
    @Override
    public int Update(Back_notice a) {
        return 0;
    }
    //查
    @Override
    public List<Back_notice> Select(Back_notice a,int c,int d) {
        String sql="select * from notice limit ?,?";
        //写一个集合接受获得的值
        List<Back_notice> li=new ArrayList<Back_notice>();
        try {
            PreparedStatement pst=jdbc.jdbc_open().prepareStatement(sql);
            pst.setInt( 1,c );
            pst.setInt( 2,d );
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                Back_notice ur=new Back_notice();
                ur.setNotice_id(rs.getString("notice_id"));
                ur.setNotice_name(rs.getString("notice_name"));
                ur.setNotice_time(rs.getString("notice_time"));
                ur.setNotice_value(rs.getString("notice_value"));
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
    @Override
    public int Select_count() {
        String ii="";
        sql="select COUNT(*) from notice";              //查询notice总条数
        try{
            pst=jdbc.jdbc_open().prepareStatement(sql);  //准备执行sql语句
            ResultSet rs=pst.executeQuery();              //进行查询并存入rs中
            while(rs.next()){                            //便利集合
                ii=rs.getString("count(*)");
            }
            rs.close();
            pst.close();
            jdbc.jdbc_close();
        }catch (SQLException e){
            e.printStackTrace();
        }
        int i=Integer.parseInt( ii );
        return i;
    }

    public static void main(String[] args) {

        System.out.println("$$");
        Back_noticeDaoImpl s=new Back_noticeDaoImpl();
        Back_notice ad=new Back_notice();
        ad.setNotice_value("backname");
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
        System.out.println(s.Select_count());
        for (Object o:s.Select( ad,1,5 )){
            Back_notice bn= (Back_notice) o;
            System.out.print( bn.getNotice_name() );
            System.out.print( bn.getNotice_time() );
            System.out.println( bn.getNotice_value() );

        }



    }
}
