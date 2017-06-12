package com.shan.servlet.tourist;

import com.shan.User_login;
import com.shan.method.tourist.User_loginDaoImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by User on 2017/5/18.
 */
@WebServlet("/user_login.action")
public class User_login_servlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.print("来了吗");
        req.setCharacterEncoding("utf-8");              //设置编码格式
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String name = req.getParameter("name");          //获取前段姓名
        String pwd = req.getParameter("pwd");           //获取前段密码
        String code = req.getParameter("code");          //获取前段验证码
        //System.out.print(name+pwd+code);               //测试是否获得数据
        HttpSession session=req.getSession();             //创建Session会话
        PrintWriter out = resp.getWriter();               //获得打印输出权限
        User_loginDaoImpl u = new User_loginDaoImpl();   //创建数据库的对象
        User_login user = new User_login();              //创建用户对象
        int i=0;                                         //定义一个标签用来给AJAX传值，避免重复传值
        for (Object o : u.Select(user)) {                //用迭代器遍历集合
            User_login uu = (User_login) o;              //类型转换
            if (name.equals(uu.getUser_login_name())) {
                session.setAttribute( "user",uu);
                session.setAttribute( "username",name);
                out.print(0);
            } else {
                i++;
                if(i==u.Select(user).size()){
                    out.print(i);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
