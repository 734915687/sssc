<%@ page import="com.shan.Back_notice" %>
<%@ page import="com.shan.method.back.Back_noticeDaoImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/back_index/back_index.css">
<html>
<head>
    <title>后台首页</title>
</head>
<body>
<div class="top">
    <div class="logo"></div><h1 style="margin-top: -90px;margin-left: 100px">凡客诚品</h1><p style="margin-left: 115px;margin-top: -20px"><a href="/Tourist/index.jsp"> www.index.com</a></p>
    <div class="top_title">
        <p>首页</p>
        <p>管理员</p>
        <p>商品分类</p>
        <p>订单</p>
        <p>商品详情</p>
        <p>公告</p>
    </div>
    <div class="top_time">
        <div style="margin-top: 7px;color: #ff22dc;" >管理员<%= session.getAttribute("backname")%>你好，今天是<div id="showtimes" style="float: right"></div></div>
    </div>
</div>
<script type="text/javascript" language="javascript">
    function show_cur_times(){
//获取当前日期
        var date_time = new Date();
        //定义星期
        var week;
        //switch判断
        switch (date_time.getDay()){
            case 1: week="星期一"; break;
            case 2: week="星期二"; break;
            case 3: week="星期三"; break;
            case 4: week="星期四"; break;
            case 5: week="星期五"; break;
            case 6: week="星期六"; break;
            default:week="星期天"; break;
        }

        //年
        var year = date_time.getFullYear();
        //判断小于10，前面补0
        if(year<10){
            year="0"+year;
        }

        //月
        var month = date_time.getMonth()+1;
        //判断小于10，前面补0
        if(month<10){
            month="0"+month;
        }

        //日
        var day = date_time.getDate();
        //判断小于10，前面补0
        if(day<10){
            day="0"+day;
        }

        //时
        var hours =date_time.getHours();
        //判断小于10，前面补0
        if(hours<10){
            hours="0"+hours;
        }

        //分
        var minutes =date_time.getMinutes();
        //判断小于10，前面补0
        if(minutes<10){
            minutes="0"+minutes;
        }

        //秒
        var seconds=date_time.getSeconds();
        //判断小于10，前面补0
        if(seconds<10){
            seconds="0"+seconds;
        }

        //拼接年月日时分秒
        var date_str = year+"年"+month+"月"+day+"日 "+hours+":"+minutes+":"+seconds+" "+week+"。";

        //显示在id为showtimes的容器里
        document.getElementById("showtimes").innerHTML= date_str;

    }

    //设置1秒调用一次show_cur_times函数
    setInterval("show_cur_times()",100);
</script>
<div class="body">
    <div class="body_left">
        <table class="lefttb">
            <tr><td class="lefttb_title">管理员管理</td></tr>
            <tr><td class="lefttb_manage"><img src="/css/back_index/pinkpic.png">管理员管理</td>
                <td class="lefttb_add">新增</td></tr>
            <tr><td class="lefttb_title">商品分类管理</td></tr>
            <tr><td class="lefttb_manage"><img src="/css/back_index/pinkpic.png">大分类管理</td>
                <td class="lefttb_add">新增</td></tr>
            <tr><td class="lefttb_manage"><img src="/css/back_index/pinkpic.png">小分类管理</td>
                <td class="lefttb_add">新增</td></tr>
            <tr><td class="lefttb_title">订单管理</td></tr>
            <tr><td class="lefttb_manage"><img src="/css/back_index/pinkpic.png">订单管理</td>
                <td class="lefttb_add">新增</td></tr>
            <tr><td class="lefttb_title">商品详细管理</td></tr>
            <tr><td class="lefttb_manage"><img src="/css/back_index/pinkpic.png">商品详细管理</td>
                <td class="lefttb_add">新增</td></tr>
            <tr><td class="lefttb_title">公告管理</td></tr>
            <tr><td class="lefttb_manage"><img src="/css/back_index/pinkpic.png">公告管理</td>
                <td class="lefttb_add"><a href="back_notice.jsp"> 新增</a></td></tr>
            <tr><td class="lefttb_title">轮播管理</td></tr>
            <tr><td class="lefttb_manage"><img src="/css/back_index/pinkpic.png">轮播管理</td>
                <td class="lefttb_add"><a href="back_carousel.jsp"> 新增</a></td></tr>
        </table>
    </div>
    <div class="body_right">
         <div class="body_right_body">
             <p style="font-size: 40px;font-weight: bold">后台管理</p>
             <div class="body_t1_div">
             <table class="body_t1">
             <%
                 Back_notice a=new Back_notice();
                 Back_noticeDaoImpl bn=new Back_noticeDaoImpl();
                 //记录数据库总条数
                 int sum=bn.Select_count();
                 //记录每页显示条数
                 int pagesize =4;
                 //求出总页数
                 int pagecount=sum%pagesize==0?(sum/pagesize):(sum/pagesize)+1;
                 //设定当前页
                 int currpage=request.getParameter( "p" )==null?1:Integer.parseInt( request.getParameter( "p" ) );
                 //判断当前页是否过界
                 if(currpage<1) currpage=1;
                 if (currpage>pagecount) currpage=pagecount;
                 //打印查询
                 for (Object o:bn.Select( a,(currpage*pagesize-pagesize),(pagesize) )){
                     Back_notice bnn= (Back_notice) o;
                     %>
                 <tr>
                  <td><%=bnn.getNotice_name()%></td>
                  <td><%=bnn.getNotice_time()%></td>
                  <td><%=bnn.getNotice_value()%></td>
                  <td><a href="/back_index.action?id=<%=bnn.getNotice_id()%>&&acction=delete"onclick="return deletee()">删除</a></td>
                  <script>
                      function deletee() {
                          var deletee=confirm("数据删除后无法恢复，您确定要删除吗？")
                          return deletee
                      }
                  </script>
              </tr>
             <%
                 }
             %>
                 <tr>
                     <td colspan="100">
                         <a href="?p=1">首页</a>
                         <a href="?p=<%=currpage-1==0?1:currpage-1%>">上一页</a>
                         <a href="?p=<%=currpage+1==pagecount+1?pagecount:currpage+1%>">下一页</a>
                         <a href="?p=<%=pagecount%>">末页</a>
                     </td>
                 </tr>
             </table>
             </div>
         </div>
    </div>
</div>

<div class="fotter">

</div>
</body>
</html>
