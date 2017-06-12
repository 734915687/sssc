package com.shan.method.back;
import com.shan.Back_goodsclass;
import com.shan.method.Jdbc;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Back_goodsclassDaoImpl implements Back_goodsclassDao {
    Jdbc jdbc=new Jdbc();
    private PreparedStatement pst;
    private String sql;
    //增
    @Override
    public int Add(Back_goodsclass a) {
        return 0;
    }
    //删
    @Override
    public int Delete(int a) {
        return 0;
    }
    //改
    @Override
    public int Update(Back_goodsclass a) {
        return 0;
    }
    //查
    @Override
    public List<Back_goodsclass> Select(Back_goodsclass a) {
        sql="select * from goodsclass order by CONCAT(goodsclass_path,goodsclass_id);";
        List<Back_goodsclass> li=new ArrayList<Back_goodsclass>(  );
        try {
            pst=jdbc.jdbc_open().prepareStatement( sql );
           ResultSet rs=pst.executeQuery();
           while (rs.next()){
               Back_goodsclass bg=new Back_goodsclass();
               bg.setGoodsclass_id(rs.getString( "goodsclass_id" ));
               bg.setGoodsclass_name(rs.getString( "goodsclass_name" ));
               bg.setGoodsclass_pid(rs.getString( "goodsclass_pid" ));
               bg.setGoodsclass_path(rs.getString( "goodsclass_path" ));
               li.add( bg );
           }
           rs.close();
           pst.close();
           jdbc.jdbc_close();

        }catch (SQLException e){
            e.printStackTrace();
        }
        return li;

    }

    public PreparedStatement getPst() {
        return pst;
    }

    public void setPst(PreparedStatement pst) {
        this.pst = pst;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public static void main(String[] args) {
        //System.out.println( "$$" );
        System.out.println( "$$" );
        Back_goodsclassDaoImpl s = new Back_goodsclassDaoImpl();
        Back_goodsclass ad = new Back_goodsclass();
        System.out.println( "****" );
        for (Object o : s.Select( ad)) {
            Back_goodsclass bn = (Back_goodsclass) o;
            System.out.print( bn.getGoodsclass_id() );
            System.out.print( bn.getGoodsclass_name() );
            System.out.print( bn.getGoodsclass_pid() );
            System.out.println( bn.getGoodsclass_path() );


        }
    }
}