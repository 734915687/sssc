<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head id="Head1"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>
</title><link href="/css/user_login/login.css" rel="stylesheet" type="text/css"><link href="/css/user_login/footer.css" rel="stylesheet" type="text/css"><link href="/css/user_login/css.ashx" rel="stylesheet" type="text/css"><link rel="shortcut icon" href="https://ssl.vanclimg.com/common/favicon/favicon.ico" type="image/x-icon">
    <script type="text/javascript" language="javascript" src="/css/user_login/js.ashx"></script>
    <script src="../unit/jquery-3.2.1.js"></script>
    <script type="text/javascript" language="javascript" src="/css/user_login/script.ashx"></script>
    <script type="text/javascript" language="javascript" src="/css/user_login/login.js"></script>
<body>
    <div id="Headd" style="height: 40px">
        <a href="/Tourist/index.jsp"><img src="/css/user_login/red_title_VANCL.png" style="margin-top: 12px;margin-left: 50px" alt="凡客诚品" title="凡客诚品"></a>
        <p style="text-align: right;margin-top: -20px;margin-right: 70px">
            <a href="http://help.vancl.com/" target="_blank">帮助</a>
        </p>
    </div>

    <div class="wrapper">
        <div style="width: 100%; height: 25px; position: relative;">
            <h3 style="font-size: 22px; color: #979797; font-weight: bolder; text-align: left;
                height: 25px; line-height: 25px; float: right; margin: 0 100px 0 0; width: 400px;
                position: relative;">
                 凡客 Vancl 登录 <span style="font-size: 14px; font-weight: normal; position: absolute;
                    right: 0px; bottom: 0px;">没有账户免费<a href="user_register.jsp" style="color: #b42025;
                        margin: 0px;">注册</a> </span>
            </h3>
        </div>
        <div class="login">
            <div class="tag">
                    <ul id="tags">
                <li class="on">普通登录</li>
            </ul>
        </div>
        <!--tag-->
        <div id="shows">
            <div class="user_infor" style="display: block;">
                <div id="vanclLoginError" class="tips">
                    用户名或者密码错误!
                </div>
                <input id="name" name="name" type="text" size="30" height="20" autofocus placeholder="请输入用户名"><br><br><br>
                <input id="pwd" name="pwd" type="text" size="30" height="20" autofocus placeholder="请输入密码"><br><br>
                <input id="code" name="code" type="text" size="30" height="20" autofocus placeholder="请输入验证码">
                <img src="code.jsp" onclick="this.src='code.jsp?'+new Date();">
                <div class="bt">
                    <a class="forget" href="https://login.vancl.com/login/GetPwdStep1.aspx">找回密码</a>
                    <div class="clear">
                    </div>
                    <input type="image" src="/css/user_login/red_login.png">
                </div>
            </div>

            <!-- 横线 -->
            <div class="lines">
            </div>
            </div>
            <!--tishi-->
        </div>
        <!--user_infor-->


        </div>
    </div>
    <div class="advert">
        <img src="/css/user_login/login120412_newlogo.jpg" id="_advertImage" style="width: 465px; display: none">
        <img src="/css/user_login/login120412_newlogo(1).jpg" style="width: 465px">
    </div>
    <!--shows-->
    <div style="clear: both;">
    </div>
</div>
<center>

    <div id="bottom" align="center">
        <div id="bottoms">
            <p class="bZp3">Copyright 2007 - 2016 vancl.com All Rights Reserved 京ICP证100557号 京公网安备11010102000579号 出版物经营许可证新出发京批字第直110138号</p>
            <div id="footerArea">
                <div class="subFooter"><a href="https://search.szfw.org/cert/l/CX20111229001302001330"><img src="/css/user_login/footer_1.png"></a><img src="/css/user_login/footer_2.png"><a href="http://www.315online.com.cn/member/315090053.html"><img src="/css/user_login/footer_3.png"> </a><a rel="nofollow" href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202010081900017"><img src="/css/user_login/footer_4.png"></a></div>
            </div>
        </div>
    </div>
</center>
<script>
    //测试是否能接到值
    /*function oo() {
     var name=$('#name').val();
     var pwd=$('#pwd').val();
     var code=$('#code').val();
     alert(name);
     alert(pwd);
     alert(code);
     }*/

    $(function(){
        $('input[type=image]').click(function () {
            var name=$('#name').val();       //获取名字
            var pwd=$('#pwd').val();         //获取密码
            var code=$('#code').val();       //获取验证码
            $.ajax({
                type:'post',
                url:'/user_login.action',
                data:{name:name,pwd:pwd,code:code},
                dataType:'text',
                cache:false,
                success:function(d){
//                    alert(d)
                    if(d==0){
                        window.location.href="/Tourist/index.jsp"  //页面跳转
 //                   }
                }
                else{
                        alert("对不起，您的输入有误，请从新输入.")
                    }
                }
            })
        })
    })
</script>
<script type="text/javascript">
</script>

<script src="/css/user_login/quicklogin.js"></script>


</body></html>