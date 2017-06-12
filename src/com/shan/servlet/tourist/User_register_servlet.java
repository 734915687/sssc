package com.shan.servlet.tourist;

import com.shan.User_register;
import com.shan.method.tourist.User_registerDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by User on 2017/5/22.
 */
@WebServlet("/user_register.action")
public class User_register_servlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         System.out.print("进来了吗？");
        req.setCharacterEncoding("utf-8");              //设置编码格式
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String phone = req.getParameter("phone");          //获取前段电话
        String pwd = req.getParameter("pwd");           //获取前段密码
        String conpwd = req.getParameter("conpwd");           //获取前段密码
        String code = req.getParameter("code");          //获取前段验证码
        //System.out.print(name+pwd+code);               //测试是否获得数据
        PrintWriter out = resp.getWriter();               //获得打印输出权限
        User_registerDaoImpl u = new User_registerDaoImpl();   //创建数据库的对象
        User_register user = new User_register();              //创建用户对象
        int i=0;                                            //定义一个标签用来给AJAX传值，避免重复传值
        for (Object o : u.Select(user)) {                //用迭代器遍历集合
            User_register uu = (User_register) o;              //类型转换
               if (phone.equals(uu.getUser_register_phone())){
                   //System.out.println(uu.getUser_register_phone()+",，，，，，，，，");  //测试
                   out.print(1);
               }
               else{
                   i++;
                   if(i==u.Select(user).size()){
                       User_register user_add=new User_register();
                       user_add.setUser_register_phone(phone);
                       user_add.setUser_register_pwd(pwd);
                       u.Add(user_add);
                       out.print(0);
                   }
               }
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
