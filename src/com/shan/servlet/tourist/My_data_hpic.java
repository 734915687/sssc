package com.shan.servlet.tourist;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.sun.deploy.net.HttpRequest;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by User on 2017/5/31.
 */
@WebServlet("/my_data_hpic.action")
public class My_data_hpic extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding( "utf-8" );
        PrintWriter out = resp.getWriter();
        SmartUpload su = new SmartUpload();
        // 上传初始化
        JspFactory fac = JspFactory.getDefaultFactory();
        PageContext pageContext = fac.getPageContext( this, req, resp, null,
                false, JspWriter.DEFAULT_BUFFER, true );
        su.initialize( pageContext );
        try {
            su.setAllowedFilesList( "jpg,png" );                                 //设置上传文件的格式
            su.upload();      //启动
            // su.setMaxFileSize( 1024*200 );                                    //设置上传文件最大大小

            String path = req.getServletContext().getRealPath( "upload" );    //在当前路径下建立文件夹
            File f = new File( path );
            if (!f.exists()) {                                                    //判断该文件是否存在
                f.mkdirs();
            }
            //out.print(su.getRequest().getParameter("user_nicheng"));     //获取表单值
            su.save( path );
            String h_picext = su.getFiles().getFile( 0 ).getFileExt();       //获取上传文件的后缀
            String h_picn = su.getFiles().getFile( 0 ).getFileName();        //获取文件上传的名字
            //用年月日信息对上传的文件命名
            SimpleDateFormat sdf = new SimpleDateFormat( "yyyyMMssHHmmssS" );
            Random ra = new Random();
            int nn = ra.nextInt( 999 );
            String h_picnewn = sdf.format( new Date() ) + "_" + String.format( "%03d", nn );
            String pathh = path + "/" + h_picn;                       //获取服务器上传的头像名字
            out.print( pathh );
            HttpRequest request=(HttpRequest)req;
            req.setAttribute(path,pathh);
        } catch (SmartUploadException e) {
            e.printStackTrace();
        } catch (SecurityException e) {
            //resp.sendRedirect( "/Tourist/Member/my_data.jsp" );//如果文件类型错误  页面进行跳转
        }
    }
}

