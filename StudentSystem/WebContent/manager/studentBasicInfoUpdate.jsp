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
<!-- 日期控件js -->
<script src="js/Calendar6.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
	function validate() {
		var studentnumber = document.getElementById("studentnumber");
		var realname = document.getElementById("realname");
		var gender = document.getElementById("gender");
		var nation = document.getElementById("nation");
		var specility = document.getElementById("specility");
		var residentLoc = document.getElementById("residentLoc");
		var telephone = document.getElementById("telephone");
	    var joinDate = document.getElementById("joinDate");
	    if (studentnumber.value == ""){
			alert("学号不能为空！");
			studentnumber.focus();
			return false;
		}else
        if (realname.value == ""){
				alert("realname不能为空！");
				realname.focus();
				return false;
			}else
				 if (gender.value == ""){
						alert("gender不能为空！");
						gender.focus();
						return false;
					}else
						 if (nation.value == ""){
								alert("nation不能为空！");
								nation.focus();
								return false;
							}else
								 if (specility.value == ""){
										alert("specility不能为空！");
										specility.focus();
										return false;
									}else
										if (residentLoc.value == ""){
											alert("residentLoc不能为空！");
											residentLoc.focus();
											return false;
										}else 
		if (telephone.value == ""){
			alert("手机不能为空！");
			telephone.focus();
			return false;
		}else 
		if (joinDate.value == ""){
			alert("joinDate不能为空！");
			joinDate.focus();
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
	

 <form action="StudentBasicinfoServlet?type=update" method="post" onsubmit="return validate();">  
        <div style=" position:absolute;
left:250px;
top:45px;
width:800px ;height:600px;line-height:300%;">
        
        		<div class="resume_main">
			<!--左边-->
			<div class="resume_left">
				<div class="resume_title">
					<div style="float: left">基本信息</div>
			
					<div >
					 <a  class="btn" href="javascript:window.history.go(-1);">返回</a>
						<button class="btn" name="studentId" type="submit" value="${basicinfo.getStudentId()}">保存</button>
						  
						
					</div>
				</div>
				<div class="all_resume">
				<div class="table_style">
						<table width="300" border="0" cellpadding="3" cellspacing="1">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">学号：</td>
								<td bgcolor="#F8F8F8">
								<input type="text" id="studentNumber" name="studentNumber" value="${basicinfo.studentNumber}">
				                <input type="hidden" name="basicinfoId" value="${basicinfo.getBasicInfoId()}">
				                <font style="color: red">*</font></td>
							</tr>
						</table>
					<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">姓名：</td>
								<td bgcolor="#F8F8F8"><input type="text" id="realName" name="realName" value="${basicinfo.realName}">
				               
				                <font style="color: red">*</font></td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">性别：</td>
								<td bgcolor="#F8F8F8">
								<input type="radio" name="gender" value="男"
				                   <c:if test="${basicinfo.gender=='男'}">
				                     checked="checked" </c:if>>男&nbsp;&nbsp; 
				                     <input type="radio" name="gender" value="女"
				                     <c:if test="${basicinfo.gender=='女'}">
				                     checked="checked" </c:if>>女</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">民族：</td>
								<td bgcolor="#F8F8F8"><input type="text" id="nation" name="nation" value="${basicinfo.nation}">
				               
				                <font style="color: red">*</font></td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">出生日期：</td>
								<td bgcolor="#F8F8F8">
                                <input name="birthday" type="text" id="birthday" onclick="SelectDate(this)" 
				                 readonly="readonly"  value="${basicinfo.birthday }"/>
				                 
                                </td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">专业：</td>
								<td bgcolor="#F8F8F8">
								<input type="text" id="specility" name="specility" value="${basicinfo.specility}">
				               
				                <font style="color: red">*</font></td>
							
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">户口所在地：</td>
								<td bgcolor="#F8F8F8"><td bgcolor="#F8F8F8">
								<input type="text" id="residentLoc" name="residentLoc" value="${basicinfo.residentLoc}">
				               
				                <font style="color: red">*</font></td>
						
							</tr>
						</table>
						<div class="he"></div>

						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">手机：</td>
								<td bgcolor="#F8F8F8">
								<input type="text" id="telephone" name="telephone" value="${basicinfo.telephone}">
				               
				                <font style="color: red">*</font></td>
							</tr>
						</table>
						
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">入学时间：</td>
								<td bgcolor="#F8F8F8">
								<select name="joinDate">
					<option value="0">请选择</option>
					<option value="2014" <c:if test="${basicinfo.joinDate=='2014' }">
					selected="selected"</c:if>>2014</option>
					<option value="2015"<c:if test="${basicinfo.joinDate=='2015' }">
					selected="selected"</c:if>>2015</option>
					<option value="2016"<c:if test="${basicinfo.joinDate=='2016' }">
					selected="selected"</c:if>>2016</option>
					<option value="2017"<c:if test="${basicinfo.joinDate=='2017' }">
					selected="selected"</c:if>>2017</option>
					<option value="2018"<c:if test="${basicinfo.joinDate=='2018' }">
					selected="selected"</c:if>>2018</option>
				</select>      
				                <font style="color: red">*</font>
								</td>
							</tr>
						</table>
						
						<div class="he"></div>
					</div>
					<div style="float: right" class="uploade">
						<% if("".equals(basicinfo.getHeadShot()) || null==basicinfo.getHeadShot()){ %>
						<img src="student/images/anonymous.png">
						<% }else{ %>
						<img src="student/images/<jsp:getProperty property="headShot" name="basicinfo"/>" width="140" height="140">
						<% } %>
						<p>&nbsp;</p>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
            </div>
    </form>        
   	  

	
	<!-- 我的简历页面结束 -->
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>