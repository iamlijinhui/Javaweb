<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.stu_info_manage.dao.StudentTimeTableDAO,com.stu_info_manage.bean.StudentTimeTable,com.stu_info_manage.bean.Student"%>
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
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<meta
	content="郑州大学，学生信息管理系统"
	name="keywords">
<meta
	content="郑州大学，学生信息管理系统"
	name="description">

</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<br/><br/>
	<!-- 从request对象中获取一个JavaBean对象 -->
	<jsp:useBean id="timetable" class="com.stu_info_manage.bean.StudentTimeTable" scope="request"></jsp:useBean>
	
  	<!-- 我的基本信息页面开始 -->
  
	<div class="resume_con">
		<!--tab设置-->
		<div class="user_operate">
			<ul style="float: left">
			   <li>  <a href="StudentBasicinfoServlet?type=select">我的基本信息</a></li>   
			   <li > <a href="student/studentCourseTable.jsp">我的选课</a></li>   
                <li > <a href="student/studentSelectScore.jsp">我的成绩表</a></li>   
                 <li > <a href="student/studentTimeTable.jsp">我的课程表</a></li>    
                <li > <a href="student/changepwd.jsp">修改密码</a></li>    
			</ul>
			<div class="clear"></div>
		</div>    
		<!--主体部分-->
		<div>
		<%
          StudentTimeTableDAO dao=new StudentTimeTableDAO();
		   String[] s=new String[]{" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "};
		   s[0]="qqq";
		   int i=0;
          List<StudentTimeTable> list=dao.selectCT(); 
            
          for(StudentTimeTable tl:list)
            {
        	   
            	s[i]=tl.getCourseName()+"  "+tl.getCourseTeacher()+"  "+tl.getCourseRoom()+"  "+tl.getCourseTime();
            	i++;
           
            }
            %>
	
		<table bgcolor="AntiqueWhite"border="1" width="100%" height="500">
                       <tr>
                           <th bgcolor="Aquamarine">节次/周次</th>
                          <th bgcolor="Aquamarine">星期一</th>
                          <th bgcolor="Aquamarine">星期二</th>
                          <th bgcolor="Aquamarine">星期三</th>
                          <th bgcolor="Aquamarine">星期四</th>
                          <th bgcolor="Aquamarine">星期五</th>
                          <th bgcolor="Aquamarine">星期六</th>
                          <th bgcolor="Aquamarine">星期日</th>
                       </tr>
                       <tr>
                            <th  bgcolor="Aquamarine" width="100" height="50">第一节</th>
                            <td width="130" rowspan="2"><%=s[0] %></td><td width="130" rowspan="2"> <%=s[4] %></td><td width="130" rowspan="2"><%=s[8] %> </td><td width="130" rowspan="2"><%=s[12] %> </td><td width="130" rowspan="2"><%=s[16] %> </td><td width="130" rowspan="2"> <%=s[20] %></td><td width="130" rowspan="2"> <%=s[24] %></td>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine">第二节</th>
                       </tr>
                         <tr>
                            <th  bgcolor="Aquamarine"width="100" height="50">第三节</th>
                            <td rowspan="2"><%=s[1] %> </td><td rowspan="2"> <%=s[5] %></td><td rowspan="2"> <%=s[9] %></td><td rowspan="2"> <%=s[13] %></td><td rowspan="2"> <%=s[17] %></td><td rowspan="2"><%=s[21] %> </td><td rowspan="2"> <%=s[25] %></td>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine">第四节</th>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine"width="100" height="50">第五节</th>
                            <td rowspan="2"><%=s[2] %> </td><td rowspan="2"><%=s[6] %> </td><td rowspan="2"> <%=s[10] %></td><td rowspan="2"> <%=s[14] %></td><td rowspan="2"> <%=s[18] %></td><td rowspan="2"> <%=s[22] %></td><td rowspan="2"> <%=s[26] %></td>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine">第六节</th>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine"width="100" height="50">第七节</th>
                            <td rowspan="2"><%=s[3] %> </td><td rowspan="2"> <%=s[7] %></td><td rowspan="2"> <%=s[11] %></td><td rowspan="2"> <%=s[15] %></td><td rowspan="2"> <%=s[19] %></td><td rowspan="2"><%=s[23] %> </td><td rowspan="2"> <%=s[27] %></td>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine">第八节</th>
                       </tr>
                        
         </table>
		
		</div>
		</div>

	
	<!-- 我的简历页面结束 -->
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>