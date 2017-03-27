/**
 * Created by apple on 15-10-15.
 */
//doc: http://www.trirand.com/jqgridwiki/doku.php?id=wiki%3aoptions
//manual: http://www.guriddo.net/demo/guriddojs
//code: https://github.com/tonytomov/jqGrid
var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var grid_lastSel = null;
var grid_data = null;
function jqgrid_row_opt(rowid, response) {
    hthjs.common.debug('jqgrid_edit_row');
    hthjs.common.debug(rowid);
    hthjs.common.debug(response);
    if (!hthjs.common.isNull(response)) {
        if (!hthjs.common.isNull(response.responseJSON)) {
            if (!hthjs.common.isNull(response.responseJSON.returnDescipt)) {
                jqgrid_show_notice(response.responseJSON.returnDescipt);
            } else {
                jqgrid_show_notice(response.responseText);
            }
        } else {
            if (!hthjs.common.isNull(response.returnDescipt)) {
                jqgrid_show_notice(response.returnDescipt);
            }
        }
    }
    $(grid_selector).trigger("reloadGrid");
}

var jqgrid_show_notice = function (message) {
    if ($('#load_grid-table').length > 0 && !hthjs.common.isNull(message)) {
        $('#load_grid-table').hide();
        $('#load_grid-table').text(message);
        $('#load_grid-table').show();
    }
    setTimeout(function () {
        jqgrid_hide_notice();
    }, 3000);
}

var jqgrid_hide_notice = function () {
    if ($('#load_grid-table').length > 0) {
        $('#load_grid-table').hide();
    }
}

//edittype: 'custom', editoptions: { custom_element: readOnlyElement, custom_value: readOnlyValue}
//    function readOnlyElement(value, options) {
//        return $('<span></span>', { text: value });
//    }
//
//    function readOnlyValue(elem, operation, value) {
//        if (operation === 'get') {
//            return $(elem).text();
//        } else if (operation === 'set') {
//            $('span', elem).text(value);
//        }
//    }
//enable search/filter toolbar
//$(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})

//switch element when editing inline
function aceSwitch(cellvalue, options, cell) {
    setTimeout(function () {
        $(cell).find('input[type=checkbox]')
            .wrap('<label class="inline" />')
            .addClass('ace ace-switch ace-switch-5')
            .after('<span class="lbl"></span>');
    }, 0);
}

//enable datepicker
function pickDate(cellvalue, options, cell) {
    setTimeout(function () {
        $(cell).find('input[type=text]')
            .datetimepicker({format: 'yyyy-mm-dd HH:mm:ss', language: 'zh-CN', autoclose: true});
    }, 0);
}

function style_edit_form(form) {
    //enable datepicker on "sdate" field and switches for "stock" field
    form.find('input[name=sdate]').datepicker({format: 'yyyy-mm-dd', autoclose: true})
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
    if (form.data('styled')) return false;

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
						var cclass = $.trim(icon.attr('class').replace('ui-icon', ''));
						if(cclass in replacement) icon.attr('class', 'ui-icon '+replacement[cclass]);
					})
     */
}

//replace icons with FontAwesome icons like above
function updatePagerIcons(table) {
    var replacement =
    {
        'ui-icon-seek-first': 'icon-double-angle-left bigger-140',
        'ui-icon-seek-prev': 'icon-angle-left bigger-140',
        'ui-icon-seek-next': 'icon-angle-right bigger-140',
        'ui-icon-seek-end': 'icon-double-angle-right bigger-140'
    };
    $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
        var icon = $(this);
        var cclass = $.trim(icon.attr('class').replace('ui-icon', ''));

        if (cclass in replacement) icon.attr('class', 'ui-icon ' + replacement[cclass]);
    })
}

function enableTooltips(table) {
    $('.navtable .ui-pg-button').tooltip({container: 'body'});
    $(table).find('.ui-pg-div').tooltip({container: 'body'});
}

//var selr = $(grid_selector).jqGrid('getGridParam','selrow');

var getColumnIndexByName = function (table, columnName) {
    var cm = $(table).jqGrid('getGridParam', 'colModel'), i = 0, l = cm.length;
    for (; i < l; i += 1) {
        if (cm[i].name === columnName) {
            return i; // return the index
        }
    }
    return -1;
};

var addInLineAction = function (table, actionParams) {
    var iCol = getColumnIndexByName(table, actionParams.colName); // 'act' - name of the actions column
    $(table).children("tbody")
        .children("tr.jqgrow")
        .children("td:nth-child(" + (iCol + 1) + ")")
        .each(function (index) {
            var rowid = index + 1;
            if (hthjs.common.isNull(actionParams.exlude)
                || !actionParams.exlude(rowid)) {
                $("<div>",
                    {
                        title: actionParams.title,
                        mouseover: hthjs.common.isNull(actionParams.mouseover) ? function () {
                            $(this).addClass('ui-state-hover');
                        } : actionParams.mouseover,
                        mouseout: hthjs.common.isNull(actionParams.mouseout) ? function () {
                            $(this).removeClass('ui-state-hover');
                        } : actionParams.mouseout,
                        click: hthjs.common.isNull(actionParams.click) ? function (e) {
                            alert("'Custom' button is clicked in the rowis=" +
                                $(e.target).closest("tr.jqgrow").attr("id") + " !");
                        } : actionParams.click
                    }
                ).css({"margin-left": "5px", float: "left"})
                    .addClass("ui-pg-div ui-inline-custom")
                    .addClass(actionParams.class)
                    .append(hthjs.common.isNull(actionParams.icon) ? '<span class="ui-icon ui-icon-pencil"></span>' : actionParams.icon)
                    .appendTo($(this).children("div"));
            }
        });
};

var buildOptsStr = function (optsObj) {
    var ret = "";
    if (!hthjs.common.isNull(optsObj)) {
        for (var o in optsObj) {
            if (!hthjs.common.isNull(optsObj[o])) {
                ret += o + ":" + optsObj[o] + ";";
            }
        }
    }
    if (ret.length > 0) {
        ret = ret.substring(0, ret.length - 1);
    }
    return ret;
}

var getKeyInOpts = function (optsObj, value) {
    var ret = "";
    if (!hthjs.common.isNull(optsObj)) {
        for (var o in optsObj) {
            if (optsObj[o] == value) {
                ret = o;
                break;
            }
        }
    }
    return ret;
}

var showMsg4CallBack = function (callerId, title, msg) {
    if (callerId.indexOf('.action_') >= 0) {
        jqgrid_show_notice(msg);
    } else {
        hthjs.common.debug(msg);
    }
};

var optAjaxCallBack = function (callerId, type, obj) {
    switch (type) {
        case hthjs.net.ajaxActionType.beforeSend: //beforeSend
            showMsg4CallBack(callerId, '提示', '提交中...');
            break;
        case hthjs.net.ajaxActionType.success: //success;
            if (obj != null) {
                var ret = eval(obj);
                if (null != ret) {
                    showMsg4CallBack(callerId, '提示', ret.returnDescipt);
                    if (ret.returnCode == '000000') {
                        $(grid_selector).trigger("reloadGrid");
                    } else if (ret.returnCode == '300007') {
                        window.location.reload();
                    }
                } else {
                    showMsg4CallBack(callerId, '提示', '操作失败！');
                }
            } else {
                showMsg4CallBack(callerId, '提示', '操作失败！');
            }
            break;
        case hthjs.net.ajaxActionType.complete: //complete
            break;
        case hthjs.net.ajaxActionType.error:
            showMsg4CallBack(callerId, '提示', '操作失败！');
            break;
        default: //error
            break;
    }
};