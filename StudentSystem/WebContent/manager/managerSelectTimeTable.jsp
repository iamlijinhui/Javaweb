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
<script type="text/javascript">
	function validate() {
		var courseid = document.getElementById("courseid");
		
	    if (courseid.value == ""){
			alert("课程号不能为空！");
			courseid.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<br/><br/>
	<!-- 从request对象中获取一个JavaBean对象 -->
	<jsp:useBean id="timetable" class="com.stu_info_manage.bean.StudentTimeTable" scope="request"></jsp:useBean>
	<div style="height:600px;"></div>
     <div style="position:absolute;top:45px;width:250px ;height:600px;line-height:300%;font-size: 150%; background-color:#C0C0C0">
		<h2 >欢迎管理员登陆</h2>

			  <p>    <a class="one" href="manager/main.jsp" >学生信息管理</a>  </p>
			  <p>    <a class="one" href="manager/studentCourseTableUpdate.jsp" >学生课程管理</a></p>
              <p>    <a class="one" href="manager/selectedCourse.jsp" >学生成绩管理</a> </p>
              <p>    <a class="one" href="manager/managerSelectTimeTable.jsp" >课程表管理</a> </p>
              <p>    <a class="one" href="manager/changeStudentPwd.jsp" >重置学生密码</a> </p>
           
	</div>

		
		<!--主体部分-->
		<div style=" position:absolute;
left:250px;
top:45px;
width:800px;line-height:200%; background-color:#00ccff ">
<form action="StudentCourseTableServlet?type=managerupdatetimetable" method="post" onsubmit="return validate();">
<table border="1">
<tr  height="30" >
									<td bgcolor="#F8F8F8" align="left"><select name="week" id="week">
											<option value="1">周一</option>
											<option value="2">周二</option>
											<option value="3">周三</option>
											<option value="4">周四</option>
											<option value="5">周五</option>
											<option value="6">周六</option>
											<option value="7">周日</option>
									</select></td>

									<td bgcolor="#F8F8F8" align="left"><select name="time" id="time">
											<option value="1">1、2节</option>
											<option value="2">3、4节</option>
											<option value="3">5、6节</option>
											<option value="4">7、8节</option>
									</select>
									<td align="right" bgcolor="#F8F8F8">课程ID：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="courseid"
										name="courseid"> <font style="color: red">*</font></td>
										<td><input name="submit" type="submit" class="" value="修改课程"></td>
</tr>
</table>
</form>
	</div>
		<div style=" position:absolute;
left:250px;
top:180px;
width:800px;line-height:200%; background-color:#ccccff ">

	<div>
		<%
          StudentTimeTableDAO dao=new StudentTimeTableDAO();
		   String[] s=new String[]{" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "};
		   s[0]="qqq";
		   int i=0;
          List<StudentTimeTable> list=dao.selectCT(); 
            
          for(StudentTimeTable tl:list)
            {
        	   
            	s[i]=tl.getCourseName()+" "+tl.getCourseTeacher()+" "+tl.getCourseRoom()+" "+tl.getCourseTime();
            	i++;
           
            }
            %>
	
		<table bgcolor="AntiqueWhite"border="1" width="100%">
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
                            <th  bgcolor="Aquamarine" width="100" height="30">第一节</th>
                            <td width="130" rowspan="2"><%=s[0] %></td><td width="130" rowspan="2"> <%=s[4] %></td><td width="130" rowspan="2"><%=s[8] %> </td><td width="130" rowspan="2"><%=s[12] %> </td><td width="130" rowspan="2"><%=s[16] %> </td><td width="130" rowspan="2"> <%=s[20] %></td><td width="130" rowspan="2"> <%=s[24] %></td>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine">第二节</th>
                       </tr>
                         <tr>
                            <th  bgcolor="Aquamarine"width="100" height="30">第三节</th>
                            <td rowspan="2"><%=s[1] %> </td><td rowspan="2"> <%=s[5] %></td><td rowspan="2"> <%=s[9] %></td><td rowspan="2"> <%=s[13] %></td><td rowspan="2"> <%=s[17] %></td><td rowspan="2"><%=s[21] %> </td><td rowspan="2"> <%=s[25] %></td>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine">第四节</th>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine"width="100" height="30">第五节</th>
                            <td rowspan="2"><%=s[2] %> </td><td rowspan="2"><%=s[6] %> </td><td rowspan="2"> <%=s[10] %></td><td rowspan="2"> <%=s[14] %></td><td rowspan="2"> <%=s[18] %></td><td rowspan="2"> <%=s[22] %></td><td rowspan="2"> <%=s[26] %></td>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine">第六节</th>
                       </tr>
                         <tr>
                            <th bgcolor="Aquamarine"width="100" height="30">第七节</th>
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