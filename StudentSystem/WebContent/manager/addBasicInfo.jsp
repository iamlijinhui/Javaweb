<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 获得请求的绝对地址
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<!-- 日期控件js -->
<script src="js/Calendar6.js" type="text/javascript" language="javascript"></script>
<script type="text/javascript">
	function validate() {
		var studentnumber = document.getElementById("studentnumber");
		var realname = document.getElementById("realname");
		var birthday = document.getElementById("birthday ");
		var nation = document.getElementById("nation");
		var specility = document.getElementById("specility");
		var residentLoc = document.getElementById("residentLoc");
		var telephone = document.getElementById("telephone");
	    var joindate = document.getElementById("joindate");
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
				 if (birthday .value == ""){
						alert("birthday 不能为空！");
						birthday.focus();
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
		if (joindate.value == ""){
			alert("joinDate不能为空！");
			joinDate.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<!-- 网站公共头部 -->
	<jsp:include page="../top.jsp"></jsp:include>	

	<!-- 我的简历页面 开始 -->
	<div class="resume_con">
		<!--tab设置--><br><br>
		</div>
		<!--主体部分-->
		<div class="resume_main">
			<!--左边-->
			<div class="resume_left">
				<div class="resume_title">
					<div style="float: left">基本信息</div>
				</div>
				<div class="all_resume" style="text-align: center;" align="center">
					<!--------------------- 简历基本信息添加 ------------------------->
					<form action="StudentBasicinfoServlet?type=addBasicInfo" method="post" onsubmit="return validate();">
						<div class="table_style" style="margin-left:150px;">
						<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">学号：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="studentnumber"
										name="studentNumber"> <font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">姓名：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="realname"
										name="realName"> <font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">性别：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="radio"  id="gender" name="gender"
										checked="checked" value="男">男&nbsp;&nbsp; <input
										type="radio" name="gender" value="女">女</td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">民族：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="nation"
										name="nation"> <font style="color: red">*</font></td>
								</tr>
							</table>
						
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">出生日期：</td>
									<td bgcolor="#F8F8F8" align="left"><input name="birthday" type="text"
										id="birthday" onclick="SelectDate(this)" readonly="readonly" /></td>
								</tr>
							</table>
							
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">专业：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="specility"
										name="specility"> <font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">户口所在地：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="residentloc"
										name="residentLoc"></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">手机：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="telephone"
										name="telephone"><font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">入学年份：</td>
									<td bgcolor="#F8F8F8" align="left"><select name="joinDate" id="joindate">
											<option value="0">请选择</option>
											<option value="2014">2014</option>
											<option value="2014">2015</option>
											<option value="2014">2016</option>
											<option value="2014">2017</option>
											<option value="2014">2018</option>
									</select></td>
								</tr>
							</table>
		
							<div class="he"></div>
							<div class="he"></div>
							<div align="center">
								<input name="submit" type="submit" class="" value="保存">
								 <a  class="btn" href="javascript:window.history.go(-1);">返回</a>
							</div>
						</div>
					</form>
					<!--------------------- 简历基本信息添加 结束------------------->
				</div>
			</div>
			<!--右边-->
		
		</div>
	
	<!-- 我的简历页面结束 -->
	
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>