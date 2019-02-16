<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息管理平台</title>
<link href="${pageContext.request.contextPath}/Style/StudentStyle.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/Script/jBox/Skins/Blue/jbox.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Style/ks.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/Script/jBox/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/Script/jBox/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/Script/jBox/i18n/jquery.jBox-zh-CN.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Script/Common.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/Script/Data.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function foo() {
		if (confirm("确认选择该课程吗？")) {
			return true;
		}
		return false;
	}
</script>
</head>
<body>

	<div class="banner">
		<div class="bgh">
			<div class="page">
				<div id="logo">
					<a href="Index.aspx.html"> <img src="Images/Student/logo.gif"
						alt="" width="165" height="48" />
					</a>
				</div>
				<div class="topxx">

					${student.stuid }：${student.sname }同学，欢迎您！ <a
						href="${pageContext.request.contextPath }/student/info">我的信息</a> <a
						href="${pageContext.request.contextPath }/student/updatepwd">密码修改</a>
					<a href="${pageContext.request.contextPath }/student/exit">安全退出</a>
				</div>
				<%-- <div class="blog_nav">
					<ul>
						<li><a href="${pageContext.request.contextPath }/student/info">我的信息</a></li>
						<li><a href="EducationCenter/Score.aspx.html">教务中心</a></li>
						<li><a href="MyAccount/wdcw.aspx.html">我的学费</a></li>
						<li><a href="OnlineTeaching/StudentMaterial.aspx.html">资料中心</a></li>
					</ul>
				</div> --%>
			</div>
		</div>
	</div>
	<div class="page">
		<div class="box mtop">
			<div class="leftbox">
				<div class="l_nav2">
					<div class="ta1">
						<strong>个人中心</strong>
						<div class="leftbgbt"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="${pageContext.request.contextPath }/student/info">我的信息</a>
						</div>
						<div>
							<a href="${pageContext.request.contextPath }/student/classInfo">班级信息</a>
						</div>
					</div>
				</div>
				<div class="l_nav2">
					<div class="ta1">
						<strong>学习中心</strong>
						<div class="leftbgbt"></div>
					</div>
					<div class="cdlist">
						<div>
							<a
								href="${pageContext.request.contextPath }/student/course?id=${student.stuid}">我的课程</a>
						</div>
						<div>
							<a
								href="${pageContext.request.contextPath }/student/findscore?id=${student.stuid}">我的成绩</a>
						</div>

					</div>


				</div>
				
				<div class="l_nav2">
					<div class="ta1">
						<strong>选课中心</strong>
						<div class="leftbgbt"></div>
					</div>
					<div class="cdlist">
						<div>
							<a
								href="${pageContext.request.contextPath }/student/findAllcourseNotCore">选择课程</a>
						</div>
						<div>
							<a
								href="${pageContext.request.contextPath }/student/selectedUnCoreCourse">已选课程</a>
						</div>
					</div>

				</div>
			</div>
			<div class="rightbox">

				<h2 class="mbx">教务中心 &gt; 我的书籍</h2>

				<div class="cztable">

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr style="height: 25px" align="center">
										<th scope="col">编号</th>
										<th scope="col">课程名称</th>
										<th scope="col">任课老师</th>
										<th scope="col">上课时间</th>
										<th scope="col">课程学分</th>
										<th scope="col">操作</th>
									</tr>
									<c:forEach items="${list }" var="course" varStatus="statu">
										<tr align="center">


											<td>${statu.index+1 }</td>
											<td>${course.coursename }</td>
											<td>${course.courseteacher }</td>
											<td>星期${course.courseday}，第${course.coursetime}大节</td>
											<td>${course.coursescore }</td>
											<td><a id="selectCourse" onclick="return foo();"
												href="${pageContext.request.contextPath }/student/selectCourse?courseid=${course.courseid}">选择课程</a>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
				</div>

			</div>
		</div>
	</div>
</body>
</html>

