<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.List,com.stu_info_manage.dao.StudentBasicInfoDAO,com.stu_info_manage.bean.StudentBasicInfo,com.stu_info_manage.bean.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本信息</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
<meta
	content="郑州大学，学生信息管理系统"
	name="keywords">
<meta
	content="郑州大学，学生信息管理系统"
	name="description">
	<style type="text/css">
	
a.one:link {color:#ff0000;}
a.one:visited {color:#336666; }
a.one:hover {color:#ffcc00;font-size:150%;}
a.one:font-size: 300%
a.zero:link {color:#ff0000;}
a.zero:visited {color:#000000; }
a.zero:hover {color:#FF33FF;font-size:150%; border="1"}
a.zero:font-size: 300%
div.two{width:250px ;height:600px;line-height:300%;font-size: 150%;}
button.btn1{ width:64px; height:27px; text-align:center; float:left; font-size:12px; font-weight:lighter; font-family:Geneva, Arial, Helvetica, sans-serif; margin-right:15px; margin-top:5px; line-height:27px} 
button.btn1:hover{ color: #0b828e;} 
	
}
</style>

</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<br/><br/>
	<!-- 从request对象中获取一个JavaBean对象 -->
	<jsp:useBean id="basicinfo" class="com.stu_info_manage.bean.StudentBasicInfo" scope="request"></jsp:useBean>
	
	
  	<!-- 管理员页面开始 -->
  <div style="height:600px;"></div>
	<div style="position:absolute;top:45px;width:250px ;height:600px;;line-height:300%;font-size: 150%; background-color:#C0C0C0">
	<h2 >欢迎管理员登陆</h2>

			  <p>    <a class="one" href="manager/main.jsp" >学生信息管理</a>  </p>
			  <p>    <a class="one" href="manager/studentCourseTableUpdate.jsp" >学生课程管理</a></p>
              <p>    <a class="one" href="manager/selectedCourse.jsp" >学生成绩管理</a> </p>
              <p>    <a class="one" href="manager/managerSelectTimeTable.jsp" >课程表管理</a> </p>
              <p>    <a class="one" href="manager/changeStudentPwd.jsp" >重置学生密码</a> </p>
           
	</div>
	<div style=" position:absolute;
left:250px;
top:45px;
width:800px ;height:600px;line-height:300%; background-color:#CCCCFF">
<br><br>
	<form action="StudentBasicinfoServlet?type=managerSelect" method="post" onsubmit="return validate();">
<table border="1">
<tr  height="30" >
 <td width="100">登录账号</td>  <td width="150">学号</td><td width="100">姓名</td><td width="200">专业</td><td align="center" width="100">操作</td></tr>

<% StudentBasicInfoDAO dao=new StudentBasicInfoDAO();
          List<StudentBasicInfo> list=dao.managerSelectStudentBasicInfo(); 
          for(StudentBasicInfo tl:list)
            {
        	%>
        	   <tr>
        	    <td style="text-align:center"> <input type="checkbox" name="test" value=<%=tl.getStudentId()%> /><%=tl.getStudentId()%> </td>
        	    <td style="text-align:center"><%=tl.getStudentNumber() %></td>
        	    <td style="text-align:center"><%=tl.getRealName() %></td>
        	    <td style="text-align:center"><%=tl.getSpecility() %></td>
                <td>
                    
					 <button class="btn1"name="select" type="submit" value="<%=tl.getStudentId()%>">查看</button>
                     
					</td>
        	    <%} %>
</table>
                  <button class="btn1"  name="select" type="submit" value="delete">删除</button> 
        </form>
   	</div>            
   	  <div style=" position:absolute;left:700px;top:50px;width:280px ;height:120px;line-height:300%;font-size: 150%;">
						  <form action="StudentBasicinfoServlet?type=studentBasicInfoSelect" method="post" onsubmit="return validate();">
						  
                            <input class="tn-textbox" type="text" name="studentId" value="在此输入登录账号">
                            <input  style=" width:120px ;height:40px;" name="submit" type="submit" value="点击查看" >
                          
                           </form> 

				</div>	
		<div style="position:absolute;left:980px;top:90px;width:50px ;height:60px;font-size: 120%;border-width: 1px;background-color:#C0C0C0" align="center">
  <a class="zero" href="manager/addAccount.jsp" >添<br>加</a>
	</div>	
	
	<!-- 我的简历页面结束 -->
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>