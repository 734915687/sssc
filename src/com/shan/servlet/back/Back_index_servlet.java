package com.shan.servlet.back;

import com.shan.method.back.Back_noticeDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/back_index.action")
public class Back_index_servlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置编码格式
        req.setCharacterEncoding( "utf-8" );
        resp.setCharacterEncoding( "utf-8" );
        resp.setContentType( "text/html;charset=UTF-8" );
        String acction=req.getParameter( "acction" );
        String id=req.getParameter( "id" );
        switch (acction){
            case "add":
                break;
            case "delete":
                Back_noticeDaoImpl bn=new Back_noticeDaoImpl();
                bn.Delete(Integer.parseInt( id ));
                resp.sendRedirect( "/Tourist/back/back_index.jsp" );
                break;
            case "update":
                break;
            default:
                break;
        }

        //获取id

    }
}
