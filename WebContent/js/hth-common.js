/**
 * Created by apple on 15-10-15.
 */
(function (hthjs, $, undefined) {
    hthjs.common = hthjs.common || {};
    hthjs.net = hthjs.net || {}; //net module

    /**
     * AJ-POST请求
     * @param callerId 同hthjs.net.ajax
     * @param pUrl 同hthjs.net.ajax
     * @param pData 同hthjs.net.ajax
     * @param async 同hthjs.net.ajax
     * @param callback 同hthjs.net.ajax
     */
    hthjs.net.ajax_post = function (callerId, pUrl, pData, async, callback) {
        hthjs.net.ajax(callerId, pUrl, pData, 'POST', async, false, callback);
    }

    /**
     * 枚举网络操作结果类型
     * @type {{beforeSend: number, success: number, complete: number, error: number}}
     */
    hthjs.net.ajaxActionType = {
        beforeSend: 1,
        success: 2,
        complete: 3,
        error: 4
    }

    /**
     * AJ请求
     * @param callerId 调用标签jquery-id，例如“#tagid”
     * @param pUrl (默认: 当前页地址) 发送请求的地址
     * @param pData data 发送到服务器的数据。将自动转换为请求字符串格式。GET 请求中将附加在 URL 后。必须为 Key/Value 格式。如果为数组，jQuery 将自动为不同值对应同一个名称。如 {foo:["bar1", "bar2"]} 转换为 '&foo=bar1&foo=bar2'。
     * @param type (默认: "GET") 请求方式 ("POST" 或 "GET")， 默认为 "GET"。注意：其它 HTTP 请求方法，如 PUT 和 DELETE 也可以使用，但仅部分浏览器支持。
     * @param async (默认: true) 默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
     * @param cache : (默认: true) jQuery 1.2 新功能，设置为 false 将不会从浏览器缓存中加载请求信息。
     * @param callback aj处理回调：1-beforeSend, 2-success, 3-complete
     */
    hthjs.net.ajax = function (callerId, pUrl, pData, type, async, cache, callback) {
        $.ajax({
            type: type,
            dataType: 'json',
            data: pData,
            async: async,
            url: pUrl,
            cache: cache,
            beforeSend: function (XMLHttpRequest) {
                callback(callerId, hthjs.net.ajaxActionType.beforeSend, XMLHttpRequest);
            },
            success: function (data) {
                callback(callerId, hthjs.net.ajaxActionType.success, data);
            },
            complete: function (XMLHttpRequest, textStatus) {
                callback(callerId, hthjs.net.ajaxActionType.complete, textStatus);
            },
            error: function (XMLHttpRequest) {
                callback(callerId, hthjs.net.ajaxActionType.error, XMLHttpRequest);
            }
        });
    }

    hthjs.common.strToObj = function (str) {
        str = str.replace(/&/g, "','");
        str = str.replace(/=/g, "':'");
        str = "({'" + str + "'})";
        return eval(str);
    }

    hthjs.common.debug = function (obj) {
        if (window.console && window.console.log) {
            window.console.log(obj);
        }
    }

    hthjs.common.isNull = function (obj) {
        return typeof(obj) == 'undefined'
            || (typeof(obj) !== 'number' && obj == null)
            || obj === ''
            || obj.length == 0;
    }

    hthjs.common.buildUrlQry = function (params) {
        var ret = "";
        for (var o in params) {
            if (typeof(params[o]) != 'undefined'
                && params[o] != null
                && params[o] != '') {
                ret += o + "=" + params[o] + "&";
            }
        }
        ret = ret.substring(0, ret.length - 1);
        return ret;
    }

    String.prototype.trim = function () {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }

    String.prototype.trimAll = function () {
        return this.replace(/\s+/g, "");
    }

    String.prototype.lTrim = function () {
        return this.replace(/(^\s*)/g, "");
    }

    String.prototype.rTrim = function () {
        return this.replace(/(\s*$)/g, "");
    }


})(window.hthjs = window.hthjs || {}, window.jQuery); // ||是为了避免在多个地方使用mopjs变量时重复创建对象,
// window.jQuery传入调高查找效率