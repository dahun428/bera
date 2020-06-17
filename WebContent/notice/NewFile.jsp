<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%


String url = this.getClass().getResource("").getPath(); 
String path = url.substring(1,url.indexOf(".metadata")) + "semi-project/image/NOTICE";

String directory = path;
String directory2 = application.getInitParameter("saveDirectoryNotice");
String directory3 = "C:\\project\\web_workspace\\semi-project\\WebContent\\image\\NOTICE";

out.println("path 1: " + path);
out.println("<br />");
out.println("path 2 : " + directory2);
out.println("<br />");
out.println(directory3);
boolean temp = directory.equals(directory3);
out.println(temp);


%>
</body>
</html>