<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	src="${pageContext.request.contextPath }/Script/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Script/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/Style/authority/jquery.fancybox-1.3.4.css"
	media="screen"></link>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/Script/artDialog/artDialog.js?skin=default"></script>
<title>信息管理系统</title>
<script type="text/javascript">
	$(document).ready(function() {

		$("#addCourse0").fancybox({
			'href' : '${pageContext.request.contextPath}/admin/addCourse0',
			'width' : 500,
			'height' : 320,
			'type' : 'iframe',
			'hideOnOverlayClick' : false,
			'showCloseButton' : false,
			'onClosed' : function() {
				window.location.href = '#';
			}
		});


		$("#addCourse1").fancybox({
			'href' : '${pageContext.request.contextPath}/admin/addCourse1',
			'width' : 500,
			'height' : 290,
			'type' : 'iframe',
			'hideOnOverlayClick' : false,
			'showCloseButton' : false,
			'onClosed' : function() {
				window.location.href = '#';
			}
		});

		/**编辑   **/
		$("a.edit").fancybox({
			'width' : 733,
			'height' : 530,
			'type' : 'iframe',
			'hideOnOverlayClick' : false,
			'showCloseButton' : false,
			'onClosed' : function() {
				window.location.href = 'house_list.html';
			}
		});
	});
	/** 用户角色   **/
	var userRole = '';

	/** 模糊查询来电用户  **/
	function search() {
		$("#submitForm").attr("action", "house_list.html?page=" + 1).submit();
	}

	/** 新增   **/
	function add() {
		$("#submitForm").attr("action", "/xngzf/archives/luruFangyuan.action")
				.submit();
	}

	/** Excel导出  **/
	function exportExcel() {
		if (confirm('您确定要导出吗？')) {
			var fyXqCode = $("#fyXq").val();
			var fyXqName = $('#fyXq option:selected').text();
			//	 		alert(fyXqCode);
			if (fyXqCode == "" || fyXqCode == null) {
				$("#fyXqName").val("");
			} else {
				//	 			alert(fyXqCode);
				$("#fyXqName").val(fyXqName);
			}
			$("#submitForm").attr("action",
					"/xngzf/archives/exportExcelFangyuan.action").submit();
		}
	}

	/** 删除 **/
	function del(fyID) {
		// 非空判断
		if (fyID == '')
			return;
		if (confirm("您确定要删除吗？")) {
			$("#submitForm").attr("action",
					"/xngzf/archives/delFangyuan.action?fyID=" + fyID).submit();
		}
	}

	/** 批量删除 **/
	function batchDel() {
		if ($("input[name='IDCheck']:checked").size() <= 0) {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '至少选择一条',
				ok : true,
			});
			return;
		}
		// 1）取出用户选中的checkbox放入字符串传给后台,form提交
		var allIDCheck = "";
		$("input[name='IDCheck']:checked").each(
				function(index, domEle) {
					bjText = $(domEle).parent("td").parent("tr").last()
							.children("td").last().prev().text();
					// 			alert(bjText);
					// 用户选择的checkbox, 过滤掉“已审核”的，记住哦
					if ($.trim(bjText) == "已审核") {
						// 				$(domEle).removeAttr("checked");
						$(domEle).parent("td").parent("tr").css({
							color : "red"
						});
						$("#resultInfo").html("已审核的是不允许您删除的，请联系管理员删除！！！");
						// 				return;
					} else {
						allIDCheck += $(domEle).val() + ",";
					}
				});
		// 截掉最后一个","
		if (allIDCheck.length > 0) {
			allIDCheck = allIDCheck.substring(0, allIDCheck.length - 1);
			// 赋给隐藏域
			$("#allIDCheck").val(allIDCheck);
			if (confirm("您确定要批量删除这些记录吗？")) {
				// 提交form
				$("#submitForm").attr("action",
						"/xngzf/archives/batchDelFangyuan.action").submit();
			}
		}
	}

	/** 普通跳转 **/
	function jumpNormalPage(page) {
		$("#submitForm").attr("action", "house_list.html?page=" + page)
				.submit();
	}

	/** 输入页跳转 **/
	function jumpInputPage(totalPage) {
		// 如果“跳转页数”不为空
		if ($("#jumpNumTxt").val() != '') {
			var pageNum = parseInt($("#jumpNumTxt").val());
			// 如果跳转页数在不合理范围内，则置为1
			if (pageNum<1 | pageNum>totalPage) {
				art.dialog({
					icon : 'error',
					title : '友情提示',
					drag : false,
					resize : false,
					content : '请输入合适的页数，\n自动为您跳到首页',
					ok : true,
				});
				pageNum = 1;
			}
			$("#submitForm").attr("action", "house_list.html?page=" + pageNum)
					.submit();
		} else {
			// “跳转页数”为空
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '请输入合适的页数，\n自动为您跳到首页',
				ok : true,
			});
			$("#submitForm").attr("action", "house_list.html?page=" + 1)
					.submit();
		}
	}
</script>
<style>
.alt td {
	background: black !important;
}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck" /> <input
			type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName" />
		<div id="container">
			<!-- <div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
							小区
							<select name="fangyuanEntity.fyXqCode" id="fyXq" class="ui_select01" onchange="getFyDhListByFyXqCode();">
                                <option value=""
                                >--请选择--</option>
                                <option value="6">瑞景河畔</option>
                                <option value="77">蔚蓝小区</option>
                                <option value="83">和盛园小区</option>
                            </select>

							栋号
							<select name="fangyuanEntity.fyDhCode" id="fyDh" class="ui_select01">
                                <option value="">--请选择--</option>
                            </select>
							户型
							<select name="fangyuanEntity.fyHxCode" id="fyHx" class="ui_select01">
                                <option value="">--请选择--</option>
                                <option value="76">一室一厅一卫</option>
                                <option value="10">两室一厅一卫</option>
                                <option value="14">三室一厅一卫</option>
                                <option value="71">三室两厅一卫</option>
                            </select>
							状态
							<select name="fangyuanEntity.fyStatus" id="fyStatus" class="ui_select01">
                                <option value="">--请选择--</option>
                                <option value="26">在建</option>
                                <option value="25">建成待租</option>
                                <option value="13">已配租</option>
                                <option value="12">已租赁</option>
                                <option value="24">腾退待租</option>
                                <option value="23">欠费</option>
                                <option value="27">其他</option>
                            </select>

							座落&nbsp;&nbsp;<input type="text" id="fyZldz" name="fangyuanEntity.fyZldz" class="ui_input_txt02" />
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
							<input type="button" value="导入" class="ui_input_btn01" id="importBtn" />
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" />
						</div>
					</div>
				</div>
			</div> -->
			
			<div class="ui_content">
			<div>
							<input type="button" value="新增选修课程" class="ui_input_btn02" id="addCourse1" /> 
							<input type="button" value="新增专业课程" class="ui_input_btn02" id="addCourse0" /> 
							<!-- <input type="button" value="删除" class="ui_input_btn01" onclick="batchDel();" /> 
							<input type="button" value="导入" class="ui_input_btn01" id="importBtn" />
							<input type="button" value="导出" class="ui_input_btn01" onclick="exportExcel();" /> -->
						</div>
			</div>
<%-- 			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%"
						align="center" border="0">
						<tr>
							<!-- <th width="30"><input type="checkbox" id="all"
								onclick="selectOrClearAllCheckbox(this);" /></th> -->
							<th>序号</th>
							<th>课程编号</th>
							<th>课程名称</th>
							<th>课程学分</th>
							<th>课程学年</th>
							<th>上课时间</th>
							<th>操作</th>
							<!-- <th>租赁性质</th>
							<th>状态</th>
							<th>操作</th> -->
						</tr>
						<c:forEach items="${list }" var="course" varStatus="status">
						<tr>
							<!-- <td><input type="checkbox" name="IDCheck"
								value="14458579642011" class="acb" /></td> -->
							<td>${status.index +1 }</td>
							<td>${course.courseid }</td>
							<td>${course.coursename }</td>
							<td>${course.coursescore }</td>
							<td>${course.courseyear }</td>
							<td>每周${course.courseday },第${course.coursetime }节</td>
							<td><a href="${pageContext.request.contextPath}/admin/selectStuInClass?id=${course.courseid}"
								>编辑成绩</a> <!-- <a href="javascript:del('14458579642011');">删除</a> -->
							</td>
							<!-- <td>公租房</td>
							<td>建成待租</td>
							<td><a href="house_edit.html?fyID=14458579642011"
								class="edit">编辑</a> <a href="javascript:del('14458579642011');">删除</a>
							</td> -->
						</tr>
						</c:forEach>
						

						<!-- <tr>
								<td><input type="checkbox" name="IDCheck" value="14458625716623" class="acb" /></td>
								<td>城中区</td>
								<td>瑞景河畔16号楼1-112</td>
								<td>67.47㎡</td>
								<td>67.47㎡</td>
								<td>一室一厅一卫</td>
								<td>混凝土</td>
								<td>公租房</td>
								<td>已配租</td>
								<td>
									<a href="house_edit.html?fyID=14458625716623" class="edit">编辑</a> 
									<a href="javascript:del('14458625716623');">删除</a>
								</td>
							</tr>
						
							

						
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458619251417" class="acb" /></td>
								<td>城中区</td>
								<td>瑞景河畔16号楼6-161</td>
								<td>65.97㎡</td>
								<td>65.97㎡</td>
								<td>一室一厅一卫</td>
								<td>混凝土</td>
								<td>公租房</td>
								<td>已配租</td>
								<td>
									<a href="house_edit.html?fyID=14458619251417" class="edit">编辑</a> 
									<a href="javascript:del('14458619251417');">删除</a>
								</td>
							</tr> -->

					</table>
				</div>
				<!-- <div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有 <span class="ui_txt_bold04">90</span> 条记录，当前第 <span
							class="ui_txt_bold04">1 / 9</span> 页
					</div>
					<div class="ui_frt">
						   如果是第一页，则只显示下一页、尾页

						<input type="button" value="首页" class="ui_input_btn01" /> <input
							type="button" value="上一页" class="ui_input_btn01" /> <input
							type="button" value="下一页" class="ui_input_btn01"
							onclick="jumpNormalPage(2);" /> <input type="button" value="尾页"
							class="ui_input_btn01" onclick="jumpNormalPage(9);" />



						    如果是最后一页，则只显示首页、上一页

						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
						<input type="button" class="ui_input_btn01" value="跳转"
							onclick="jumpInputPage(9);" />
					</div>
				</div> -->
			</div> --%>
		</div>
	</form>

</body>
</html>
