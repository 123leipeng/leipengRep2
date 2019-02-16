<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>学生登录界面</title>
<style>
* {
	margin: 0;
	padding: 0;
}

html {
	height: 100%;
}

body {
	height: 100%;
	background: #fff url(${pageContext.request.contextPath}/images/backgroud.png) 50% 50% no-repeat;
	background-size: cover;
}

.dowebok {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 430px;
	height: 550px;
	margin: -300px 0 0 -215px;
	border: 1px solid #fff;
	border-radius: 20px;
	overflow: hidden;
}

.logo {
	width: 104px;
	height: 104px;
	margin: 50px auto 80px;
	background: url(${pageContext.request.contextPath}/images/login.png) 0 0 no-repeat;
}

.form-item {
	position: relative;
	width: 360px;
	margin: 0 auto;
	padding-bottom: 30px;
}

.form-item input {
	width: 288px;
	height: 48px;
	padding-left: 70px;
	border: 1px solid #fff;
	border-radius: 25px;
	font-size: 18px;
	color: #fff;
	background-color: transparent;
	outline: none;
}

.form-item button {
	width: 360px;
	height: 50px;
	border: 0;
	border-radius: 25px;
	font-size: 18px;
	color: #1f6f4a;
	outline: none;
	cursor: pointer;
	background-color: #fff;
}

#username {
	background: url(${pageContext.request.contextPath}/images/emil.png) 20px 14px no-repeat;
}

#password {
	background: url(${pageContext.request.contextPath}/images/password.png) 23px 11px no-repeat;
}

.tip {
	display: inline;
	position: absolute;
	left: 20px;
	top: 52px;
	font-size: 14px;
	color: #f50;
}

.reg-bar {
	width: 360px;
	margin: 20px auto 0;
	font-size: 14px;
	overflow: hidden;
}

.reg-bar a {
	color: #fff;
	text-decoration: none;
}

.reg-bar a:hover {
	text-decoration: underline;
}

.reg-bar .reg {
	float: left;
}

.reg-bar .forget {
	float: right;
}

.dowebok ::-webkit-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok ::-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-ms-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

@media screen and (max-width: 500px) {
	* {
		box-sizing: border-box;
	}
	.dowebok {
		position: static;
		width: auto;
		height: auto;
		margin: 0 30px;
		border: 0;
		border-radius: 0;
	}
	.logo {
		margin: 50px auto;
	}
	.form-item {
		width: auto;
	}
	.form-item input, .form-item button, .reg-bar {
		width: 100%;
	}
}
</style>
</head>
<body>

	<form action="${pageContext.request.contextPath}/login/homePage" method="post"
		name="stuform">
		<div class="dowebok">
			<div class="logo"></div>
			<div class="form-item">
				<input id="username" type="text" name="stuid" autocomplete="off" value="${stuid }"
					placeholder="学号">
			</div>
			<div class="form-item">
				<input id="password" type="password" name="password" value="${password }" autocomplete="off" placeholder="登录密码"> 
<%-- 					<p><font color="red" size="2px">${message }</font></p> --%>
				            <p class="tip">${message }</p>
			</div>
			<div class="form-item">
				<button id="submit">登 录</button>
			</div>
			
			<div align="center"><font color="white" size="3">账号：20154042012 ~~ 20154042015</font></div>
			<div align="center"><font color="white"  size="3">密码：123456</font></div>
		</div>
	</form>

</body>
</html>