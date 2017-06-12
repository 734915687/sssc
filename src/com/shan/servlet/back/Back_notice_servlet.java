package com.shan.servlet.back;

import com.shan.Back_notice;
import com.shan.method.back.Back_noticeDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/back_notice.action")
public class Back_notice_servlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           //设置编码格式
           req.setCharacterEncoding( "utf-8" );
           resp.setCharacterEncoding( "utf-8" );
           resp.setContentType( "text/html;charset=UTF-8" );
        //设置日期格式化器
        SimpleDateFormat x=new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        String time=x.format( new Date(  ) );
        HttpSession session= req.getSession();
        //创建对象，获取前台的值存入数据库
        Back_notice a=new Back_notice();
        a.setNotice_name( session.getAttribute( "backname" ).toString() );
        a.setNotice_time( time);
        a.setNotice_value( req.getParameter( "content" ).toString() );
        Back_noticeDaoImpl bn=new Back_noticeDaoImpl();
        bn.Add(a);
        resp.sendRedirect( "/Tourist/back/back_index.jsp" );
    }
}
