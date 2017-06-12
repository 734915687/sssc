<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../css/back_login/back_login.css">
<script src="../unit/jquery-3.2.1.js"></script>
<html>
<head>
    <title>后台登陆</title>
</head>
<body>
<div class="login">
    姓名：<input type="text" id="name" name="name" placeholder="请输入登陆名" autofocus><br>
    密码：<input type="password" id="pwd" name="pwd" placeholder="请输入密码" autofocus><br>
    验证码： <input id="code" name="code" type="text" size="30" height="20" autofocus placeholder="请输入验证码">
    <img src="code.jsp" onclick="this.src='code.jsp?'+new Date();"><br>
    <input type="submit" value="登陆">

</div>
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
        $('input[type=submit]').click(function () {
            var name=$('#name').val();       //获取名字
            var pwd=$('#pwd').val();         //获取密码
            var code=$('#code').val();       //获取验证码
            $.ajax({
                type:'post',
                url:'/back_login.action',
                data:{name:name,pwd:pwd,code:code},
                dataType:'text',
                cache:false,
                success:function(d){
 //                   alert(d)
                    if(d==0){
                        window.location.href="/Tourist/back/back_index.jsp"  //页面跳转
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
</body>
</html>
