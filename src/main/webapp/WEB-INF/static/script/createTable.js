/**
 * 模块化js
 * 用于生成 table
 * @type {{}}
 */
var createTable = {

    detail:{
        init: function (params) {
            console.log("获取生成的数组");
            var datalist = params['datalist'];
            var index = params['index'];

            var tableTemp = $("<table id=\"table\" class=\"table table-striped table-bordered\" ></table>");
            tableTemp.append('<caption id="expertIndex">'+'专家'+index+'打分情况'+'</caption>');
            tableTemp.append('<thead id="tableHead">'+'</thead>');
            tableTemp.append('<tbody id="tableBody">'+'</tbody>');
            tableTemp.appendTo("#tableContent");
            var $trTempHead = $("<tr></tr>");
            $trTempHead.append('<th>' + '</th>');
            for (var i=0;i<datalist.length;i++)
            {
                $trTempHead.append('<th>'+ datalist[i]+ '</th>');
                //alert(datalist[i]);
            }
            $trTempHead.appendTo("#tableHead");

            //加载tableBody
            for (var i=0;i<datalist.length;i++){
                var $trTempBody = $("<tr></tr>");
                $trTempBody.append('<th>' +datalist[i]+ '</th>');
                for (var j=0;j<datalist.length;j++){
                    if(j>i){
                        $trTempBody.append('<td >' +'<input class="col-sm-6" type="text" placeholder="请输入值">'+ '</td>');
                    }
                    else {
                        $trTempBody.append('<th >' + '</th>');
                    }
                }
                $trTempBody.appendTo("#tableBody");
            }
            //根据index 修改 table 的 id 值

            tableId = 'table'+index;
            tableHeadId = 'tableHead'+index;
            tableBodyId ='tableBody'+index;
            expertIndexId = "expertIndex"+index;
            $('#table').attr('id',tableId);
            $('#tableHead').attr('id',tableHeadId);
            $('#tableBody').attr('id',tableBodyId);
            // $('#expertIndex').attr('id',expertIndexId);
            // $('#expertIndex'+index).text("专家"+index+"打分情况");
        }
    }
}