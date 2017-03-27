<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理系统</title>
	</head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/upload/fileinput.min.css" />
	<body>
	
		<%@ include file="top.jsp" %>
		<div class="main-container" id="main-container" >
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

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
                    <li><a href="#">系统信息管理</a></li>
                    <li class="active">公告管理</li>
                </ul>
            </div>

            <!-- /.content -->
            <div class="container" style="padding-left:0px;max-width: 1500px;">
		<!-- <form action="/CallCenter/vm/console/Upload" method="post" enctype="multipart/form-data">
                        <input id="uploadFile" type="file" name="file">
                        <button type="submit" class="btn btn-primary">上传公告文件</button>
                    </form> -->
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
	<!-- inline scripts related to this page -->
<!-- ##refer: https://github.com/kartik-v/bootstrap-fileinput/ -->
<script src="<%=request.getContextPath()%>/bootstrap/js/upload/fileinput.min.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/upload/fileinput_locale_zh.js"></script>
<script src="<%=request.getContextPath()%>/js/hth-jqgrid.js?v=${js_ver}"></script>
        <script src="<%=request.getContextPath()%>/js/hth-jqgrid.js?v=20151010"></script>
         <script src="<%=request.getContextPath()%>/bootstrap/js/date-time/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript">

		function init() {
			 var uploadFile_QG_options = {
				        language: 'zh',
				        showPreview: false,
				        uploadUrl: '/CallCenter/vm/console/ajUpload?srcType=QG',
				        allowedFileExtensions: ['xls', 'xlsx'],
				        layoutTemplates: {
				            btnBrowse: '<div tabindex="500" class="{css}"{status}>{icon}选择文件</div>'
				        }
				    };
				    $("#uploadFile").fileinput(uploadFile_QG_options);
				    var uploadFile_fileuploaded = function(event, data, previewId, index) {
				        var form = data.form, files = data.files, extra = data.extra,
				                response = data.response, reader = data.reader;
				        hthjs.common.debug(event);
				        hthjs.common.debug(data);
				        var fileInput = this;
				        setTimeout(function () {
				            //hthjs.common.debug($(event.currentTarget.form));
				            $(event.currentTarget.form).find("button.fileinput-remove-button").trigger('click');
				            if (!hthjs.common.isNull(response)) {
				                if (!hthjs.common.isNull(response.returnCode) && response.returnCode == '000000') {
				                    jqgrid_row_opt(0, response);
				                } else {
				                    if (!hthjs.common.isNull(response.returnDescipt)) {
				                        jqgrid_show_notice(response.returnDescipt);
				                    }
				                }
				            }
				        }, 0);
				    };
				    $('#uploadFile').on('fileuploaded', uploadFile_fileuploaded);
			
			 var topType = { "1": "置顶", "2": "不置顶"};
			 var topTypeS = buildOptsStr(topType);
		    $(grid_selector).jqGrid({
		        url: '/SAES/manage/getNotifyAction', //获取数据的地址
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
		        colNames:['操作','标题', '内容','查阅次数','公告类型','是否置顶','发布人','发布时间','操作时间','附件','编号'],
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
		                        url: '/SAES/manage/delNotifyAction',
		                        recreateForm: true,
		                        beforeShowForm: beforeDeleteCallback,
		                        serializeDelData: function (postdata) {
		                            var rowdata = $(this).jqGrid('getRowData', postdata.id);
		                            postdata.unitId = rowdata.ID;
		                            return postdata;
		                        }
		                    },
		                    editOptions: {
		                        mtype: 'POST',
		                        url: '/SAES/manage/updateNotifyAction',
		                        recreateForm: false,
		                        afterSave: jqgrid_row_opt
		                    }
		                }
		            },
		            {name: 'TITLE', index: 'TITLE', width: "10%", editable: true, editoptions: {size: "15", maxlength: "15"},editrules:{required:true},},
		            {name: 'CONTENT', index: 'CONTENT', width: "20%", editable: true, editoptions: {size: "15", maxlength: "152"},edittype: "textarea"},
		            {name: 'VIEW_TIMES', index: 'VIEW_TIMES', width: "8%", editable: false, editoptions: {size: "15", maxlength: "15"}},
		            {name: 'NOTIFY_TYPE', index: 'NOTIFY_TYPE', width: "10%", editable: true, editoptions: {size: "15", maxlength: "15"},editrules:{required:true}},
		            {name: 'TITLE_TOP_FLAG', index: 'TITLE_TOP_FLAG', width: "10%", editable: true, editoptions: {size: "2", maxlength: "2"}
					,edittype: "select",editoptions: {value: topTypeS}, formatter: function (v, opt, rec) {return topType[v];}},
		            {name: 'SENDER_NAME', index: 'SENDER_NAME', width: "10%", editable: false, editoptions: {size: "15", maxlength: "15"}},
		            {name: 'SEND_DATE', index: 'SEND_DATE', width: "15%",   editable:false, sorttype:"date", formatter:'date',
		            	   formatoptions: {srcformat:'Y-m-d H:i:s',newformat:'Y-m-d H:i:s'},unformat: pickDate},
		            {name: 'OPERATE_TIME', index: 'OPERATE_TIME', width: "15%", editable:false, sorttype:"date", formatter:'date',
			            	   formatoptions: {srcformat:'Y-m-d H:i:s',newformat:'Y-m-d H:i:s'},unformat: pickDate},
		            {name: 'FILE_ID', index: 'FILE_ID', width: "10%", editable: true, edittype: "file"},
		            {name: 'ID', index: 'ID', width: "0%",hidden:true, editable:true,editrules: { edithidden: false }}
					
		        ],
		        viewrecords: true, //定义是否要显示总记录数
		        rowNum: 10, //在grid上显示记录条数，这个参数是要被传递到后台
		        rowList: [10, 20, 30], //一个下拉选择框，用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台
		        pager: pager_selector, //定义翻页用的导航栏，必须是有效的html元素。翻页工具栏可以放置在html页面任意位置
		        altRows: true, //设置表格zebra-striped值
		        multiselect: false, //定义是否可以多选, TODO
		        //multikey: "ctrlKey", //只有在multiselect设置为true时起作用，定义使用那个key来做多选。shiftKey，altKey，ctrlKey
			    multiboxonly: true, //只有在multiselect设置为true时起作用，当multiboxonly为true时只有选择checkbox才会起作用
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
		        editurl: '/SAES/manage/updateNotifyAction',
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
					var buttons = dialog.find('.EditTable');
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
			$("#systemItem").addClass("active");
			$("#notifymanage").addClass("active");
		    init();
		});
		</script>
	</body>

</html>