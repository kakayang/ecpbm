<%--
  Created by IntelliJ IDEA.
  User: didi
  Date: 2020/2/6
  Time: 9:01 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; ISO-8859-1" %>
<html>
<head>
    <title>电子商务平台--后台登录页</title>
    <%--   引入EasyUI的相关css和js文件 --%>
    <link href="jquery-easyui-1.7.0/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="jquery-easyui-1.7.0/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="jquery-easyui-1.7.0/demo/demo.css" rel="stylesheet" type="text/css" />
    <script src="jquery-easyui-1.7.0/jquery.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.7.0/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.7.0/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>
<body>
    <script type="text/javascript">
        function clearForm() {
            $('#adminLoginForm').form('clear');
        }
        function checkAdminLogin() {
            $('#adminLoginForm').form('submit',{
                url:'admininfo/login',
                success:function (result) {
                    var result = eval('('+result+')');
                    if (result.success == 'true'){
                        window.location.href == 'admin.jsp';
                        $("#adminLoginDlg").dialog("close");
                    }else {
                        $.messager.show({
                            title: "提示信息",
                            msg: result.message
                        });
                    }
                }
            });

        }
    </script>

    <div id="adminLoginDlg" class="easyui-dialog" style="left: 550px;top: 200px;width: 300px;height: 200px" data-options="title:'后台登录',buttons:'#bb',modal:true">
        <form id="adminLoginForm" method="post">
            <table style="margin: 20px;font-size: 13px;">
                <tr>
                    <th>用户名</th>
                    <td><input class="easyui-textbox" type="text" id="name" name="name" data-options="required:true" value="admin"></td>
                </tr>
                <tr>
                    <th>密码</th>
                    <td><input class="easyui-textbox" type="text" id="pwd" name="pwd" data-options="required:true" value="123456"></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="bb">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="checkAdminLogin()">登录</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
    </div>
</body>
</html>
