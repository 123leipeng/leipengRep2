<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生信息管理平台</title>
<link href="${pageContext.request.contextPath }/Style/StudentStyle.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/Script/jBox/Skins/Blue/jbox.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/Style/ks.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath }/Script/jBox/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/Script/jBox/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/Script/jBox/i18n/jquery.jBox-zh-CN.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/Script/Common.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/Script/Data.js"
	type="text/javascript"></script>
<!-- <script type="text/javascript">
	$().ready(function() {
		setStudMsgHeadTabCheck();
		showUnreadSysMsgCount();
	});

	//我的信息头部选项卡
	function setStudMsgHeadTabCheck() {
		var currentUrl = window.location.href;
		currentUrl = currentUrl.toLowerCase();
		var asmhm = "";
		$("#ulStudMsgHeadTab li").each(function() {
			asmhm = $(this).find('a').attr("href").toLowerCase();
			if (currentUrl.indexOf(asmhm) > 0) {
				$(this).find('a').attr("class", "tab1");
				return;
			}
		});
	}

	//显示未读系统信息
	function showUnreadSysMsgCount() {
		var unreadSysMsgCount = "0";
		if (Number(unreadSysMsgCount) > 0) {
			$("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
		}
	}

	//退出
	function loginOut() {
		if (confirm("确定退出吗？")) {
			StudentLogin.loginOut(function(data) {
				if (data == "true") {
					window.location = "/Login.aspx";
				} else {
					jBox.alert("退出失败！", "提示", new {
						buttons : {
							"确定" : true
						}
					});
				}
			});
		}
	}
	//更改报考类别
	function changeCateory(thisObj, id) {
		var oldCateoryId = $("#cateoryId").val();
		var cateoryId = "";
		if (id != null) {
			cateoryId = id;
		} else {
			cateoryId = thisObj.val();
		}
		var studentId = $("#studentId").val();
		if (cateoryId.length <= 0) {
			jBox.tip("报考类别不能为空！");
			if (id == null) {
				thisObj.val(oldCateoryId);
			}
		} else {
			studentInfo.changeStudentCateory(cateoryId, function(data) {
				var result = $.parseJSON(data);
				if ((String(result.ok) == "true")) {
					window.location.href = "/Index.aspx";
				} else {
					jBox.tip(result.message);
				}
			});
		}
	}
</script> -->

<!-- <script type="text/javascript">
	//学生投诉异议
	function onSaveProblem() {
		var studentId = $("#studentId").val();
		var workAssess = $('input[name="workAssess"]:checked').val();
		var problemContent = $("#problemContent").val();
		var problemType = $('input[name="problemType"]:checked').val();
		var problemTypeStr = "学生";
		switch (problemType) {
		case "4":
			problemTypeStr += "提问";
			break;
		case "3":
			problemTypeStr += "意见";
			break;
		case "1":
			problemTypeStr += "投诉";
			break;
		default:
			break;
		}

		if (problemContent.length <= 0) {
			jBox.tip("请填写问题反馈的内容！");
			return false;
		} else {
			problemContent = "工作评价：" + workAssess + "，" + problemContent;
			StudentCompain.insertCompain(studentId, problemTypeStr,
					problemType, problemContent, function(data) {
						var obj = $.parseJSON(data);
						if (obj.ok == true) {
							jBox.alert(obj.message, "提示");
							setTimeout(function() {
								window.location.reload();
							}, 1500);
						} else {
							jBox.tip(obj.message);
						}
					});
		}
	}
</script> -->
</head>
<body>

	<div class="banner">
		<div class="bgh">
			<div class="page">

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


				<h2 class="mbx">我的信息 &gt; 班级信息&nbsp;&nbsp;&nbsp;自考</h2>

				<div class="cztable">
					<table border="0" cellspacing="0" cellpadding="0" width="100%">
						<tr>
							<td width="91" align="right">班级名称：</td>
							<td colspan="5">${classes.cname }&nbsp;</td>
						</tr>
						<tr>
							<td align="right">班级QQ群：</td>
							<td colspan="5">${classes.qq}&nbsp;</td>
						</tr>
						<tr>
							<td align="right">班级邮箱：</td>
							<td colspan="5">${classes.cemil}&nbsp;</td>
						</tr>
						<tr>
							<td align="right">班级宣传语：</td>
							<td colspan="5">${classes.slogan }&nbsp;</td>
						</tr>
						<tr>
							<td align="right">学院名称：</td>
							<td colspan="5">${classes.cacademyname }&nbsp;</td>
						</tr>

						<tr>
							<td align="right"><div align="right">班主任老师：</div>&nbsp;</td>
							<td><div align="left">${classes.teacher.tname}</div>&nbsp;</td>


							<td><div align="right">手机号：</div>&nbsp;</td>
							<td><div align="left">${classes.teacher.phone }</div>&nbsp;</td>
							<td><div align="right">QQ号：</div>&nbsp;</td>
							<td><div align="left">${classes.teacher.qq}</div>&nbsp;</td>




						</tr>

						<!--  <tr>
            <td align="right">工作评价：</td>
            <td colspan="5">
                <input value="满意" checked="checked" type="radio" name="workAssess" />满意
                <input value="一般" type="radio" name="workAssess" />一般
                <input value="差" type="radio" name="workAssess" />差
            </td>
        </tr>
        <tr>
            <td rowspan="3" align="right">问题反馈：</td>
            <td colspan="5">
                <input value="4" checked="checked" type="radio" name="problemType" />提问
                
                <input value="1" type="radio" name="problemType" />投诉
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <textarea name="problemContent" id="problemContent" cols="80" rows="6" class="input_2"></textarea>
            </td>
        </tr> -->
						<!--   <tr>
            <td colspan="5" align="left" valign="middle">
                <input type="button" name="button2" id="button2" value="点击提交" class="input2" onclick="onSaveProblem()" />
            </td>
        </tr> -->
					</table>
				</div>

			</div>
		</div>

	</div>
</body>
</html>
