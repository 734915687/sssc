<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>二级联动菜单</title>
    <script language="javascript" type="text/javascript">
        function gets(){
            var shi=[
                ["广元市","成都市","德阳市","绵阳市","雅安市","宜宾市","南充市","遂宁市"],
                ["沧州市","hjtf"],
                ["深圳市","珠海市","汕头市","佛山市","韶关市","南雄市","河源市","梅州市","惠州市","汕尾市","东莞市","中山市","江门市"]
            ];
            var ss=document.forms["form1"].elements["ss"];
            var si=document.forms["form1"].elements["shi"];
            var selectshi=shi[ss.selectedIndex-1];
            si.length=1;
            for(var a=1;a<=selectshi.length;a++){
                si[a]=new Option(selectshi[a-1],selectshi[a-1]);
            }
        }
    </script>
</head>
<body>
<div>
    <h5>    二级联动菜单的使用</h5>
</div>
<form action="" method="post" name="form1">
    你的所在地
    <select name="ss" onChange="gets();">
        <option value="0">请选择所在的省份</option>
        <option value="1">四川省（川、蜀） </option>
        <option value="2">河北省（冀 ）</option>
        <option value="3">广东省(粤)</option>
    </select>
    <select name="shi">
        <option value="0">请选择所在的城市</option>
    </select>
</form>
</body>
</html>