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
	function submitMail() {
		var mtitle = "联系方式有修改";
		var html = "<div style='padding:10px;'><div style='width:65px; height:120px; float:left;'>修改的地方：</div><div style='width:250px; height:120px; float:left;'><textarea id='objeCont' name='objeCont' style='width:250px; height:105px;'></textarea></div></div>";

		var submit = function(v, h, f) {
			if (f.objeCont == '' || f.objeCont.length > 80) {
				$.jBox.tip("请您输入有修改的地方，且不超过80个字！", 'error', {
					focusId : "objeCont"
				}); // 关闭设置 objeCont 为焦点
				return false;
			}

			StudentCompain.insertCompain('', mtitle, 5, f.objeCont, function(
					data) {
				var obj = $.parseJSON(data);
				var resultObj = false;
				if (obj.ok) {
					$.jBox.tip("成功提交联系方式的修改邮件！");
				}
			});
		};

		$.jBox(html, {
			title : "联系方式修改的邮件",
			submit : submit
		});
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

				<h2 class="mbx">我的信息 &gt; 个人资料 &nbsp;&nbsp;&nbsp;</h2>

				<div class="cztable">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right" width="80">姓名：</td>
							<td>${sessionScope.student.sname}&nbsp;</td>
							<td align="right" width="90">身份证号码：</td>
							<td>${student.idnum}&nbsp;</td>

							<!-- <td rowspan="9"><div align="center">
									<img id="pic_face" height="160" width="120"
										src="../Images/Student/photo.jpg"
										/ style="padding: 2px 2px 5px; border: 1px #ddd solid;">
								</div>&nbsp;</td> -->
						</tr>
						<tr>
							<td align="right">性别：</td>
							<td>${student.sex }&nbsp;</td>
							<td align="right">学号：</td>
							<td>${student.stuid }&nbsp;</td>
						</tr>
						<tr>
							<td align="right">生源地：</td>
							<td>${student.syd }&nbsp;</td>
							<td align="right">所在院系：</td>
							<td>${student.academyname }&nbsp;</td>
						</tr>
						<tr>
							<td align="right">所在专业：</td>
							<td>${student.major }&nbsp;</td>
							<td align="right">所在班级：</td>
							<td>${student.classesname }&nbsp;</td>
						</tr>

						<!--  <tr>
            <td align="right">报考层次：</td>
            <td>专本同读&nbsp;</td>
            
            <td align="right">注册批次：</td>
            <td>2013秋&nbsp;</td>
        </tr> -->
						<tr>
							<td align="right">入学时间：</td>
							<td>${student.rtime }&nbsp;</td>
							<td align="right">状态：</td>
							<td>${student.statu}&nbsp;</td>
						</tr>

						<tr>
							<td colspan="4" align="left">联系方式（如联系方式有变动请及时修改，以便能及时联系到你。谢谢！）</td>

						</tr>
						<tr>
							<td align="right">手机号码：</td>
							<td>${student.phone }</td>
							<td align="right">第二联系号码：</td>
							<td>${student.phonetow }</td>

						</tr>
						<tr>
							<td align="right">QQ:</td>
							<td>${student.qq }</td>
							<td align="right">电子邮箱：</td>
							<td>${student.emil }</td>

						</tr>
						<tr>
							<td align="right">联系地址：</td>
							<td colspan="4">${student.address}</td>
						</tr>
						<tr align="center">
							<!-- <td colspan="5" height="40">
								<div align="center">

									<input type="button" id="button2" value="联系方式有修改"
										onclick="submitMail()" class="input2" />
								</div>
							</td> -->
						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
