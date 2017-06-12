package com.shan.servlet.back;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.shan.method.Jdbc;

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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@WebServlet("/my_datatext.action")
public class back_carousel_servlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding( "utf-8" );
        String acction=req.getParameter( "acction");//获取前台的值
        PrintWriter out=resp.getWriter();
        SmartUpload su = new SmartUpload();
        // 上传初始化
        JspFactory fac=JspFactory.getDefaultFactory();
        PageContext pageContext=fac.getPageContext(this, req,resp, null,
                false, JspWriter.DEFAULT_BUFFER, true);
        su.initialize(pageContext);
        try {
            su.setAllowedFilesList("jpg,png");                                 //设置上传文件的格式
            su.upload();      //启动
            // su.setMaxFileSize( 1024*200 );                                    //设置上传文件最大大小
            String path=req.getServletContext().getRealPath("upload");    //在当前路径下建立文件夹
            File f=new File(path);
            if (!f.exists()){                                                    //判断该文件是否存在
                f.mkdirs();
            }
            //out.print(su.getRequest().getParameter("user_nicheng"));     //获取表单值
            //su.save( path );
            String h_picext=su.getFiles().getFile( 0 ).getFileExt();       //获取上传文件的后缀
            String h_picn=su.getFiles().getFile( 0 ).getFileName();        //获取文件上传的名字
            //用年月日信息对上传的文件命名
            SimpleDateFormat sdf=new SimpleDateFormat( "yyyyMMssHHmmssS" );
            Random ra=new Random();
            int nn=ra.nextInt(999);
            String h_picnewn=sdf.format(new Date(  ))+"_"+String.format( "%03d",nn );
            //获取上传的文件
            com.jspsmart.upload.File fs=su.getFiles().getFile( 0 );
            String pathh=path+"/"+h_picn;                       //获取服务器上传的头像名字
            String pathhh=path+"/"+h_picnewn+"."+h_picext;     //获取服务器更改后的名字
            fs.saveAs(pathhh);
            switch (acction){
            case "add":
                String tltle=su.getRequest().getParameter("litle");
                String url=su.getRequest().getParameter("url");
                String flag=su.getRequest().getParameter("flag");
                Jdbc jdbc=new Jdbc();
                Connection conn=jdbc.jdbc_open();
                String sql="insert into back_carousel(back_carousel_name,back_carousel_url,back_carousel_image,flag)values(?,?,?,?)";
                PreparedStatement pst=conn.prepareStatement( sql );
                pst.setString( 1, tltle);
                pst.setString( 2, url);
                pst.setString( 3, h_picnewn+"."+h_picext);
                pst.setString( 4, flag);
                pst.executeUpdate();
                pst.close();
                jdbc.jdbc_close();
                out.println(h_picext+"**********************");
                out.print(h_picn);
                break;
            case "delete":
                break;
            case "update":
                break;
                default:
                    break;
        }
    } catch (SmartUploadException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
