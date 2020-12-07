<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<body >

<tr>
<td>
<a href="${pageContext.request.contextPath }/IAbypictuter">wefwefwef</a></td>
<form action="/api/fileupload/demo1" id="domeform" method="post" enctype="multipart/form-data">
    <input type="file" name="file" value="选择文件">
    <input type="submit" value="表单提交">
    <input type="button" value="ajax提交" id="ajaxsub">
    <input type="button" value="formdata提交" id="ormdatasub">
</form>
</tr>
 
</body>
</html>
