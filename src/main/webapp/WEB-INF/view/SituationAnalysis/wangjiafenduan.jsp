<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html lang="ch">

    <head>
        <title>网架联络</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.bootcss.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://cdn.bootcss.com/echarts/3.7.0/echarts.js"></script>
        <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?73c27e26f610eb3c9f3feb0c75b03925";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
        </script>
        <style type="text/css">
        .table th,
        .table td {
            vertical-align: middle;
            text-align: center;
        }
        </style>
    </head>

    <body>
        <div class="container">
            <h2>2016年南岸各区域中压网架分段情况分析</h2>
            <br>
            <table class="table table-bordered  table-striped">
                <h4 align="center">线路分段分布情况表</h4>
                <thead>
                    <tr class="info">
                        <th width="10%">供电区域类型</th>
                        <th width="15%">线路总数（回）</th>
                        <th width="10%">1段</th>
                        <th width="10%">2段</th>
                        <th width="10%">3段</th>
                        <th width="10%">4段</th>
                        <th width="10%">5段及以上</th>
                        <th width="10%">平均分段数</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>A+区域</td>
                        <td>137</td>
                        <td>0</td>
                        <td>20</td>
                        <td>23</td>
                        <td>48</td>
                        <td>46</td>
                        <td>4.8</td>
                    </tr>
                    <tr>
                        <td>A区域</td>
                        <td>258</td>
                        <td>0</td>
                        <td>27</td>
                        <td>41</td>
                        <td>96</td>
                        <td>94</td>
                        <td>4.4</td>
                    </tr>
                    <tr>
                        <td>B区域</td>
                        <td>112</td>
                        <td>8</td>
                        <td>19</td>
                        <td>25</td>
                        <td>22</td>
                        <td>38</td>
                        <td>4.8</td>
                    </tr>
                    <tr>
                        <td>D区域</td>
                        <td>37</td>
                        <td>3</td>
                        <td>8</td>
                        <td>11</td>
                        <td>5</td>
                        <td>10</td>
                        <td>3.5</td>
                    </tr>
                    <tr>
                        <td>所有区域</td>
                        <td>544</td>
                        <td>11</td>
                        <td>74</td>
                        <td>100</td>
                        <td>171</td>
                        <td>188</td>
                        <td>4.1</td>
                    </tr>
                </tbody>
            </table>
            <br>
            <div id="chart1" style="height:400px;"></div>
        </div>
        <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('chart1'));

        // 指定图表的配置项和数据
        var option1 = {
            title: {
                text: '2016年南岸各区域中压网架分段情况'
            },
            tooltip: {
                trigger: 'axis',
                //以行为单位给数据添加单位
                formatter: function(datas) {
                    var res = datas[0].name + '<br/>', //代表的是横坐标的数据
                        val;
                    for (var i = 0, length = datas.length; i < length; i++) { //datas.length影响加入单位的行
                        val = (datas[i].value) + ' ';
                        res += datas[i].seriesName + '：' + val + '<br/>';
                    }
                    return res;
                },
                axisPointer: {
                    type: 'cross'
                },
                backgroundColor: '#7FFFD4',
                borderWidth: 1,
                borderColor: '#ccc',
                padding: 10,
                textStyle: {
                    color: '#000'
                },
            },

            legend: {
                data: ['A+区域', 'A区域', 'B区域', 'D区域', '所有区域']
            },
            xAxis: {
                axisLabel: {
                    interval: 0,

                },

                data: ['线路总数（回）', '1段', '2段', '3段', '4段', '5段及以上', '平均分段数']
            },
            yAxis: {},
            series: [{
                    name: 'A+区域',
                    type: 'line',
                    data: [137, 0, 20, 23, 48, 46, 4.8]
                },
                {
                    name: 'A区域',
                    type: 'line',
                    data: [258, 0, 27, 41, 96, 94, 4.4]
                },
                {
                    name: 'B区域',
                    type: 'line',
                    data: [112, 8, 19, 25, 22, 38, 4.8]
                },
                {
                    name: 'D区域',
                    type: 'line',
                    data: [37, 3, 8, 11, 5, 10, 3.5]
                },
                {
                    name: '所有区域',
                    type: 'line',
                    data: [544, 11, 74, 100, 171, 188, 4.1]
                }
            ]

        };

        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);
        </script>
    </body>

    </html>