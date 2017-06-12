<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script language="javascript" type="text/javascript" src="/unit/My97DatePicker/WdatePicker.js"></script>
<html>
<head>
    <link rel="stylesheet" href="/css/my_data/my_data.css">
    <link rel="stylesheet" href="/unit/Jcrop-0.9.12/css/jquery.Jcrop.css">
    <script src="/unit/jquery-3.2.1.js"></script>
    <script src="/unit/Jcrop-0.9.12/js/jquery.Jcrop.js"></script>
    <title>我的凡客</title>
    <style type="text/css">
        ul li{
            list-style: none;
        }
    </style>
</head>
<body>
<div class="top">
    <div class="top_top">
    </div>
</div>
<div class="body">
    <div class="body_left">
        <table>
            <tr><td>1</td></tr>
            <tr><td>2</td></tr>
            <tr><td>3</td></tr>
            <tr><td>4</td></tr>
            <tr><td>5</td></tr>
            <tr><td>6</td></tr>
            <tr><td>7</td></tr>
            <tr><td>8</td></tr>
            <tr><td>9</td></tr>
            <tr><td>10</td></tr>
            <tr><td>11</td></tr>
            <tr><td>12</td></tr>
            <tr><td>13</td></tr>
            <tr><td><a href="my_data.jsp"> 我的资料</a></td></tr>
            <tr><td>15</td></tr>
        </table>
    </div>
    <!--<form action="/my_data.action" method="post"enctype="multipart/form-data" onsubmit="checkCoords()">-->
        <form action="/my_data.action" method="post"enctype="multipart/form-data" onsubmit="checkCoords()">
    <div class="body_right">
     <table>
         <tr>
             <td>我的资料</td>
         </tr>
         <tr>
             <td>基本资料</td>
             <td>详细资料</td>
             <td>身材/偏好</td>
         </tr>
     </table>
            <ul>
                <li><input type="radio" name="head_pic" checked onclick="switchItem('0')">选择头像</li>
                <li><input type="radio" name="head_pic" onclick="switchItem('1')">上传头像</li>
            </ul>
        <div class="head_pic1" id="s1" style="display: none">
            <table>
                <tr>
                    <td><input type="image" src="/css/my_data/pic1.jpg" onclick="show_pic()"></td>
                    <td><input type="image" src="/css/my_data/pic2.jpg"></td>
                    <td><input type="image" src="/css/my_data/pic3.jpg"></td>
                </tr>
                <tr>
             <td><input type="image" src="/css/my_data/pic4.jpg"></td>
             <td><input type="image" src="/css/my_data/pic5.jpg"></td>
             <td><input type="image" src="/css/my_data/pic6.jpg"></td>
         </tr>
         <tr>
             <td><input type="image" src="/css/my_data/pic7.jpg"></td>
             <td><input type="image" src="/css/my_data/pic8.jpg"></td>
             <td><input type="image" src="/css/my_data/pic9.jpg"></td>
         </tr>
            </table>
            <div class="show_pic">
            显示图片
        </div>
            </div>
        <div class="head_pic1" id="s2" style="display: none">
            <ul>
                <li><input type="file" name="head_file"value="选择文件"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li><span style="font-size: 12px;">请确保文件为大小不超过200k，格式为jpg、png的图片。</span></li>
            </ul>
            <%
            %>
            <script>
                //头像裁剪
                $(function () {
                    //$('#head_face').Jcrop();
                })
                $(function () {
                    $('#head_face').Jcrop({
                        aspectRatio:1,
                        onSelect:updateCoords
                    });
                });

                function updateCoords(c) {
                    $('#hpic_x').val(c.x);
                    $('#hpic_y').val(c.y);
                    $('#hpic_w').val(c.w);
                    $('#hpic_h').val(c.h);
                }
                function checkCoords()
                {
                    if (parseInt($('#hpic_w').val())) return true;
                    alert('请选择');
                    return false;
                };
                function oo() {
                    $('#sub').click(function () {
                        $.ajax({
                            type:'post',
                            url:'/my_data_hpic.action',
                            data:'name=name',
                            dataType:'text',
                            cache:false,
                            success:function(d){
                                alert(d)
                            }
                        })
                    })
                }


            </script>
            <div style="margin-left: 75px">
            <img src="/css/my_data/vancl300.jpg"id="head_face">
                <input type="button" value="保存图片" id="sub" onclick="oo()">
                <input type="hidden" id="hpic_x" name="hpic_x"/>
                <input type="hidden" id="hpic_y" name="hpic_y"/>
                <input type="hidden" id="hpic_w" name="hpic_w"/>
                <input type="hidden" id="hpic_h" name="hpic_h"/>
            </div>
        </div>
        <table>
         <tr>
             <td>用户名：数据库取值<input type="text" id="user_name" name="user_name"size="20"onblur="show_pic()"></td>
         </tr>
         <tr>
             <td>为了您账户的安全，请 验证手机和验证邮箱</td>
         </tr>
         <tr>
             <td>昵&nbsp;&nbsp;&nbsp;&nbsp;称：<input type="text" id="user_nicheng" name="user_nicheng"size="20"></td>
         </tr>
            <tr>
                <td>性&nbsp;&nbsp;&nbsp;&nbsp;别：
                <input type="radio" name="user_sex" id="sex1" checked>男<input type="radio" name="user_sex" id="sex2" checked>女</td>
            </tr>
            <tr>
                <td>出生日期：<input  type="text" onClick="WdatePicker()">注意：出生日期填写后将不可修改，请认真填写，谢谢！</td>
            </tr>
            <tr>
                <td>收信邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="user_mail" name="user_mail"size="20">去验证》</td>
            </tr>
            <tr>
                <td>地&nbsp;&nbsp;&nbsp;&nbsp;区：<select id="province" onchange="chagecity()" style="width: 100px" ><option>--选择省份--</option></select>
                    <select id="selcity" style="width: 100px" ><option>--选择城市--</option></select>
                </td>
            </tr>
            <tr>
                <td>详细地址：<input type="text" id="user_adress" name="user_adress"size="20"></td>
            </tr>
            <tr>
                <td>邮政编码：<input type="text" id="user_postcode" name="user_postcode"size="20"></td>
            </tr>
            <tr>
                <td>手&nbsp;&nbsp;&nbsp;&nbsp;机：数据库取值<input type="text" id="user_phone" name="user_phone"size="20"onblur="show_pic()"></td>
            </tr>
            <tr>
                <td><input type="image" src="/css/my_data/keep.png"></td>
            </tr>
     </table>
   </div>
    </form>

</div>

<div class="fotter">
</div>
<script type="text/javascript">
    var cityList=new Array();
    cityList['北京市']=['朝阳区','东城区','西城区'];
    cityList['河南省']=['安阳市','郑州市','信阳市'];
    cityList['广州省']=['广州市','惠州市','珠海市'];
//元素下表是属性
    function allcity() {
        //获取select对象
        var province=document.getElementById("province");
        for(var i in cityList){
            province.add(new Option(i,i),null);
        }
    }
    window.onload=allcity();

    function chagecity() {
        //获取省份
        var province = document.getElementById("province").value;
        //获取市
        var city = document.getElementById("selcity");
        city.options.length = 0;
        for (var i in cityList) {
            if (i == province) {
                for (var ii in cityList[i]) {
                    city.add(new Option(cityList[i][ii], cityList[i][ii]), null);
                }
            }
        }
    }
    function show_pic() {
        //测试获取头像的路径
        var url=$('input[name=image]').attr("src");
        alert(url);
        alert("qqq");
    }

    function switchItem(tag){
        var s1 = document.getElementById('s1');
        var s2 = document.getElementById('s2');
        if(tag=='0'){
            s1.style.display = '';
            s2.style.display = 'none';
        }
        else{
            s1.style.display = 'none';
            s2.style.display = '';
        }
    }
    window.onload=switchItem('1');
</script>
</body>
</html>
