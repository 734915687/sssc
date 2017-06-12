<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/back_notice/back_notice.css">
<html>
<head>
    <title>公告管理</title>
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
        <div style="margin-top: 7px;color: #ff22dc;" >管理员你好，今天是<div id="showtimes" style="float: right"></div></div>
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
        <form action="/back_notice.action" method="post">
        <div class="body_right_title">
             <p class="body_right_title_txt">新增公告</p>
        </div>
        <div class="body_right_ueditor" >
            <!-- 加载编辑器的容器 -->
        <script id="container" name="content" type="text/plain">
                                      现在在想些什么呢？</script>
        <!-- 配置文件 -->
        <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
        <!-- 编辑器源码文件 -->
        <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
        <!-- 预防中文乱码 -->
        <script type="text/javascript" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
        <!-- 实例化编辑器 -->
        <script type="text/javascript">
            var fpg={
                elementPathEnabled : false,
            initialFrameWidth:750,  //初始化编辑器宽度,默认1000
            initialFrameHeight:180,  //初始化编辑器高度,默认320
                maximumWords:100,     //最多文本数
                emotionLocalization:true, //是否开启表情本地化，默认关闭。若要开启请确保emotion文件夹下包含官网提供的images表情文件夹
                enterTag:'brr',
                toolbars: [[
                'undo', 'redo', '|',
                'bold', 'italic',  'backcolor', 'fontfamily', 'fontsize', '|',
                'directionalityltr', 'directionalityrtl', 'indent', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                'simpleupload', 'insertimage', 'emotion', 'scrawl', 'attachment', 'map', 'background', '|',
                'horizontal', 'date', 'time',  '|',
                 'help'
            ]]

            }
            var ue = UE.getEditor('container',fpg);
        </script>
            <input type="submit" value="提交" style="margin-left: 730px">
        </div>
        </form>
    </div>


</div>

<div class="fotter">

</div>
</body>
</html>
