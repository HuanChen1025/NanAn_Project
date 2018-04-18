<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html lang="ch">

    <head>
        <title>Bootstrap Example</title>
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
            <h2>2016年南岸各区域中压网架联络情况分析</h2>
            <br>
            <table class="table table-bordered  table-striped">
                <thead>
                    <tr class="info">
                        <th rowspan="2" style='vertical-align: middle;text-align: center;'>供电区域类型</th>
                        <th colspan="4">架空网</th>
                        <th colspan="5">电缆网</th>
                    </tr>
                    <tr class="info">
                        <th>架空线路回数</th>
                        <th>多联络回数</th>
                        <th>单联络回数</th>
                        <th>辐射式回数</th>
                        <th>电缆线路回数</th>
                        <th>单联络回数</th>
                        <th>单环网回数</th>
                        <th>辐射式回数</th>
                        <th>复杂联络回数</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>A+区域</td>
                        <td>16</td>
                        <td>15</td>
                        <td>1</td>
                        <td>0</td>
                        <td>121</td>
                        <td>39</td>
                        <td>74</td>
                        <td>4</td>
                        <td>4</td>
                    </tr>
                    <tr>
                        <td>A区域</td>
                        <td>45</td>
                        <td>31</td>
                        <td>13</td>
                        <td>1</td>
                        <td>213</td>
                        <td>100</td>
                        <td>101</td>
                        <td>5</td>
                        <td>7</td>
                    </tr>
                    <tr>
                        <td>B区域</td>
                        <td>65</td>
                        <td>29</td>
                        <td>30</td>
                        <td>6</td>
                        <td>47</td>
                        <td>3</td>
                        <td>37</td>
                        <td>6</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>D区域</td>
                        <td>36</td>
                        <td>14</td>
                        <td>15</td>
                        <td>7</td>
                        <td>1</td>
                        <td>0</td>
                        <td>1</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>所有区域</td>
                        <td>162</td>
                        <td>89</td>
                        <td>59</td>
                        <td>14</td>
                        <td>382</td>
                        <td>142</td>
                        <td>213</td>
                        <td>15</td>
                        <td>12</td>
                    </tr>
                </tbody>
            </table>
            <div id="chart1" style="height:400px;"></div>
            <div id="chart2" style="height:400px;"></div>
        </div>
        <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('chart1'));
        var myChart2 = echarts.init(document.getElementById('chart2'));
        // 指定图表的配置项和数据
        var option1 = {
            title: {
                text: '2016年南岸各区域中压架空网联络情况'
            },
            tooltip: {
                trigger: 'axis',
                //以行为单位给数据添加单位
                formatter: function(datas) {
                    var res = datas[0].name + '<br/>', //代表的是横坐标的数据
                        val;
                    for (var i = 0, length = datas.length; i < length; i++) { //datas.length影响加入单位的行
                        val = (datas[i].value) + ' 回';
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

                data: ['架空线路回数', '多联络回数', '单联络回数', '辐射式回数']
            },
            yAxis: {},
            series: [{
                    name: 'A+区域',
                    type: 'line',
                    data: [16, 15, 1, 0]
                },
                {
                    name: 'A区域',
                    type: 'line',
                    data: [45, 31, 13, 1]
                },
                {
                    name: 'B区域',
                    type: 'line',
                    data: [65, 29, 30, 6]
                },
                {
                    name: 'D区域',
                    type: 'line',
                    data: [36, 14, 15, 7]
                },
                {
                    name: '所有区域',
                    type: 'line',
                    data: [162, 89, 59, 14]
                }
            ]

        };
        var option2 = {
            title: {
                text: '2016年南岸各区域中压电缆网联络情况'
            },
            tooltip: {
                trigger: 'axis',
                //以行为单位给数据添加单位
                formatter: function(datas) {
                    var res = datas[0].name + '<br/>', //代表的是横坐标的数据
                        val;
                    for (var i = 0, length = datas.length; i < length; i++) { //datas.length影响加入单位的行
                        val = (datas[i].value) + ' 回';
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

                data: ['电缆线路回数', '单联络回数', '单环网回数', '辐射式回数', '复杂联络回数']
            },
            yAxis: {},
            series: [{
                    name: 'A+区域',
                    type: 'line',
                    data: [121, 39, 74, 4, 4]
                },
                {
                    name: 'A区域',
                    type: 'line',
                    data: [213, 100, 101, 5, 7]
                },
                {
                    name: 'B区域',
                    type: 'line',
                    data: [47, 3, 37, 6, 1]
                },
                {
                    name: 'D区域',
                    type: 'line',
                    data: [1, 0, 1, 0, 0]
                },
                {
                    name: '所有区域',
                    type: 'line',
                    data: [382, 142, 213, 15, 12]
                }
            ]

        };
        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);
        myChart2.setOption(option2);
        </script>
    </body>

    </html>