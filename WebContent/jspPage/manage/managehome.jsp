<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<script src="<%=request.getContextPath()%>/js/hth-jqgrid.js"></script>
		<script src="<%=request.getContextPath()%>/js/hth-common.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理系统</title>
	</head>

	<body>
	
		<%@ include file="top.jsp" %>
		<div class="main-container" id="main-container" >

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<%@ include file="leftbar.jsp" %>

			 <div class="main-content" style="padding-left:0px;">
            <!-- .breadcrumb -->
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">首页</a>
                    </li>
                    <li><a href="#">人员配置管理</a></li>
                    <li class="active">人员管理</li>
                </ul>
            </div>

            <!-- /.content -->
            <div class="container" style="padding-left:0px;max-width: 1500px;">

                <div class="row" style="padding-left:0px;margin-left:0px;">
                    <div class="col-xs-12" style="padding-left:0px;">
                        <!-- PAGE CONTENT BEGINS -->
                        <table id="grid-table"></table>

                        <div id="grid-pager"></div>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
		</div><!-- /.page-content -->
		</div>
</div><!-- /#ace-settings-container -->
	<%@ include file="footer.jsp" %>
        <script src="<%=request.getContextPath()%>/js/hth-jqgrid.js?v=20151010"></script>
        <script src="<%=request.getContextPath()%>/bootstrap/js/date-time/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript">
		
		function init() {
			 var sexType = { "1": "男", "2": "女"};
			 var sexTypeS = buildOptsStr(sexType);
		    $(grid_selector).jqGrid({
		        url: '/SAES/manage/getUserListAction', //获取数据的地址
		        datatype: "json", //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
		        mtype: "POST", //ajax提交方式。POST或者GET，默认GET
		        jsonReader: { //描述json 数据格式的数组
		            root: "list", //定义json根节点名称
		            repeatitems: false, //指明每行的数据是可以重复的，如果设为false，则会从返回的数据中按名字来搜索元素，这个名字就是colModel中的名字
		            page: "pageNo", //定义json分页参数名称－当前页号
		            total: "pageTotal", //定义json分页参数名称－总页数
		            records: "recordTotal" //定义json分页参数名称－查询出的总记录数
		        },
		        height: "100%", //表格高度，可以是数字，像素值或者百分比
		        width: "100%",
		        autowidth: true,
		        colNames:['操作','编号','系统账号','用户密码', '工号','姓名','科室','性别', '身份证号', '出生日期','职称','研究方向','手机号','邮箱'],
		        colModel: [
		            {
		                name: 'myac', index: '', width: "80", fixed: true, sortable: false, resize: false,
		                formatter: 'actions',
		                formatoptions: {
		                    keys: true,
		                    editbutton: true,
		                    delbutton: true,
		                    afterSave: jqgrid_row_opt,
		                    delOptions: {
		                        mtype: 'POST',
		                        url: '/SAES/manage/delUserAction',
		                        recreateForm: true,
		                        beforeShowForm: beforeDeleteCallback,
		                        afterSave: jqgrid_row_opt,
		                        serializeDelData: function (postdata) {
		                            var rowdata = $(this).jqGrid('getRowData', postdata.id);
		                            postdata.userId = rowdata.ID;
		                            return postdata;
		                        }
		                    },
		                    editOptions: {
		                        mtype: 'POST',
		                        url: '/SAES/manage/updateUserAction',
		                        recreateForm: false,
		                        afterSave: jqgrid_row_opt
		                    }
		                }
		            },
		            {name: 'ID', index: 'ID', width: "4%", hidden:true, editable:true, editrules: { edithidden: false }},
		            {name: 'ACCOUNT', index: 'ACCOUNT', width: "4%", hidden:false, editable:true, editrules: {size: "10"}},
		            {name: 'PASSWORD', index: 'PASSWORD', width: "15%", hidden:true, editable:true, editrules: { edithidden: true },edittype:'password'},
		            {name: 'PERSON_ID', index: 'PERSON_ID', width: "4%", editable: true, editoptions: {size: "4", maxlength: "4"}},
		            {name: 'NAME', index: 'NAME', width: "8%", editable: true, editoptions: {size: "4", maxlength: "4"}},
		            {name: 'UNIT_ID', index: 'UNIT_ID', width: "10%", editable: true,edittype:'select', formatter:'select',stype:'select'},
					{name: 'SEXID', index: 'SEXID', width: "5%", editable: true, editoptions: {size: "2", maxlength: "2"}
					,edittype: "select",editoptions: {value: sexTypeS}, formatter: function (v, opt, rec) {return sexType[v];}},
		            {name: 'ID_CARD', index: 'ID_CARD', width: "15%", editable: true, editoptions: {size: "19", maxlength: "19"}},
		            {name: 'BIRTHDAY', index: 'BIRTHDAY', width: "15%",editable:true, sorttype:"date", formatter:'date',
		            	   formatoptions: {srcformat:'Y-m-d H:i:s',newformat:'Y-m-d H:i:s'},unformat: pickDate},
		            
		            {name: 'TITLE', index: 'TITLE', width: "15%", editable: true, editoptions: {size: "6", maxlength: "6"}},
		            {name: 'RESEARCH_FIELD', index: 'RESEARCH_FIELD', width: "10%", editable: true, editoptions: {size: "10", maxlength: "12"}},
					
		            {name: 'MOBILE', index: 'MOBILE', width: "10%", editable: true, editoptions: {size: "11", maxlength: "11"}},
		            {name: 'EMAIL', index: 'EMAIL', width: "15%", editable: true, editoptions: {size: "12", maxlength: "12"}}
		            
					
		        ],
		        viewrecords: true, //定义是否要显示总记录数
		        rowNum: 10, //在grid上显示记录条数，这个参数是要被传递到后台
		        rowList: [10, 20, 30], //一个下拉选择框，用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台
		        pager: pager_selector, //定义翻页用的导航栏，必须是有效的html元素。翻页工具栏可以放置在html页面任意位置
		        altRows: true, //设置表格zebra-striped值
		        multiselect: false, //定义是否可以多选, TODO
		        //multikey: "ctrlKey", //只有在multiselect设置为true时起作用，定义使用那个key来做多选。shiftKey，altKey，ctrlKey
			    multiboxonly: true, //只有在multiselect设置为true时起作用，当multiboxonly为true时只有选择checkbox才会起作用
			    beforeProcessing: function (data) {
			    	UNIT_ID = JSON.stringify(data.selectMap);
			    	UNITID = JSON.parse(UNIT_ID);
			    	UNITNAME = buildOptsStr(UNITID);
		            $(grid_selector).setColProp('UNIT_ID', { editoptions: { value: UNITNAME} }); 
		            $(grid_selector).setColProp('UNIT_ID', { searchoptions: { value: UNITNAME} }); 
		    	},
			    //view
		        loadComplete: function () {
		        	var table = this;
					setTimeout(function(){
						styleCheckbox(table);
						
						updateActionIcons(table);
						updatePagerIcons(table);
						enableTooltips(table);
					}, 0);
					$(".tooltip-inner").css("display","none");
		        },
		        //edit
		        editurl: '/SAES/manage/updateUserAction',
		        prmNames: {
		            oper: "opt"
		        },
		        ondblClickRow: function (id) {
		            if (id && id !== grid_lastSel) {

		                $(this).jqGrid('restoreRow', grid_lastSel);
		                grid_lastSel = id;
		            }
		        }
		    });

		  //switch element when editing inline
			function aceSwitch( cellvalue, options, cell ) {
				setTimeout(function(){
					$(cell) .find('input[type=checkbox]')
							.wrap('<label class="inline" />')
						.addClass('ace ace-switch ace-switch-5')
						.after('<span class="lbl"></span>');
				}, 0);
			}
			//enable datepicker
			//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
				}
		    //navButtons
		   var navButtons= $(grid_selector).jqGrid('navGrid', pager_selector,
		            { 	//navbar options
					    search: true,
		                searchicon: 'icon-search orange',
		                edit: false,
		                editicon: 'icon-pencil blue',
		                add: true,
		                addicon: 'icon-plus-sign purple',
		                del: false,
		                delicon: 'icon-trash red',
		                refresh: true,
		                refreshicon: 'icon-refresh green',
		                view: false,
		                viewicon: 'icon-zoom-in grey'
		            },
		            {
						//edit record form
						//closeAfterEdit: true,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if(form.data('styled')) return false;
							
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_delete_form(form);
							
							form.data('styled', true);
						},
						onClick : function(e) {
							alert(1);
						}
					},
					{
						//search form
						recreateForm: true,
						afterShowSearch: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw: function(){
							style_search_filters($(this));
						}
						,
						multipleSearch: true,
						/**
						multipleGroup:true,
						showQuery: true
						*/
					},
					{
						//view record form
						recreateForm: true,
						beforeShowForm: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
						}
					}
				)
			
			
				
				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
						.end().find('input[name=stock]')
							  .addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
					buttons.eq(1).prepend('<i class="icon-remove"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').remove();
					buttons.eq(0).append('<i class="icon-chevron-left"></i>');
					buttons.eq(1).append('<i class="icon-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
					buttons.eq(1).prepend('<i class="icon-remove"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
			
			
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')
			
			
					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}
				
			
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-icon-pencil' : 'icon-pencil blue',
						'ui-icon-trash' : 'icon-trash red',
						'ui-icon-disk' : 'icon-ok green',
						'ui-icon-cancel' : 'icon-remove red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}
				
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
						'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
						'ui-icon-seek-next' : 'icon-angle-right bigger-140',
						'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
		
		}
		$().ready(function () {
			$(".nav-list").children('li').removeClass("active");
			$("#userItem").addClass("active");
			$("#usermanage").addClass("active");
		    init();
		});
		</script>
	</body>

</html>