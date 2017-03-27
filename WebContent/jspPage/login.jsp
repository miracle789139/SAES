<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录界面</title>
		<link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" />
        <script src="<%=request.getContextPath()%>/js/ALERT.js"></script>

		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace-rtl.min.css" />
		<script src="<%=request.getContextPath()%>/bootstrap/js/html5shiv.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/respond.min.js"></script>
		
		
	</head>

	<body class="login-layout" style="background-color: rgb(64, 101, 150);min-height:660px; height:auto!important; height:660px;">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container" style="width:440px">
							<div class="center">
								<h1>
								<!-- 	<i class="icon-leaf green"></i> -->
									<span class="white">上 海 市 教 育 科 学 研 究 院</span>
								</h1>
								<h4 class="white">Shanghai Academy of Educational Sciendes</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border" style="background-color: #4C87C3;">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												用户登录
											</h4>

											<div class="space-6"></div>

											<form >
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" id="userId" name="userId" class="form-control" placeholder="系统账户" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password"  id="password" name="password" class="form-control" placeholder="用户密码" />
															<i class="icon-lock"></i>
														</span>
													</label>

													<div style="height:20px;margin:0px 0;overflow:hidden;color:red">
													<span id="failInfoDialog">
													
													</span>
													</div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" />
															<span class="lbl"> 记住用户名</span>
														</label>

														<button onclick="myLoginClick()" type="button" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="icon-key"></i>
															登录
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											
											
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" onclick="show_box('forgot-box');" class="forgot-password-link">
													<i class="icon-arrow-left"></i>
													忘记密码
												</a>
											</div>

							
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="icon-key"></i>
												找回密码
											</h4>

											<div class="space-6"></div>
											<p>
												输入注册时的EMAIL地址
											</p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="icon-lightbulb"></i>
															发送给我
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /widget-main -->

										<div class="toolbar center">
											<a href="#" onclick="show_box('login-box'); " class="back-to-login-link">
												返回登录
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="icon-group blue"></i>
												New User Registration
											</h4>

											<div class="space-6"></div>
											<p> Enter your details to begin: </p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" />
															<i class="icon-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Repeat password" />
															<i class="icon-retweet"></i>
														</span>
													</label>

													<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="icon-refresh"></i>
															Reset
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success">
															Register
															<i class="icon-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" onclick="show_box('login-box'); " class="back-to-login-link">
												<i class="icon-arrow-left"></i>
												Back to login
											</a>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /signup-box -->
							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->

		<script src="<%=request.getContextPath()%>/bootstrap/js/jquery.min.js"></script>
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=request.getContextPath()%>/bootstrap/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=request.getContextPath()%>/bootstrap/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>

		<script type="text/javascript">
		function myLoginClick(){
			var userId=$('#userId').val();
			var password=$('#password').val();
				if(userId==""||password==""){
					Alert("请输入用户名和密码");
					return;
				}
			 $.ajax({
				url : "loginAction",
				type : "POST",
				dataType : "json",
				data : {"userId":userId,"password":password},
				success : function(data) {
			         if(data["returnCode"]=="000000"){
			        	 window.document.location.href="/SAES/getHomeViewAction";
		              }
			         else if(data["returnCode"]=="000002"){//管理员
			        	 window.document.location.href="/SAES/manage/getManageViewAction";
			         }
					else{
					$("#failInfoDialog").html("用户名或者密码错误");
					}
				},
				error : function() {
					$("#failInfoDialog").html("请求失败，请稍后重试");
				}
		  }); 
		}
		
			function show_box(id) {
			 jQuery('.widget-box.visible').removeClass('visible');
			 jQuery('#'+id).addClass('visible');
			}
		</script>
	</body>
</html>
