<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/unit/jquery-3.2.1.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml"><head id="Head1"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><title>

    凡客诚品 - 会员免费注册
</title>
    <script type="text/javascript" language="javascript"></script>


    <link href="/css/user_register/reg.css" type="text/css" rel="stylesheet">
</head>
<body id="body" class="wrapper">
<div id="top" style="margin:10px 0 0 0;padding:0 0 10px 0; border-bottom:solid 1px #919191;">
    <a href="/Tourist/index.jsp"><img src="/css/user_register/logo_new.jpg" alt="凡客诚品" title="凡客诚品" style="cursor:pointer"></a></div>
    <span class="box15"></span>
    <div class="regist">
        <h1>
            注册新用户 <span>我已经注册，现在就<a href="user_login.jsp">登录</a></span>
        </h1>
        <div style="width: 100%; height: 10px; overflow: hidden; clear: both;">
        </div>
        <div class="content_left">
                                    <input id="phone" name="phone" type="text" size="30" height="30" autofocus placeholder="请输入手机号"><br><br><br>
                                    <input id="pwd" name="pwd" type="text" size="30" height="30" autofocus placeholder="请输入密码"><br><br>
                                    <input id="conpwd" name="conpwd" type="text" size="30" height="30" autofocus placeholder="再次输入密码"><br><br>
                                    <input id="code" name="code" type="text" size="30" height="20" autofocus placeholder="请输入验证码">
                                    <img src="code.jsp" onclick="this.src='code.jsp?'+new Date();">
                            <div class="v2reg_bt">
                                <input type="image" src="/css/user_register/register.png">
                            </div>
                </div>
                <!--email-->
            </div>
            <!--infor-->
        </div>
        <!--content_left-->
        <div class="content_right">
            <img src="/css/user_register/login120412_newlogo.jpg" id="ContentPlaceHolder1__advertImage" style="width: 465px; display: none">
            <img src="/css/user_register/login120412_newlogo(1).jpg" style="width: 465px">
        </div>
        <!--content_right-->
        <div class="clear">
        </div>
    </div>
    <!--regist-->
    <input name="hdn_RegisterType" id="hdn_RegisterType" type="hidden" value="phone">
    <input name="hdn_ResourceHref" id="hdn_ResourceHref_name" type="hidden" value="http://catalog.vancl.com/jgwzt.html?http%3A%2F%2Fcatalog.vancl.com%2Fjgwzt.html%23ref%3Dhp-hp-jpzk-2_1-v%3An">
    <!--wrapper-->
</form>
<script type="text/javascript">

</script>



    <div id="bottom" align="center">
        <div id="bottoms">
            <p class="bZp3">Copyright 2007 - 2016 vancl.com All Rights Reserved 京ICP证100557号 京公网安备11010102000579号 出版物经营许可证新出发京批字第直110138号</p>
            <div id="footerArea">
                <div class="subFooter"><a href="https://search.szfw.org/cert/l/CX20111229001302001330"><img src="/css/user_login/footer_1.png"></a><img src="/css/user_login/footer_2.png"><a href="http://www.315online.com.cn/member/315090053.html"><img src="/css/user_login/footer_3.png"> </a><a rel="nofollow" href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202010081900017"><img src="/css/user_login/footer_4.png"></a></div>
            </div>
        </div>
    </div>
<!--javascript-->


<script type="text/JavaScript" src="/css/user_register/js(1).ashx" language="javascript"></script>



<script type="text/javascript" language="javascript" src="/css/user_register/js(2).ashx"></script>

<script>
    //测试是否能接到值
    /*function oo() {
     var phone=$('#phone').val();
     var pwd=$('#pwd').val();
     var conpwd=$('#conpwd').val();
     var code=$('#code').val();
     alert(phone);
     alert(pwd);
     alert(conpwd);
     alert(code);
     }
*/
    $(function(){
        $('input[type=image]').click(function () {
            var phone=$('#phone').val();       //获取电话
            var pwd=$('#pwd').val();         //获取密码
            var conpwd=$('#conpwd').val();   //获取再次输入密码
            var code=$('#code').val();       //获取验证码
            $.ajax({
                type:'post',
                url:'/user_register.action',
                data:{phone:phone,pwd:pwd,conpwd:conpwd,code:code},
                dataType:'text',
                cache:false,
                success:function(d){
                    if(d==0){
                        window.location.href="/Tourist/index.jsp"  //页面跳转
                    }
                    else{
                        alert("对不起，您的输入有误，请重新输入。")
                    }
                }
            })
        })
    })
</script>
</body></html>