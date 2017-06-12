package com.shan.util;

import com.shan.User_login;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by User on 2017/6/2.
 */
@WebFilter("/Tourist/Member/*")
public class Filterr implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.print( "过滤器开始喽！");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain ch) throws IOException, ServletException {
        //向下转型
        HttpServletRequest request=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse) resp;
        //设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        //创建session会话
        HttpSession session=request.getSession();
        //创建对象接受值
        User_login admin=(User_login) session.getAttribute("user");
        //加入判断
        if (admin==null) {
            response.sendRedirect( "/Tourist/user_login.jsp" );
        }
        else {
            ch.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        System.out.print( "过滤器结束喽！");

    }
}
