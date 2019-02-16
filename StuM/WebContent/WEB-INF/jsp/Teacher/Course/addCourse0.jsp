<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Script/jquery/jquery-1.7.1.js"></script>
<link
	href="${pageContext.request.contextPath }/Style/authority/basic_layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/Style/authority/common_style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Script/authority/commonAll.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Script/jquery/jquery-1.4.4.min.js"></script>
<script
	src="${pageContext.request.contextPath }/Script/My97DatePicker/WdatePicker.js"
	type="text/javascript" defer="defer"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Script/artDialog/artDialog.js?skin=default"></script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		
		  
		 
		$("#submitbutton").click(function() {
			if (validateForm()) {
				checkFyFhSubmit();
			}
		});

		/*
		 * 取消
		 */
		$("#cancelbutton").click(function() {
			/**  关闭弹出iframe  **/
			parent.$.fancybox.close();
		});

		var result = 'null';
		if (result == 'success') {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		}

	});

	function myclose() {
		parent.$.fancybox.close();
	}

	/** 检测房源房号是否存在  **/
	function checkFyFh() {
		// 分别获取小区编号、栋号、层号、房号
		var fyID = $('#fyID').val();
		var fyXqCode = $("#fyXq").val();
		var fyDh = $("#fyDh").val();
		var fyCh = $("#fyCh").val();
		var fyFh = $("#fyFh").val();
		if (fyXqCode != "" && fyDh != "" && fyCh != "" && fyFh != "") {
			// 给房屋坐落地址赋值
			$("#fyZldz").val(
					$('#fyDh option:selected').text() + fyCh + "-" + fyFh);
			// 异步判断该房室是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type : "POST",
				url : "checkFyFhIsExists.action",
				data : {
					"fangyuanEntity.fyID" : fyID,
					"fangyuanEntity.fyXqCode" : fyXqCode,
					"fangyuanEntity.fyDhCode" : fyDh,
					"fangyuanEntity.fyCh" : fyCh,
					"fangyuanEntity.fyFh" : fyFh
				},
				dataType : "text",
				success : function(data) {
					// 					alert(data);
					// 如果返回数据不为空，更改“房源信息”
					if (data == "1") {
						art.dialog({
							icon : 'error',
							title : '友情提示',
							drag : false,
							resize : false,
							content : '该房室在系统中已经存在哦，\n请维护其他房室数据',
							ok : true,
						});
						$("#fyFh").css("background", "#EEE");
						$("#fyFh").focus();
						return false;
					}
				}
			});
		}
	}

	/** 检测房源房号是否存在并提交form  **/
	function checkFyFhSubmit() {
		// 分别获取小区编号、栋号、层号、房号
		var fyID = $('#fyID').val();
		var fyXqCode = $("#fyXq").val();
		var fyDh = $("#fyDh").val();
		var fyCh = $("#fyCh").val();
		var fyFh = $("#fyFh").val();
		if (fyXqCode != "" && fyDh != "" && fyCh != "" && fyFh != "") {
			// 给房屋坐落地址赋值
			$("#fyZldz").val(
					$('#fyDh option:selected').text() + fyCh + "-" + fyFh);
			// 异步判断该房室是否存在，如果已存在，给用户已提示哦
			$.ajax({
				type : "POST",
				url : "checkFyFhIsExists.action",
				data : {
					"fangyuanEntity.fyID" : fyID,
					"fangyuanEntity.fyXqCode" : fyXqCode,
					"fangyuanEntity.fyDhCode" : fyDh,
					"fangyuanEntity.fyCh" : fyCh,
					"fangyuanEntity.fyFh" : fyFh
				},
				dataType : "text",
				success : function(data) {
					// 					alert(data);
					// 如果返回数据不为空，更改“房源信息”
					if (data == "1") {
						art.dialog({
							icon : 'error',
							title : '友情提示',
							drag : false,
							resize : false,
							content : '该房室在系统中已经存在哦，\n请维护其他房室数据',
							ok : true,
						});
						$("#fyFh").css("background", "#EEE");
						$("#fyFh").focus();
						return false;
					} else {
						$("#submitForm").attr("action",
								"/xngzf/archives/saveOrUpdateFangyuan.action")
								.submit();
					}
				}
			});
		}
		return true;
	}

	/** 表单验证  **/
	function validateForm() {
		if ($("#fyXqName").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '填写房源小区',
				ok : true,
			});
			return false;
		}
		if ($("#fyDh").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '填写房源栋号',
				ok : true,
			});
			return false;
		}
		if ($("#fyCh").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '填写房源层号',
				ok : true,
			});
			return false;
		}
		if ($("#fyFh").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '填写房源房号',
				ok : true,
			});
			return false;
		}
		if ($("#fyZongMj").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '填写房源面积',
				ok : true,
			});
			return false;
		}
		if ($("#fyJizuMj").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '填写计租面积',
				ok : true,
			});
			return false;
		}
		if ($("#fyZldz").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '填写房源座落地址',
				ok : true,
			});
			return false;
		}
		return true;
		
	
		
	}
</script> -->
<script type="text/javascript">
	/* 	$(document).ready(function() {
	
	 $("#submitbutton").click(function() {
	 validateForm();
	 });
	
	 $("#cancelbutton").click(function() {	
	 parent.$.fancybox.close();
	 });

	 var result = 'null';
	 if (result == 'success') {
	 window.parent.$.fancybox.close();
	 }

	 }); */

	$(function() {

		var count = 0;
		$("#submitbutton")
				.click(
						function() {

							var result = validateForm();
							if (result) {
								$
										.ajax({
											//几个参数需要注意一下
											type : "POST",//方法类型
											dataType : "json",//预期服务器返回的数据类型
											url : "${pageContext.request.contextPath }/admin/toAddCourse0",//url
											contentType : "application/x-www-form-urlencoded; charset=utf-8",
											data : $('#formid').serialize(),
											success : function(date) {
												// console.log(result1);//打印服务端返回的数据(调试用)
												/*   if (result1.resultCode == 200) {
												      alert("SUCCESS");
												      parent.$.fancybox.close(); //关闭

												      parent.window.location.reload(); //刷新父窗口
												  } */
												 if(date!=null){
													  alert(date.exception);  
												  }else{
													  alert("添加成功");  
												  }
												parent.$.fancybox.close(); //关闭

												parent.window.location.reload(); //刷新父窗口
											},
											error : function(date) {
												alert("出现未知异常！");
											}
										});

							} else {

							}

						});

		$("#paperscore").change(
				function() {
					$("#allscore1").val(
							$("#paperscore").val() * 0.7
									+ $("#usualscore").val() * 0.3);
					$("#allscore").val(
							$("#paperscore").val() * 0.7
									+ $("#usualscore").val() * 0.3);

				});

		$("#usualscore").change(
				function() {
					$("#allscore1").val(
							$("#paperscore").val() * 0.7
									+ $("#usualscore").val() * 0.3);
					$("#allscore").val(
							$("#paperscore").val() * 0.7
									+ $("#usualscore").val() * 0.3);

				});

	});

	function validateForm() {

		if ($("#coursescore").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '请填写课程学分',
				ok : true,
			});
			return false;
		}

		if ($("#coursename").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '请填写课程名称',
				ok : true,
			});
			return false;
		}
		if ($("#courseday").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '请填写上课时间',
				ok : true,
			});
			return false;
		}

		if ($("#coursetime").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '请填写上课时间',
				ok : true,
			});
			return false;
		}
		if ($("#classes").val() == "") {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '请填写所属班级',
				ok : true,
			});
			return false;
		}
		return true;

	}

	function myclose() {
		parent.$.fancybox.close();
	}
</script>
</head>
<body>
	<%-- "${pageContext.request.contextPath }/admin/updateScore" --%>
	<form method="post" id="formid">
		<!-- <input type="hidden" name="fyID" value="14458625716623" id="fyID" /> -->
		<div id="container">
			<div id="nav_links">
				当前位置：学生成绩&nbsp;>&nbsp;<span style="color: #1A5CC6;">编辑</span>
				<div id="page_close">
					<a href="javascript:parent.$.fancybox.close();"> <img
						src="${pageContext.request.contextPath }/images/common/page_close.png"
						width="20" height="20" style="vertical-align: text-top;" />
					</a>
				</div>
			</div>
			<div class="ui_content">
				<table cellspacing="0" cellpadding="0" width="100%" align="left"
					border="0">
					<!-- <tr>
					<td class="ui_text_rt" width="80">小区</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="getFyDhListByFyXqCode();">
                            <option value="">--请选择--</option>
                            <option value="6" selected="selected">瑞景河畔</option>
                            <option value="77">蔚蓝小区</option>
                            <option value="83">和盛园小区</option>
                        </select>
					</td>
				</tr>-->
					<tr>
						<td><input type="hidden" name="coursetype" value="0" /></td>
					</tr>

					<tr>
						<td class="ui_text_rt">课程学年</td>
						<td class="ui_text_lt"><input type="hidden" name="courseyear"
							value="${year }" /> <input type="text" disabled="disabled"
							value="${year }" class="ui_input_txt02" /></td>
					</tr>

					<tr>
						<td class="ui_text_rt">课程名称</td>
						<td class="ui_text_lt"><input type="text" id="coursename"
							name="coursename" placeholder="请填写课程名称" value=""
							class="ui_input_txt02" /></td>
					</tr>
					<tr>
						<td class="ui_text_rt">所属班级</td>
						<td class="ui_text_lt"><select name="cid"
							id="classes" class="ui_select01">
								<option value="" selected="selected">-请选择所属班级-</option>
								<c:forEach items="${list }" var="classes">
									<option value="${classes.cid }">${classes.cname }</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td class="ui_text_rt">课程学分</td>
						<td class="ui_text_lt"><select name="coursescore"
							id="coursescore" class="ui_select01">
								<option value="" selected="selected">-请选择学分-</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select></td>
					</tr>
					<tr>
						<td class="ui_text_rt">上课时间：星期几</td>
						<td class="ui_text_lt"><select id="courseday"
							name="courseday" class="ui_select01">
								<option value="" selected="selected">-请选择上课时间-</option>
								<option value="1">星期一</option>
								<option value="2">星期二</option>
								<option value="3">星期三</option>
								<option value="4">星期四</option>
								<option value="5">星期五</option>
								<option value="6">星期六</option>
								<option value="7">星期天</option>
						</select></td>
					</tr>

					<tr>
						<td class="ui_text_rt">上课时间：第几堂课</td>
						<td class="ui_text_lt"><select id="coursetime"
							name="coursetime" class="ui_select01">
								<option value="" selected="selected">-请选择上课时间-</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select></td>
					</tr>


					<%-- <tr>
						<td class="ui_text_rt">第二联系手机号</td>
						<td class="ui_text_lt"><input type="text" name="phonetow"
							value="${student.phonetow }" class="ui_input_txt02" /></td>
					</tr>
					<tr>
						<td class="ui_text_rt">QQ号</td>
						<td class="ui_text_lt"><input type="text" name="qq"
							value="${student.qq }" class="ui_input_txt02" /></td>
					</tr>
					<tr>
						<td class="ui_text_rt">邮箱</td>
						<td class="ui_text_lt"><input type="text" name="emil"
							value="${student.emil }" class="ui_input_txt02" /></td>
					</tr>
					<tr>
						<td class="ui_text_rt">家庭地址</td>
						<td class="ui_text_lt"><input type="text" name="address"
							value="${student.address }" class="ui_input_txt02" /></td>
					</tr> --%>
					<!-- <tr>
					<td class="ui_text_rt">房号</td>
					<td class="ui_text_lt">
						<input type="text" id="fyFh" name="fangyuanEntity.fyFh"  value="112" class="ui_input_txt01" onkeyup="checkFyFh();"/>室
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">房源面积</td>
					<td class="ui_text_lt">
						<input type="text" id="fyZongMj" name="fangyuanEntity.fyZongMj"  value="67.47" class="ui_input_txt01"/>㎡
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">计租面积</td>
					<td class="ui_text_lt">
						<input type="text" id="fyJizuMj" name="fangyuanEntity.fyJizuMj" value="67.47" class="ui_input_txt01"/>㎡
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">户型</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyHxCode" id="submitForm_fangyuanEntity_fyHxCode" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="76" selected="selected">一室一厅一卫</option>
                            <option value="10">两室一厅一卫</option>
                            <option value="14">三室一厅一卫</option>
                            <option value="71">三室两厅一卫</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">建筑结构</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyJianzhuJiegou" id="submitForm_fangyuanEntity_fyJianzhuJiegou" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="38" selected="selected">混凝土</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">座落</td>
					<td class="ui_text_lt">
						<input type="text" id="fyZldz" name="fangyuanEntity.fyZldz" value="瑞景河畔16号楼1-112" class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">位置</td>
					<td class="ui_text_lt">
						<input type="text" id="fyPsdz" name="fangyuanEntity.fyPsdz" value="城中区" class="ui_input_txt02"/>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">性质</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.zulinXingzhi" id="submitForm_fangyuanEntity_zulinXingzhi" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="40" selected="selected">公租房</option>
                            <option value="41">廉租房</option>
                        </select>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">状态</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyStatus" id="submitForm_fangyuanEntity_fyStatus" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="26">在建</option>
                            <option value="25">建成待租</option>
                            <option value="13" selected="selected">已配租</option>
                            <option value="12">已租赁</option>
                            <option value="24">腾退待租</option>
                            <option value="23">欠费</option>
                            <option value="27">其他</option>
                        </select>
					</td> 
				</tr> -->
					<tr>
						<td>&nbsp;</td>
						<td class="ui_text_lt">&nbsp;<input id="submitbutton"
							type="button" value="提交" class="ui_input_btn01" />&nbsp;<a
							href="javascript:myclose();"><input id="cancelbutton"
								type="button" value="取消" class="ui_input_btn01" /></a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>

</body>
</html>