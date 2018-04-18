<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html lang="ch">

    <head>
        <title>指标概况</title>
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
            <h2>2016年南岸各区域指标概况</h2>
            <br>
            <table class="table table-bordered  table-striped">
                <thead>
                    <tr class="info">
                        <th rowspan="2" style='vertical-align: middle;text-align: center;' width="10%">供电区域类型</th>
                        <th style='vertical-align: middle;text-align: center;' rowspan="2">满足N-1的线路比例（%）</th>
                        <th style='vertical-align: middle;text-align: center;' rowspan="2">线路最大负载率平均值（%）</th>
                        <th style='vertical-align: middle;text-align: center;' rowspan="2">配变负载率平均值（%）</th>
                        <th style='vertical-align: middle;text-align: center;' colspan="3">供电可靠性</th>
                        <th style='vertical-align: middle;text-align: center;' rowspan="2">综合电压合格率（%）</th>
                        <th style='vertical-align: middle;text-align: center;' rowspan="2">10kV及以下综合线损率（%）</th>
                    </tr>
                    <tr class="info">
                        <th style='vertical-align: middle;text-align: center;'>供电可靠率（RS-3，%）</th>
                        <th style='vertical-align: middle;text-align: center;'>用户年平均故障停电时间（分钟）</th>
                        <th style='vertical-align: middle;text-align: center;'>用户年平均预安排停电时间（分钟）</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>A+区域</td>
                        <td>83.2</td>
                        <td>30.1</td>
                        <td>50.4</td>
                        <td>99.966</td>
                        <td>5</td>
                        <td>45</td>
                        <td>99.99</td>
                        <td>4.61</td>
                    </tr>
                    <tr>
                        <td>A区域</td>
                        <td>77.5</td>
                        <td>31.2</td>
                        <td>48.8</td>
                        <td>99.95</td>
                        <td>7</td>
                        <td>56</td>
                        <td>99.99</td>
                        <td>5.12</td>
                    </tr>
                    <tr>
                        <td>B区域</td>
                        <td>51.8</td>
                        <td>27.6</td>
                        <td>49.3</td>
                        <td>99.9</td>
                        <td>18</td>
                        <td>81</td>
                        <td>99.32</td>
                        <td>6.05</td>
                    </tr>
                    <tr>
                        <td>D区域</td>
                        <td>29.7</td>
                        <td>28.9</td>
                        <td>52.1</td>
                        <td>99.815</td>
                        <td>24</td>
                        <td>135</td>
                        <td>99.29</td>
                        <td>6.92</td>
                    </tr>
                    <tr>
                        <td>所有区域</td>
                        <td>70.4</td>
                        <td>29.8</td>
                        <td>49.5</td>
                        <td>99.9018</td>
                        <td>16.8</td>
                        <td>62</td>
                        <td>99.98</td>
                        <td>4.98</td>
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
                text: '2016年南岸各区域指标概况'
            },
            tooltip: {
                trigger: 'axis',
                //以行为单位给数据添加单位
                formatter: function(datas) {
                    var res = datas[0].name + '<br/>', //代表的是横坐标的数据
                        val;
                    for (var i = 0, length = datas.length; i < length; i++) { //datas.length影响加入单位的行
                        val = (datas[i].value) + ' %';
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

                data: ['满足N-1的线路比例', '线路最大负载率平均值', '配变负载率平均值', '供电可靠率', '综合电压合格率', '10kV及以下综合线损率']
            },
            yAxis: {},
            series: [{
                    name: 'A+区域',
                    type: 'line',
                    data: [83.2, 30.1, 50.4, 99.966, 99.99, 4.61]
                },
                {
                    name: 'A区域',
                    type: 'line',
                    data: [77.5, 31.2, 48.8, 99.95, 99.99, 5.12]
                },
                {
                    name: 'B区域',
                    type: 'line',
                    data: [51.8, 27.6, 49.3, 99.9, 99.32, 6.05]
                },
                {
                    name: 'D区域',
                    type: 'line',
                    data: [29.7, 28.9, 52.1, 99.815, 99.29, 6.92]
                },
                {
                    name: '所有区域',
                    type: 'line',
                    data: [70.4, 29.8, 49.5, 99.9018, 99.98, 4.98]
                }
            ]

        };
        // 使用刚指定的配置项和数据显示图表。
        myChart1.setOption(option1);
        </script>
    </body>

    </html>