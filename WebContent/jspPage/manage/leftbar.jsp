<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div>
					<!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
						<li >
							<a href="#">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 控制台 </span>
							</a>
						</li>

						<li id="userItem" class="active">
							<a href="#" class="dropdown-toggle">
								<i class="icon-user"></i>
								<span class="menu-text"> 人员配置管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li id="usermanage">
									<a href="<%=request.getContextPath()%>/manage/getManageViewAction">
										<i class="icon-double-angle-right"></i> 人员管理
									</a>
								</li>

								<li id="unitmanage">
									<a href="<%=request.getContextPath()%>/manage/getUnitViewAction">
										<i class="icon-double-angle-right"></i> 科室管理
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i> 研究所管理
									</a>
								</li>

							</ul>
						</li>
						<li id="systemItem">
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 系统信息管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">

								<li id="notifymanage">
									<a href="<%=request.getContextPath()%>/manage/getNotifyViewAction">
										<i class="icon-double-angle-right"></i> 公告管理
									</a>
								</li>
								<li id="filemanage">
									<a href="#">
										<i class="icon-double-angle-right"></i> 文件管理
									</a>
								</li>
								
					            <li>
								<a href="#">
									<i class="icon-double-angle-right"></i> 公告类型
								</a>
						</li>		
						</ul>
						</li>

						<li id="taskItem">
							<a href="#" class="dropdown-toggle">
								<i class="icon-tasks"></i>
								<span class="menu-text"> 项目管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i> 项目来源
									</a>
								</li>
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i> 项目性质
									</a>
								</li>
								
					            <li>
								<a href="#">
									<i class="icon-double-angle-right"></i> 项目类型
								</a>
						</li>		
						</ul>
						</li>

						<li id="fileItem">
							<a href="#" class="dropdown-toggle">
								<i class="icon-file"></i>
								<span class="menu-text"> 文件管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i> 文件管理
									</a>
								</li>

								

							</ul>
						</li>
						

					</ul>
					<!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
			</div>