<%--
  Created by IntelliJ IDEA.
  User: chenhuan
  Date: 2018/4/17
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>专家打分界面</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.bootcss.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/echarts/3.7.0/echarts.js"></script>
    <link href="https://cdn.bootcss.com/select2/4.0.6-rc.1/css/select2.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/select2/4.0.6-rc.1/js/select2.js"></script>
    <script src="<%=request.getContextPath()%>/static/script/createTable.js"></script>

    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?73c27e26f610eb3c9f3feb0c75b03925";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</head>

<!--需要将这个js文件放在CDN文件之后，否则出现无法渲染界面 -->
<script type="text/javascript">

    $(document).ready(function(){
        $("#computeWeightButton").hide();
    });
    $(function() {
        $('#expertsNumber').select2({
            placeholder: "请选择专家人数",
            tags: true,
            createTag: function(decorated, params) {
                return null;
            },
            width: '200px'
        });
        function formatState(state) {
            if (!state.id) { return state.text; }
            var $state = $(
                '<span>' + state.text + '</span>'
            );
            return $state;
        };
        $('#selectName').select2({
            placeholder: "请选择查询准则",
            templateResult: formatState,
            width: '200px'
        });
    });
</script>

<body>
<div class="container-fluid">
<div class="col-sm-offset-1 col-sm-10">
    <div class="panel panel-info" style="width:800px; margin: 20px auto 20px">
        <div class="panel-heading">
            <h3 class="panel-title">查询</h3>
        </div>
        <div class="panel-body">
            <label class="control-label" for="selectName">选择查询准则：</label>
            <select class="combox" id="selectName" name="recommenderId">
                <option value="">请选择...</option>
                <optgroup label="选择目标层">
                    <option value="运行状态">运行状态</option>
                </optgroup>
                <optgroup label="选择准则层">
                    <option value="电网结构">电网结构</option>
                    <option value="装备水平">装备水平</option>
                    <option value="供电能力">供电能力</option>
                    <option value="供电可靠性">供电可靠性</option>
                    <option value="运行故障">运行故障</option>
                    <option value="三相不平衡">三相不平衡</option>
                </optgroup>

            </select>&nbsp;&nbsp;&nbsp;
            <select class="combox" id="expertsNumber" name="recommenderId">
                <option value="">请选择...</option>
                <optgroup label="选择专家人数">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </optgroup>
            </select>
            &nbsp;&nbsp;&nbsp;
            <button id="submit" class="btn btn-primary" type="button" style="width:80px">查询</button>
            <!-- 计算权重的按钮 -->
            &nbsp;&nbsp;&nbsp;
            <button id="computeWeightButton" class="btn btn-primary" data-toggle="modal" data-target="#myModal"  type="button" style="width:100px">计算权重</button>
        </div>
    </div>

    <!--专家打分生成的表格全部都放在这里 -->
<div id="tableContent">

</div>
    <!-- 计算权重的按钮 -->
    <div id="computeButton">
    </div>


    <!-- 模态框（Modal） 弹出层 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <!--弹出层的标题窗口 -->
                    <h4 class="modal-title" id="myModalLabel">

                    </h4>
                </div>
                <div id="modal-body" class="modal-body">
                    <!--在这里添加一些文本,弹出层的内容窗口-->

                </div>
                <div class="modal-footer">
                    <span id="updateInfoCue" class=""></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button id="commitWeightValue" type="button" class="btn btn-primary">
                        提交权重值
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

<script type="text/javascript">
    //获取当前项目的路径
    var urlRootContext = (function() {
        var strPath = window.document.location.pathname;
        var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
        return postPath;
    })();
    //异步加载数据
    var URL1 = urlRootContext + "/selectCriterionName.do"; //请求的网址

    $('#submit').click(function() {
        $("#computeWeightButton").show();
        var datalist = new Array();
        var Name = $("#selectName").val();
        var expertNumber = $("#expertsNumber").val();
        var reqParams = { 'selectName': Name};
        $.ajax({
            type: "POST",
            url: URL1,
            cache: false,
            data: reqParams,
            async: false,
            dataType: "json",
            traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
            success: function(data) {
                if (data.isError == false) {

                        $("#tableContent").empty(); //清空table的内容


                        $.each(data['selectName'], function(index, item) {
                            datalist.push(item.value);
                        })
                    if (datalist.length>0){
                        for (var i=0;i<expertNumber;i++){
                            // 传入参数，生成专家打分输入表格
                            console.log("expertNumber========" + i);
                            console.log("datalist========" + datalist);
                            createTable.detail.init({
                                datalist:datalist,
                                index:i+1
                            })
                        }
                    }
                    else {
                        $("#tableContent").append('<div class="alert alert-danger" align="center">查询无数据！</div>');
                    }
                }
                else {
                    $("#tableContent").append('<div class="alert alert-danger" align="center">数据错误，请输入正确打分！</div>');
                }
            }
        });
    });

</script>

    <!--计算权重值 -->
    <script  type="text/javascript">
            $('#computeWeightButton').click(function(){
               // alert("click1");

                //获取数组的大小

                //根据数组大小构造矩阵，并按照 j>i的顺序将数值写入

                //循环遍历，主要是要修改遍历的头.

                //修改为获取所有的 input 值，传入后端分割为矩阵

                //获取数组的行数
                var len = $("#table1").find("tr").length -1 ;
                //alert(len);

                //获取专家人数，也就是表格的个数
                var expertNumber = $("#expertsNumber").val();
                //alert(expertNumber);

                //获取当前项目的路径
                var urlRootContext = (function() {
                    var strPath = window.document.location.pathname;
                    var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
                    return postPath;
                })();

                var URL2 = urlRootContext + "/computeWeight.do"; //计算新的权重的网址

                var URL4 = urlRootContext +"/selectOldWeight.do";//查询旧的权重值的网址

                var allInputNumber = new Array();

                //将所有的输入值传输到一个数组中,默认值为0，避免发生前端不正常中断
                $('tr td input').each(function() {
                    //alert($(this).val());
                    //判断所传输进来的值是否负荷要求
                    //采用正则表达式匹配用户输入是否为double类型
                    //JavaScript isNaN() 函数
                    //isNaN() 函数可用于判断其参数是否是 NaN，该值表示一个非法的数字（比如被 0 除后得到的结果）。
                    if ($(this).val() != '' ){
                        if(!isNaN($(this).val())){
                            allInputNumber.push($(this).val().trim());
                        }
                        else{
                            allInputNumber.push(0);
                        }
                    }
                    else {
                        allInputNumber.push(0);
                    }
                })
                //每个数组的有效长度（右上角元素个数
               // var validLen = len*(len-1)/2;

                //依次写入到数组中

                // for (var i=0;i<allInputNumber.length;i++){
                //     for (var j=0;j<validLen;j++){
                //     }
                // }

                //Name 为查询的第二层结构
                var criterionName = $("#selectName").val();
                var Params = { 'criterionName': criterionName };

                $("#myModalLabel").empty();     //清空弹出层的标题
                $("#modal-body").empty();   //清空 modal-body 的内容
                $("#oldComputeWeight").empty();   //清空table描述文字的内容
                $("#newComputeWeight").empty();   //清空table描述文字的内容
                $("#myModalLabel").empty(); //清除弹出框

                //当前数据库中存储的已有权重值结果
                $.ajax({
                    type: "POST",
                    url: URL4,
                    cache: false,
                    data: Params,
                    async: false,
                    dataType: "json",
                    traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                    success: function(data) {
                        if (data.isError == false) {
                            var tableHead = new Array();
                            var tableBody = new Array();

                            //遍历返回的查询结果中的数值
                            $.each(data['result'], function(index, item) {
                                tableHead.push(item.name);
                                tableBody.push(item.value)
                               // alert(item.name + item.value);
                            })

                            var oldWeightTable = $("<table id=\"oldWeightTable\" class=\"table table-striped table-bordered\" ></table>");
                             oldWeightTable.append('<caption><label id="oldComputeWeight">'+'数据库已有权重计算结果'+'</label></caption>');
                            oldWeightTable.append('<thead id="oldWeightTableHead">' + '</thead>');
                            oldWeightTable.append('<tbody id="oldWeightTableBody">' + '</tbody>');
                            oldWeightTable.appendTo("#modal-body");
                            var $trTempHead = $("<tr></tr>");
                            $trTempHead.append('<th>'  + '</th>');

                            for (var i=0;i<tableHead.length;i++){
                                $trTempHead.append('<th>' + tableHead[i] + '</th>');
                            }
                            $trTempHead.appendTo("#oldWeightTableHead");

                            var $trTempBody = $("<tr></tr>");
                            $trTempBody.append('<th>' + '旧权重值' + '</th>');
                            for (var i = 0; i < tableBody.length; i++) {
                                $trTempBody.append('<td>' + tableBody[i] + '</td>');
                                //alert(valueList[i]);
                            }
                            $trTempBody.appendTo("#oldWeightTableBody");

                        }
                        else {
                          //  $("#selectName").empty();
                            var Name = $("#selectName").val() + '权重计算结果';
                            //alert(Name);
                            $("#myModalLabel").append(Name);
                            $("#modal-body").append('<div class="alert alert-danger" align="center">数据库错误！</div>');
                        }

                    }
                })

                //将整个数组传递到后端去处理
                var reqParams = { 'allInputNumber': allInputNumber, 'len': len,'expertNumber':expertNumber };
                var valueList = new Array();
               // alert("click2");
                    $.ajax({
                        type: "POST",
                        url: URL2,
                        cache: false,
                        data: reqParams,
                        async: false,
                        dataType: "json",
                        traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                        success: function(data) {
                           valueList = data['data'];

                            $("#updateInfoCue").empty(); //清空更新时的提示信息
                            $("#weightTableBody").empty();  //清空表格内容
                            $("#weightTableHead").empty();  //清空表格内容

                            // var Name = $("#selectName").val() + '权重计算结果';
                            // //alert(Name);
                            // $("#myModalLabel").append(Name);
                            // alert(valueList[0]);
                            // alert(valueList[1]);
                            // alert(valueList[2]);
                            if (data.isError == false) {
                                //弹出层上的标题

                                //做一个弹出层，让用户选择是否将计算出来的数据传输到数据库中
                                //不为空，说明可以，否则在弹出层上显示计算结果为空
                                if (valueList.length > 0 && valueList[0]!=-1) {
                                   // $("#selectName").empty();
                                    var Name = $("#selectName").val() + '权重计算结果';
                                    //alert(Name);
                                    $("#myModalLabel").append(Name);

                                    //  $("#computeWeightResult").empty();

                                    // $("#weightTable").empty();

                                    var tableTemp = $("<table id=\"weightTable\" class=\"table table-striped table-bordered\" ></table>");
                                     tableTemp.append('<caption ><label id="oldComputeWeight">'+'最新权重计算结果'+'</label></caption>');
                                    tableTemp.append('<thead id="weightTableHead">' + '</thead>');
                                    tableTemp.append('<tbody id="weightTableBody">' + '</tbody>');
                                    tableTemp.appendTo("#modal-body");

                                    //此处需要去找表头
                                    var $trTempHead = $("<tr></tr>");
                                    $trTempHead.append('<th>'  + '</th>');

                                    var tableHeadList = new Array();

                                    $('#tableHead1 tr').each(function(i){                   // 遍历 tableHead1 下的 tr
                                        $(this).children('th').each(function(j){  // 遍历 tr 的各个 th
                                            //alert("第"+(i+1)+"行，第"+(j+1)+"个td的值："+$(this).text()+"。");

                                            //此处不是判断为 null,而是判断是否为''
                                            if ($(this).text() != ''){
                                                //alert($(this).text());
                                                tableHeadList.push($(this).text());
                                            }

                                        });
                                    });

                                    //遍历 tableHead1 tr 中的所有 th
                                    // $('#tableHead1 tr th ').each(function() {
                                    //     //alert($(this).val());
                                    //     //判断所传输进来的值是否负荷要求
                                    //     //allInputNumber.push($(this).val());
                                    //     tableHeadList.push($(this).text());
                                    // })


                                    for (var i=0;i<tableHeadList.length;i++){
                                        $trTempHead.append('<th>' + tableHeadList[i] + '</th>');
                                    }

                                    $trTempHead.appendTo("#weightTableHead");

                                    var $trTempBody = $("<tr></tr>");
                                    $trTempBody.append('<th>' + '新权重值' + '</th>');
                                    for (var i = 0; i < valueList.length; i++) {
                                        $trTempBody.append('<td>' + valueList[i] + '</td>');
                                        //alert(valueList[i]);
                                    }
                                    $trTempBody.appendTo("#weightTableBody");
                                }
                                else {
                                    $("#modal-body").append('<div class="alert alert-danger" align="center">计算出错，请重新计算！</div>');
                                }
                            }
                            else {
                                //$("#selectName").empty();
                                var Name = $("#selectName").val() + '权重计算结果';
                                //alert(Name);
                                $("#myModalLabel").append(Name);
                                $("#modal-body").append('<div class="alert alert-danger" align="center">计算出错，请输入正确的打分！</div>');
                            }
                        }
                    });
            });


            /**
             * 用户提交插入权重值的按钮
             */
            $('#commitWeightValue').click(function() {
                //获取当前项目的路径
                var urlRootContext = (function() {
                    var strPath = window.document.location.pathname;
                    var postPath = strPath.substring(0, strPath.substr(1).indexOf('/') + 1);
                    return postPath;
                })();


                var updateName = new Array();
                var updateValue = new Array();

                $('#weightTableHead tr').each(function(i){                   // 遍历 tableHead1 下的 tr
                    $(this).children('th').each(function(j){  // 遍历 tr 的各个 th
                        //alert("第"+(i+1)+"行，第"+(j+1)+"个td的值："+$(this).text()+"。");

                        //此处不是判断为 null,而是判断是否为''
                        if ($(this).text() != ''){
                            //alert($(this).text());
                            updateName.push($(this).text());
                        }
                    });
                });

                $('#weightTableBody tr').each(function(i){                   // 遍历 tableHead1 下的 tr
                    $(this).children('td').each(function(j){  // 遍历 tr 的各个 th
                        //alert("第"+(i+1)+"行，第"+(j+1)+"个td的值："+$(this).text()+"。");

                        //此处不是判断为 null,而是判断是否为''
                        if ($(this).text() != ''){
                          //  alert($(this).text());
                            updateValue.push($(this).text());
                        }
                    });
                });


                //待传递参数
                var reqParams = { 'updateName': updateName, 'updateValue': updateValue };
                //异步加载数据，更新权重值
                var URL3 = urlRootContext + "/updateWeight.do"; //请求的网址
                $.ajax({
                    type: "POST",
                    url: URL3,
                    cache: false,
                    data: reqParams,
                    async: false,
                    dataType: "json",
                    traditional: true, //传递数组时必须使用，很重要,否则后台无法接收到传递的数组
                    success: function(data) {

                        if (data.isError == false) {
                            //表明成功了
                            if(data.result == 1){
                                //alert("success");
                                //updateInfoCue
                                $("#updateInfoCue").addClass("label label-success");
                                $("#updateInfoCue").html("更新成功");
                            }
                            else {
                                //alert("fail");
                                $("#updateInfoCue").addClass("label label-warning");
                                $("#updateInfoCue").html("更新失败");
                            }
                        }
                        else {
                            //alert("参数错误");
                            $("#updateInfoCue").addClass("label label-danger");
                            $("#updateInfoCue").html("参数错误");
                        }
                    }
                });
            });

    </script>
</div>
</div>
</body>
</html>
