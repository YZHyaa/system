<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>

<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!-- 引入jquery -->
<script type="text/javascript"   src="${APP_PATH }/static/js/jquery-3.3.1.min .js"></script>
<!-- 引入样式  -->
<link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript"   src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
 <!--  <script type="text/javascript" src="${APP_PATH}/static/js/index.js"></script>-->
</head>
<body>
	<!-- 搭建显示页面 -->
	<div class="container">
	
		<!-- =================================1.标题================================== -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		
		<!-- =================================2.按钮================================== -->
		<div class="row">
			<div>
				<div class="col-md-4 col-md-offset-8">
					<button class=" btn btn-primary" id="emp_add_modal_btn">新增</button>
					<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
				</div>
			</div>
		</div>
		
		<!-- =================================3.表格数据============================== -->		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table" >
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptNam</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- ================================4.分页信息================================ -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area">
				
			</div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
		
		<!-- ===============================员工添加的模态框=============================== -->
		<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">员工添加</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="empName_add_input" class="col-sm-2 control-label">empName</label>
								<div class="col-sm-10">
									<input type="text" name="empName" class="form-control"
										id="empName_add_input" placeholder="empName"> <span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="email_add_input" class="col-sm-2 control-label">email</label>
								<div class="col-sm-10">
									<input type="email" name="email" class="form-control"
										id="email_add_input" placeholder="@qq.com"> <span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">gender</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="gender" id="gender1_add_input" value="M" checked>
										男
									</label> <label class="radio-inline"> <input type="radio"
										name="gender" id="gender2_add_input" value="F"> 女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">deptName</label>
								<div class="col-sm-4">
									<!-- 部门提交id即可 -->
									<select name="dId" class="form-control" >
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
					</div>
				</div>
			</div>
		</div>

	<!-- ===============================员工修改 的模态框=============================== -->
		<div class="modal fade" id="empUpdateModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">员工修改</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">empName</label>
								<div class="col-sm-10">
									<p class="form-control-static" id="empName_update_static"></p>
								</div>
							</div>
							<div class="form-group">
								<label for="email_update_input" class="col-sm-2 control-label">email</label>
								<div class="col-sm-10">
									<input type="email" name="email" class="form-control"
										id="email_update_input" placeholder="@qq.com"> <span
										class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">gender</label>
								<div class="col-sm-10">
									<label class="radio-inline"> <input type="radio"
										name="gender" id="gender1_update_input" value="M" checked>
										男
									</label> <label class="radio-inline"> <input type="radio"
										name="gender" id="gender2_update_input" value="F"> 女
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">deptName</label>
								<div class="col-sm-4">
									<select name="dId" class="form-control">
									</select>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
					</div>
				</div>
			</div>

		</div>

	<!-- =============================================================================== -->
	<!-- =============================================================================== -->
	
	<script type="text/javascript">
		//总记录数   ,  当前页
		var totalRecord , currentPage;

		//页面加载完成后，直接发送一个ajax请求，要到分页数据	
		$(function() {
			//去首页
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					console.log(result);
					//1,解析并显示员工信息
					build_emps_table(result);
					//2，解析并显示分页信息
					build_page_info(result);
					//3,解析显示分页条数据
					build_page_nav(result);
				}
			});
		}

		//解析显示员工信息
		function build_emps_table(result) {
			//清空已有区域
			$("#emps_table tbody").empty();

			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(
						item.gender == 'M' ? "男" : "女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>")
						.append(item.department.deptName);
			
				//按钮
				var editBtn = $("<button></button>").addClass(
						"btn btn-primary btn-sm edit_btn").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义属性，来表示当前员工id
				editBtn.attr("edit-id", item.empId);
				var delBtn = $("<button></button>").addClass(
						"btn btn-danger btn-sm delete_btn").append(
						$("<span></span>")
								.addClass("glyphicon glyphicon-trash")).append(
						"删除");
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(
						delBtn);
				//为删除按钮添加一个自定义属性来表示当前删除的员工id
				delBtn.attr("del-id",item.empId);
				
				//append方法执行完后还是返回原来的元素，可以连续append
				$("<tr></tr>").append(checkBoxTd)
						.append(empIdTd)
						.append(empNameTd)
						.append(genderTd)
						.append(emailTd)
						.append(deptNameTd)
						.append(btnTd)
						.appendTo("#emps_table tbody");
			});
		}

		//解析显示分页信息 page_info_area
		function build_page_info(result) {
			//清空已有区域
			$("#page_info_area").empty();

			$("#page_info_area").append(
					"当前" + result.extend.pageInfo.pageNum + "页，总"
							+ result.extend.pageInfo.pages + "页，总"
							+ result.extend.pageInfo.total + "条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}

		//解析显示分页条 page_nav_area
		function build_page_nav(result) {
			//清空已有区域
			$("#page_nav_area").empty();

			//构建元素
			var ul = $("<ul></ul>").addClass("pagination");

			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));

			//判断有无前一页 无则不能点击
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加单击事件
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));

			//判断有无后一页 无则不能点击
			if (result.extend.pageInfo.hasNextPage == false) {
				lastPageLi.addClass("disabled");
				nextPageLi.addClass("disabled");
			} else {
				//为元素添加单击事件
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}

			//构造添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);

			//1,2..5遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});

			//添加下一页和末页的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入nav元素
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}

		//===================================新增按钮=======================================	
		//点击新增按钮弹出模态框
		$("#emp_add_modal_btn").click(function() {
			//表单重置(数据，样式)
			reset_form("#empAddModal form");
			//发送ajax请求，查出部门信息，显示在下拉列表中
			getDepts("#empAddModal select");
			//弹出模态框
			$("#empAddModal").modal({
				backdrop : "static"
			});
		});

		//表单重置
		function reset_form(ele) {
			$(ele)[0].reset();
			//清空样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}

		//查出部门信息并显示在下拉列表中
		function getDepts(ele) {
			//清空下拉列表
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "GET",
				success : function(result) {
					//console.log(result);
					//显示部门信息在下拉列表中
					//$("#empAddModal select").append("")
					$.each(result.extend.depts, function() {
						var optionEle = $("<option></option>").append(
								this.deptName).attr("value", this.deptId);
						optionEle.appendTo(ele);
					});
				}
			});
		}

		//=======================================保存按钮==========================================
		//模态框填写的表单的数据 提交保存
		$("#emp_save_btn")
				.click(
						function() {
							//1,先对模态框的数据进行校验
							//前端校验
							if (!validate_add_form()) {
								return false;
							}
							//ajax用户名重复校验
							if ($(this).attr("ajax-va") == "error") {
								return false;
							}
							//2,发送Ajax请求保存员工
							$
									.ajax({
										url : "${APP_PATH}/emp",
										type : "POST",
										data : $("#empAddModal form")
												.serialize(),
										success : function(result) {
											if (result.code == 100) {
												//员工保存成功后:
												// 1,关闭模态框
												$("#empAddModal").modal("hide");

												// 2，来到最后一页
												// 发送Ajax请求显示最后一页数据
												to_page(totalRecord);
											} else {
												//后端jrs校验（防止跳过前端校验）
												//显示失败信息
												if (undefined != result.extend.errorField.email) {
													//显示邮箱错误信息
													show_vaildate_msg(
															"#email_add_input",
															"error",
															result.extend.errorField.email);
												}

												if (undefined != result.extend.errorField.empName) {
													//显示用户名错误信息
													show_vaildate_msg(
															"#empName_add_input",
															"error",
															result.extend.errorField.empName);
												}
											}
										}
									});
						});

		//前端校验
		function validate_add_form() {
			//使用jq的正则表达式校验 （用户名）
			var empName = $("#empName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(empName)) {
				//alert("用户名可以是2-5位中文或者5-16位英文的组合");
				show_validate_msg("#empName_add_input", "error",
						"用户名必须是是2-5位中文或者6-16位英文和数字的组合");
				return false;
			} else {
				show_validate_msg("#empName_add_input", "success", "");
			}

			//校验邮箱信息
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//alert("邮箱格式不正确");
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			}

			return true;
		}

		//显示校验结果
		function show_validate_msg(ele, status, msg) {
			//清除当前校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");

			if (status == "success") {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if (status == "error") {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		//ajax用户名重复校验
		$("#empName_add_input").change(
				function() {
					//发送Ajax请求校验用户名是否可用
					var empName = this.value;
					$.ajax({
						url : "${APP_PATH}/checkuser",
						data : "empName=" + empName,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								show_validate_msg("#empName_add_input",
										"success", "用户名可用");
								$("#emp_save_btn").attr("ajax-va", "success");
							} else {
								show_validate_msg("#empName_add_input",
										"error", result.extend.va_msg);
								$("#emp_save_btn").attr("ajax-va", "error");
							}
						}
					});
				});

		//====================================编辑按钮=======================================
		//1，可以在创建按钮的时候绑定事件 (无法直接绑定) 
		//2，jq新版本删除了live , 通过on进行替代
		$(document).on("click", ".edit_btn", function() {
			//1，显示部门信息
			getDepts("#empUpdateModal select");
			//2，查出员工信息 并显示员工信息
			getEmp($(this).attr("edit-id"));
			//3, 把员工的id传给模态框的更新按钮
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
			//4, 显示模态框
			$("#empUpdateModal").modal({
				backdrop : "static"
			});

		});

		//查询员工信息
		function getEmp(id) {
			$.ajax({
				url : "${APP_PATH}/emp/" + id,
				type : "GET",
				success : function(result) {
					var empData = result.extend.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val(
							[ empData.gender ]);
					$("#empUpdateModal select").val([ empData.dId ]);
				}
			});
		}

		//========================================更新按钮======================================
		$("#emp_update_btn").click(function(){
			//验证邮箱是否合法
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				//alert("邮箱格式不正确");
				show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
				return false;
			} else {
				show_validate_msg("#email_add_input", "success", "");
			}
			
			//2,发送ajax请求保存更新的内容
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#empUpdateModal form").serialize(),
				success:function(result){
					//关闭模态框 
					$("#empUpdateModal").modal("hide");
					//返回本页面
					to_page(currentPage);
				}
			});
		});
		
		//==================================删除按钮======================================	
		$(document).on("click",".delete_btn",function(){
			//1,确认删除对话框
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var empId = $(this).attr("del-id");
			if(confirm("确认删除【"+empName+"】)吗？")){
				//确认后 发送Ajax请求 
				$.ajax({
					url:"${APP_PATH}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						alert("删除成功！");
						//返回本页面
						to_page(currentPage);
					}
				});
			}
		});	
			
			
		//====================================全选按钮====================================	
		//完成全选与全不选
		$("#check_all").click(function(){
			//attr是undefined(对于dom原生属性用prop，attr用来获取自定属性的值)
			 $(".check_item").prop("checked",$(this).prop("checked"));
		});
			
		// 全选时全选
		$(document).on("click",".check_item",function(){
			//判断当前选中的元素是否是5个
			var flag = $(".check_item:checked").length == $(".check_item").length
			$("#check_all").prop("checked",flag);
		});
			
		//=====================================全部删除按钮===============================
		$("#emp_delete_all_btn").click(function(){
			var empNames = "";
		    var del_idstr = "";
		    
		    //所有被勾选的员工名,id
			$.each($(".check_item:checked"),function(){
				empNames += $(this).parents("tr").find("td:eq(2)").text()+',';
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+'-';
			});
			empNames = empNames.substring(0,empNames.length-1);
			del_idstr = empNames.substring(0,del_idstr.length-1);
			
			if(confirm("确认删除【"+empNames+"】吗？")){
				//发送Ajax
				$.ajax({
					url:"{APP_PATH}/emp/"+del_idstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
			
	</script>	
	
</body>
</html>