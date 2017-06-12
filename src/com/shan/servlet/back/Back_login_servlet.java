package com.shan.servlet.back;

import com.shan.Back_login;
import com.shan.method.Jdbc;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by User on 2017/6/2.
 */
@WebServlet("/back_login.action")
public class Back_login_servlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接表单值
        req.setCharacterEncoding("utf-8");              //设置编码格式
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String name = req.getParameter("name");          //获取前段姓名
        String pwd = req.getParameter("pwd");           //获取前段密码
        String code = req.getParameter("code");          //获取前段验证码
        //System.out.print(name+pwd+code);               //测试是否获得数据
        PrintWriter out = resp.getWriter();               //获得打印输出权限
        HttpSession session=req.getSession();             //创建Session会话
        System.out.print( name+pwd );
        Jdbc jdbc=new Jdbc();
        Connection conn=jdbc.jdbc_open();
        String sql="select login_name,login_pwd from back_login";
        try {
            PreparedStatement pst=conn.prepareStatement( sql);
            ResultSet rs=pst.executeQuery();
            List<Back_login> li=new ArrayList<Back_login>();
            while(rs.next()){
                Back_login bl=new Back_login();
                bl.setLogin_name( rs.getString( "login_name" ) );
                bl.setLogin_pwd( rs.getString( "login_pwd" ) );
                li.add( bl );
            }
            int i=0;
            for (Object o:li){
                Back_login bl=(Back_login)o;
                if (name.equals(bl.getLogin_name())&&pwd.equals( bl.getLogin_pwd() )) {
                    System.out.print( bl.getLogin_name()+bl.getLogin_pwd());
                    session.setAttribute( "backname",name);
                    session.setAttribute( "back",bl);
                    out.print(0);
                }
                else{
                    i++;
                    if(i==li.size()){
                        out.print(i);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
