package com.shan;

import com.shan.method.Jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Text{
    public static void main(String[] args){
//        try {
//            BufferedImage i= ImageIO.read(new File("e:/a.png"));
//            Graphics2D g= (Graphics2D) i.getGraphics();
//            g.setColor( Color.BLUE );
//            g.setFont(new Font( "宋体",Font.BOLD,30 ));
//            g.drawString( "出不来，操！",100,200 );
//            ImageIO.write( i,"png",new File( "e:/b.png" ) );
//            g.dispose();;
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        Jdbc jdbc=new Jdbc();
        Connection conn=jdbc.jdbc_open();
        String sql="select back_carousel_name,back_carousel_url,back_carousel_image from back_carousel where flag='y'";
        List<Back_carousel> li=new ArrayList<Back_carousel>();
        try {
            PreparedStatement pst = conn.prepareStatement( sql );
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                Back_carousel my=new Back_carousel();
                my.setBack_carousel_name( rs.getString( "user_hpic_name" ) );
                my.setBack_carousel_url( rs.getString( "user_hpic_url" ) );
                my.setBack_carousel_image( rs.getString( "user_hpic_img" ) );
                li.add(my);
            }
            for (Back_carousel a:li) {
                System.out.print(a.getBack_carousel_name()+",");
                System.out.print(a.getBack_carousel_url()+",");
                System.out.println(a.getBack_carousel_image()+",");
            }
            rs.close();
            pst.close();
            jdbc.jdbc_close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
