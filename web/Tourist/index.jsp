<%@ page import="com.shan.method.Jdbc" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.shan.Back_carousel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="../unit/jquery-3.2.1.js"></script>
<script src="../css/index/index.js"></script>
<script src="../css/index/j.js"></script>
<script src="../css/index/ss.js"></script>
<link rel="stylesheet" href="../css/index/index.css">
<link rel="stylesheet" href="/unit/jquery-ui-1.12.1/jquery-ui.css">
<link rel="stylesheet" href="/unit/jquery-ui-1.12.1/style.css">
<script src="/unit/jquery-ui-1.12.1/jquery-1.12.4.js"></script>
<script src="/unit/jquery-ui-1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/unit/jquery-ui-1.12.1/themes/flick/jquery-ui.css">
<html>
  <head>
    <title>凡客商城</title>
  </head>
  <body>
  <div class="top">
    <div class="top_top">
      <p style="float: right">你好<a href="Member/my.jsp"style='text-decoration:none;'> ${username}</a>，欢迎光临凡客诚品！&nbsp;<a href="/Tourist/user_login.jsp">登录</a>|<a href="/Tourist/user_register.jsp">注册</a>&nbsp;&nbsp;&nbsp;<a href="">我的订单</a></p>
      <br><hr style="height:1px;border:none;border-top:1px solid #555555;" />
    </div>
      <script>
          $( function() {
              $( "#tags" ).autocomplete({
                  source: "search.action",
                  minLength: 1,
              });
          } );
      </script>
    <div class="ui-widget" style="float: right;margin-top: 20px">
      <label for="tags">搜索: </label>
      <input id="tags" type="text" name="key" placeholder="请输入想查询的商品名" autofocus>
    </div>


    <script type="text/JavaScript">
        window.onload=function(){
            var oUl=document.getElementById('one');
            var aLi=oUl.children;//获取第一级菜单的四个子标签
            for (i=0;i<aLi.length;i++) {
                aLi[i].onmouseover=function(){
                    this.children[0].style.display='block';
                };
                aLi[i].onmouseout=function(){
                    this.children[0].style.display='none';
                };
            }
        };
    </script>

    <p style="font-size: 20px"><a href="/Tourist/index.jsp"><img src="/css/index/red_title_VANCL.png" style="margin-top: 35px;margin-left: 120px" alt="凡客诚品" title="凡客诚品"></a>
    <div style="float: left;margin-left:350px;margin-top:-30px;position:absolute;z-index:1;">
    <ul id="one">
      <li class="one_list">&nbsp;&nbsp;首页&nbsp;|
        <ul class="two">
          <li>二级菜单</li>
          <li>二级菜单</li>
          <li>二级菜单</li>
          <li>二级菜单</li>
        </ul>
      </li>
      <li class="one_list">T恤&nbsp;&nbsp;&nbsp;|
        <ul class="two">
          <li>二级菜单</li>
          <li>二级菜单</li>
          <li>二级菜单</li>
          <li>二级菜单</li>
        </ul>
      </li>
      <li class="one_list">衬衫&nbsp;&nbsp;&nbsp;|
        <ul class="two">
          <li>二级菜单</li>
          <li>二级菜单</li>
          <li>二级菜单</li>
          <li>二级菜单</li>
        </ul>
      </li>
    <li class="one_list">C9&nbsp;&nbsp;&nbsp;|
      <ul class="two">
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
      </ul>
    </li>
    <li class="one_list">鞋&nbsp;&nbsp;&nbsp;|
      <ul class="two">
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
      </ul>
    </li>
    <li class="one_list">麻&nbsp;&nbsp;&nbsp;|
      <ul class="two">
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
      </ul>
    </li>
    <li class="one_list">水柔绵&nbsp;&nbsp;&nbsp;|
      <ul class="two">
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
      </ul>
    </li>
    <li class="one_list">&nbsp;&nbsp;裤装&nbsp;&nbsp;&nbsp;|
      <ul class="two">
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
      </ul>
    </li>
    <li class="one_list">外套&nbsp;&nbsp;&nbsp;
      <ul class="two">
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
        <li>二级菜单</li>
      </ul>
    </li>
    </ul>
  </div>
    </p>
  </div>
  <div class="body">
  <hr>
  <!-- 焦点展示图 -->
  <div class="focusBox" style="margin-top:150px;margin-left:100px;;">
    <ul class="pic">
      <%
        Jdbc jdbc=new Jdbc();
        Connection conn=jdbc.jdbc_open();
        String sql="select back_carousel_name,back_carousel_url,back_carousel_image from back_carousel where flag='y'";
        PreparedStatement pst=conn.prepareStatement( sql );
        ResultSet rs=pst.executeQuery();
        List li=new ArrayList();
        while(rs.next()){
          Back_carousel my=new Back_carousel();
          my.setBack_carousel_name( rs.getString( "back_carousel_name" ) );
          my.setBack_carousel_url( rs.getString( "back_carousel_url" ) );
          my.setBack_carousel_image( rs.getString( "back_carousel_image" ) );
          li.add(my);
        }
        for (Object o:li) {
          Back_carousel a=(Back_carousel)o;
          %>
      <li><a href="<%=a.getBack_carousel_url()%>" title="<%=a.getBack_carousel_name()%>"><img src="/upload/<%=a.getBack_carousel_image()%>"/></a></li>
      <%
        }
        pst.close();
        jdbc.jdbc_close();
      %>
    </ul>
    <a class="prev" href="javascript:void(0)"></a>
    <a class="next" href="javascript:void(0)"></a>
    <ul class="hd"></ul>
  </div><!-- 焦点展示图 结束-->
  <hr>
    <img src="../css/index/充值购买100.png"style="margin-top: 20px;margin-left: 100px">
    <h3 style="text-align: center;margin-top: 20px">夏季新品</h3>
    <!--商品显示-->
  <%
  %>
  </div>
  <div class="fotter">
1
  </div>
  </body>
</html>
