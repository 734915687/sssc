package com.shan.servlet.tourist;

import com.alibaba.fastjson.JSONObject;
import com.shan.Search;
import com.shan.method.Jdbc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * Created by User on 2017/6/1.
 */
@WebServlet("/search.action")
public class Search_servlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding( "utf-8" );
        resp.setContentType( "utf-8" );
        resp.setContentType("text/html;charset=utf-8");
        String key=req.getParameter( "term" );
        PrintWriter out=resp.getWriter();
        if(key!=null){
            Jdbc jdbc=new Jdbc();
            Connection conn=jdbc.jdbc_open();
            String sql="select shopping_name from shopping_search where shopping_name like '%"+key+"%' limit 10";
            PreparedStatement pst= null;
            try {
                pst = conn.prepareStatement( sql );
                ResultSet rs=pst.executeQuery();
                List li=new ArrayList();
                List<String> keys=new ArrayList<String>();
                while(rs.next()){
                    Search my=new Search();
                    my.setShopping_name( rs.getString( "shopping_name" ) );
                    li.add(my);
                }
                for (Object o:li) {
                    Search s=(Search)o;
                    keys.add(s.getShopping_name().toString());
                }
                out.print( JSONObject.toJSON( keys ));  //传值
            } catch (SQLException e) {
                e.printStackTrace();
            }
//                Enumeration e=req.getParameterNames();
//                while(e.hasMoreElements()) {
//                    System.out.print( e.nextElement() );
//
//                }
        }
    }
}
