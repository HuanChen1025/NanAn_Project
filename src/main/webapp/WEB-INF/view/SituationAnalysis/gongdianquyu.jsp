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

    <body>
        <div class="container" style="height: 1200px;">
            <h2>南岸区供电区域总体概况</h2>
            <p>南岸供电公司供电区域为南岸区、巴南区全区，供区总行政面积2090平方千米，下辖21个镇、15个街道，2015年末两区总常住人口185.75万。供区西部、北部被长江环绕，与大渡口区、九龙坡区、渝中区、江北区、渝北区隔江相望，东部与南川区、涪陵区、南岸区接壤，南与江津区、綦江区兹邻。南岸区、巴南区气候温和，属亚热带季风性湿润气候，是宜居城市，年平均气候在18℃左右，冬季最低气温平均在6-8℃，夏季较热，七、八月日最高气温均在35度以上。</p>
            <br>
            <div class="row">
                <div class="col-md-6">
                    <img src="../static/images/map.png" alt="南岸供电区域地图" style="width:550px;height:684px">
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-1" style="width:20px;height:20px; border:1px solid red;background-color: red"></div>
                        <div class="col-sm-2">A+区域</div>
                        <div class="col-sm-1" style="width:20px;height:20px; border:1px solid #FD00FD;background-color: #FD00FD"></div>
                        <div class="col-sm-2">A区域</div>
                        <div class="col-sm-1" style="width:20px;height:20px; border:1px solid yellow;background-color: yellow"></div>
                        <div class="col-sm-2">B区域</div>
                        <div class="col-sm-1" style="width:20px;height:20px; border:1px solid blue;background-color: blue"></div>
                        <div class="col-sm-2">D区域</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary" style="width:550px;height:684px">
                        <div class="panel-heading">
                            <h3 class="panel-title">南岸各类供电区情况</h3>
                        </div>
                        <h4>A+供电区域情况</h4>
                        <p>A＋类区域主城区主要是指重庆市主城九区内人口密集地区核心区域，结合负荷密度校验.主要对南坪街道、铜元局街道、花园路街道、海棠溪街道、龙门浩街道、弹子石街道等地区供电.行政面积18平方公里，供电面积10.5平方公里</p>
                        <br>
                        <h4>A供电区域情况</h4>
                        <p>A类区域主要对南坪镇、茶园、经开区、李家沱、渔洞等地区供电。行政面积115平方公里，供电面积58.4平方公里</p>
                        <br>
                        <h4>B供电区域情况</h4>
                        <p>B类区域对南岸区城镇、巴南区城镇供电，主要区域为鸡冠石镇、峡口镇、迎龙镇、铜元局街道、花园路街道、海棠溪街道、龙门浩街道、弹子石街道等地区供电。行政面积357平方公里，供电面积128.1平方公里</p>
                        <br>
                        <h4>D供电区域情况</h4>
                        <p>D类区域对巴南区农村地区供电，主要区域为巴南区木洞、南彭、惠民、二圣、东泉、一品、跳石等巴南农村地区供电。行政面积1600平方公里，供电面积363.42平方公里</p>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>