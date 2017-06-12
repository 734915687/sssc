<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/unit/Jcrop-0.9.12/css/jquery.Jcrop.css">
<script src="/unit/jquery-3.2.1.js"></script>
<script src="/unit/Jcrop-0.9.12/js/jquery.Jcrop.js"></script>
<html>
<head>
    <title>轮播管理</title>
</head>
<body>
<h3>添加新的轮播展示</h3>
<form action="/my_datatext.action?acction=add" method="post"enctype="multipart/form-data">
    标题描述：<input type="text" name="litle"><br>
    链接：<input type="text" name="url" value="#"><br>
    展示图片：<input type="file" name="img"><br>
    是否显示：
    <input type="radio" name="flag" value="y"checked><br>
    <input type="radio" name="flag" value="n"><br>

    <input type="submit" value="提交">
</form>
</body>
</html>
