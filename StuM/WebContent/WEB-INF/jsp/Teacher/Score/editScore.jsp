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
			$("#allscore1").val(
					$("#paperscore").val() * 0.7
							+ $("#usualscore").val() * 0.3);
			$("#allscore").val(
					$("#paperscore").val() * 0.7
							+ $("#usualscore").val() * 0.3);
				
		
		
		var count=0;
		$("#submitbutton").click(function () {
			
			var result = validateForm();
			if (result) {
				$.ajax({
		            //几个参数需要注意一下
		                type: "POST",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "${pageContext.request.contextPath }/admin/updateScore" ,//url
		                contentType : "application/x-www-form-urlencoded; charset=utf-8",
		                data: $('#formid').serialize(),
		                success: function () {
		                   // console.log(result1);//打印服务端返回的数据(调试用)
		                  /*   if (result1.resultCode == 200) {
		                        alert("SUCCESS");
		                        parent.$.fancybox.close(); //关闭

		    		            parent.window.location.reload(); //刷新父窗口
		                    } */
		                    parent.$.fancybox.close(); //关闭

	    		            parent.window.location.reload(); //刷新父窗口
		                },
		                error : function() {
		                    alert("出现未知异常！");
		                }
		            });
				 
		          
			}else{

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

		if ($("#paperscore").val() == "" || $("#paperscore").val() < 0
				|| $("#paperscore").val() > 100) {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '卷面成绩格式不正确',
				ok : true,
			});
			return false;
		}

		if ($("#usualscore").val() == "" || $("#usualscore").val() < 0
				|| $("#usualscore").val() > 100) {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '平时成绩格式不正确',
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
	<form  method="post" id="formid">
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
				</tr>
				<tr>
					<td class="ui_text_rt">栋号</td>
					<td class="ui_text_lt">
						<select name="fangyuanEntity.fyDhCode" id="fyDh" class="ui_select01">
                            <option value="">--请选择--</option>
                            <option value="16" selected="selected">瑞景河畔16号楼</option>
                            <option value="17">瑞景河畔17号楼</option>
                            <option value="69">瑞景河畔18号楼</option>
                            <option value="72">瑞景河畔20号楼</option>
                            <option value="73">瑞景河畔22号楼</option>
                            <option value="74">瑞景河畔23号楼</option>
                            <option value="75">瑞景河畔24号楼</option>
                        </select>
					</td>
				</tr> -->
					<tr>
						<td><input type="hidden" value="${score.scoreid }" name="scoreid"/></td>
					</tr>
					<tr>
						<td class="ui_text_rt">学号</td>
						<td class="ui_text_lt"><input type="text" disabled="disabled"
							value="${score.student.stuid }" class="ui_input_txt02" /></td>
					</tr>
					<tr>
						<td class="ui_text_rt">姓名</td>
						<td class="ui_text_lt"><input type="text" disabled="disabled"
							id="sname" value="${score.student.sname }"
							class="ui_input_txt02" /></td>
					</tr>

					<tr>
						<td class="ui_text_rt">卷面成绩</td>
						<td class="ui_text_lt"><c:choose>
								<c:when test="${score.paperscore!=null }">
									<input type="text" name="paperscore" id="paperscore"
										value="${score.paperscore }" class="ui_input_txt01" />
								</c:when>
								<c:otherwise>
									<input type="text" name="paperscore" value="0" id="paperscore"
										class="ui_input_txt01" />
								</c:otherwise>
							</c:choose></td>
					</tr>

					<tr>
						<td class="ui_text_rt">平时成绩</td>
						<td class="ui_text_lt"><c:choose>
								<c:when test="${score.usualscore!=null }">
									<input type="text" name="usualscore" id="usualscore"
										value="${score.usualscore }" class="ui_input_txt01" />
								</c:when>
								<c:otherwise>
									<input type="text" name="usualscore" value="0" id="usualscore"
										class="ui_input_txt01" />
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<td class="ui_text_rt">总成绩</td>
						<td class="ui_text_lt"><input id="allscore" type="hidden"
							name="allscore" value="${score.allscore }" /> <c:choose>
								<c:when test="${score.allscore!=null }">
									<input id="allscore1" type="text" id="allscore"
										disabled="disabled" value="${score.allscore }"
										class="ui_input_txt01" />
								</c:when>
								<c:otherwise>
									<!-- <input type="text" name="allscore" value="0" id="allscore"
										class="ui_input_txt01" />
										 -->
									<input id="allscore1" type="text" id="allscore"
										disabled="disabled" value="0"
										class="ui_input_txt01" />

								</c:otherwise>
							</c:choose></td>
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