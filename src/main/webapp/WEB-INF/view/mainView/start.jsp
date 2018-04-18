<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html lang="ch">

    <head>
        <meta charset="utf-8" />
        <title>南岸区配电网运行状态评估与预警方法研究平台</title>
        <meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文" />
        <meta name="description" content="站长素材提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- basic styles -->
        <link href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
        <!--[if IE 7]>
          <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome-ie7.min.css" />
        <![endif]-->
        <!-- page specific plugin styles -->
        <!-- fonts -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
        <!-- ace styles -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />
        <!--[if lte IE 8]>
          <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-ie.min.css" />
        <![endif]-->
        <!-- inline styles related to this page -->
        <!-- ace settings handler -->
        <script src="<%=request.getContextPath()%>/static/assets/js/ace-extra.min.js"></script>
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="<%=request.getContextPath()%>/static/assets/js/html5shiv.js"></script>
        <script src="<%=request.getContextPath()%>/static/assets/js/respond.min.js"></script>
        <![endif]-->
        <style type="text/css">
        #mainframe {
            width: 100%;
            height: 100%;
        }
        </style>
    </head>

    <body>
        <div class="navbar navbar-default" id="navbar">
            <script type="text/javascript">
            try { ace.settings.check('navbar', 'fixed') } catch (e) {}
            </script>
            <div class="navbar-container" id="navbar-container">
                <div class="navbar-header pull-left">
                    <a href="#" class="navbar-brand">
                        <small>
                        <!-- <img class="nav-user-photo" src="../static/assets/avatars/cquniversity.png"> -->
                           <img src="../static/assets/avatars/starf.png" class="img-rounded" alt="Cinque Terre" width="114" height="37">
                            &nbsp;&nbsp;
                        <font  size="4">南岸供电区域运行状态评估与风险预警平台</font>
                        </small>
                    </a>
                    <!-- /.brand -->
                </div>
                <!-- /.navbar-header -->
                <div class="navbar-header pull-right" role="navigation">
                    <ul class="nav ace-nav">
                        <li class="purple">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="icon-bell-alt icon-animated-bell"></i>
                                <span class="badge badge-important">4</span>
                            </a>
                            <ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                                <li class="dropdown-header">
                                    <i class="icon-warning-sign"></i> 4条通知
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-xs no-hover btn-pink icon-comment"></i>
                                                线路风险提示
                                            </span>
                                            <span class="pull-right badge badge-info">+3</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
                                                区域风险提示
                                            </span>
                                            <span class="pull-right badge badge-success">+3</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-xs no-hover btn-info icon-twitter"></i>
                                                运行状态评估提示
                                            </span>
                                            <span class="pull-right badge badge-info">+2</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        查看所有消息
                                        <i class="icon-arrow-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="light-blue">
                            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                <img class="nav-user-photo" src="../static/assets/avatars/user.jpg" alt="Jason's Photo" />
                                <span class="user-info">
                                    <small>欢迎您,</small>
                                    admin
                                </span>

                                <i class="icon-caret-down"></i>
                            </a>
                            <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                <li>
                                    <a href="#">
                                        <i class="icon-cog"></i>
                                        设置
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-user"></i>
                                        个人资料
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <i class="icon-off"></i>
                                        退出
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <!-- /.ace-nav -->
                </div>
                <!-- /.navbar-header -->
            </div>
            <!-- /.container -->
        </div>
        <div class="main-container" id="main-container">
            <script type="text/javascript">
            try { ace.settings.check('main-container', 'fixed') } catch (e) {}
            </script>
            <div class="main-container-inner">
                <a class="menu-toggler" id="menu-toggler" href="#">
                    <span class="menu-text"></span>
                </a>
                <div class="sidebar" id="sidebar">
                    <script type="text/javascript">
                    try { ace.settings.check('sidebar', 'fixed') } catch (e) {}
                    </script>
                    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                            <button class="btn btn-success">
                                <i class="icon-desktop"></i>
                            </button>
                            <button class="btn btn-info">
                                <i class="icon-dashboard"></i>
                            </button>
                            <button class="btn btn-warning">
                                <i class="icon-warning-sign"></i>
                            </button>
                            <button class="btn btn-danger">
                                <i class="icon-cogs"></i>
                            </button>
                        </div>
                        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                            <span class="btn btn-success"></span>
                            <span class="btn btn-info"></span>
                            <span class="btn btn-warning"></span>
                            <span class="btn btn-danger"></span>
                        </div>
                    </div>
                    <!-- #sidebar-shortcuts -->
                    <ul class="nav nav-list">
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-desktop"></i>
                                <span class="menu-text"> 配电网现状分析</span>

                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu">
                                <li>
                                    <a href="gongdianquyu" target="mainframe">
                                        <i class="icon-double-angle-right"></i>
                                        供电区域简介
                                    </a>
                                </li>
                                <li>
                                    <a href="dianwanggaikuang" target="mainframe">
                                        <i class="icon-double-angle-right"></i>
                                        供电区域概况
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="dropdown-toggle">
                                        <i class="icon-double-angle-right"></i>
                                        <span class="menu-text"> 中压网架情况分析 </span>
                                        <b class="arrow icon-angle-down"></b>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="wangjialianluo" target="mainframe">
                                        <i class="icon-double-angle-right"></i>
                                        联络情况分析
                                    </a>
                                        </li>
                                        <li>
                                            <a href="wangjiafenduan" target="mainframe">
                                        <i class="icon-double-angle-right"></i>
                                        分段情况分析
                                    </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="dropdown-toggle">
                                        <i class="icon-double-angle-right"></i>
                                        <span class="menu-text"> 中压运行情况分析 </span>
                                        <b class="arrow icon-angle-down"></b>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a href="xianlufuzai" target="mainframe">
                                        <i class="icon-double-angle-right"></i>
                                        中压线路负载率
                                    </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="dropdown-toggle">
                                        <i class="icon-double-angle-right"></i>
                                        <span class="menu-text">中压设备情况分析</span>
                                        <b class="arrow icon-angle-down"></b>
                                    </a>
                                    <ul class="submenu">
                                    </ul>
                                </li>
                                <li>
                                    <a href="zhibiaogaikuang" target="mainframe">
                                        <i class="icon-double-angle-right"></i>
                                        各区域指标概况
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-dashboard"></i>
                                <span class="menu-text">数据综合分析</span>

                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu">
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        运行状态数据统计分析
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        故障数据统计分析
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        低电压数据统计分析
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        三相不平衡数据统计分析
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-dashboard"></i>
                                <span class="menu-text">配电网运行状态评估</span>

                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu">
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        指标体系结构
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        计算公式
                                    </a>
                                </li>
                                <li>
                                    <a href="first" target="mainframe">
                                        <i class="icon-double-angle-right"></i>
                                        专家打分管理
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        运行状态评估
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-warning-sign"></i>
                                <span class="menu-text"> 配电网运行风险预警</span>
                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu">
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        故障数据统计分析
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        配电网典型故障发生概率预测
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-cogs"></i>
                                <span class="menu-text"> 配电网负荷预测</span>
                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu">
                                <li>
                                    <a href="#">
                                        <i class="icon-double-angle-right"></i>
                                        变电站负荷预测
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <!-- /.nav-list -->
                    <div class="sidebar-collapse" id="sidebar-collapse">
                        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
                    </div>
                    <script type="text/javascript">
                    try { ace.settings.check('sidebar', 'collapsed') } catch (e) {}
                    </script>
                </div>
                <div class="main-content">
                    <div class="breadcrumbs" id="breadcrumbs">
                        <script type="text/javascript">
                        try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) {}
                        </script>
                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="input-icon">
                                    <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                    <i class="icon-search nav-search-icon"></i>
                                </span>
                            </form>
                        </div>
                        <!-- #nav-search -->
                    </div>
                    <div class="page-content">
                        <div class="row">
                            <!-- iframe的高度问题需解决 -->
                            <div class="col-xs-12" style="height: 1800px">
                                <iframe id="mainframe" name="mainframe" frameborder="no" border="0" scrolling="no"></iframe>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.page-content -->
                </div>
                <!-- /.main-content -->
                <div class="ace-settings-container" id="ace-settings-container">
                    <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                        <i class="icon-cog bigger-150"></i>
                    </div>
                    <div class="ace-settings-box" id="ace-settings-box">
                        <div>
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="default" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; 选择皮肤</span>
                        </div>
                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                            <label class="lbl" for="ace-settings-navbar"> 固定导航栏</label>
                        </div>
                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                            <label class="lbl" for="ace-settings-sidebar"> 固定侧边栏</label>
                        </div>
                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                            <label class="lbl" for="ace-settings-breadcrumbs"> 全部固定</label>
                        </div>
                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                            <label class="lbl" for="ace-settings-rtl"> 向右翻转</label>
                        </div>
                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                            <label class="lbl" for="ace-settings-add-container">
                                居中显示
                            </label>
                        </div>
                    </div>
                </div>
                <!-- /#ace-settings-container -->
            </div>
            <!-- /.main-container-inner -->
            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="icon-double-angle-up icon-only bigger-110"></i>
            </a>
        </div>
        <!-- /.main-container -->
        <!-- 使iframe自适应的高度的代码，需要放在iframe的下方
      //注意：下面的代码是放在和iframe同一个页面调用,放在iframe下面
     -->
        <script type="text/javascript">
        $("#mainframe").load(function() {
            var mainheight = $(this).contents().find("body").height() + 30;
            $(this).height(mainheight);
        });
        </script>
        <!-- basic scripts -->
        <!--[if !IE]> -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <!-- <![endif]-->
        <!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->
        <!--[if !IE]> -->
        <script type="text/javascript">
        window.jQuery || document.write("<script src='<%=request.getContextPath()%>/static/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
        </script>
        <!-- <![endif]-->
        <!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
        <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='<%=request.getContextPath()%>/static/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script src="<%=request.getContextPath()%>/static/assets/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/static/assets/js/typeahead-bs2.min.js"></script>
        <!-- page specific plugin scripts -->
        <!-- ace scripts -->
        <script src="<%=request.getContextPath()%>/static/assets/js/ace-elements.min.js"></script>
        <script src="<%=request.getContextPath()%>/static/assets/js/ace.min.js"></script>
        <!-- inline scripts related to this page -->
        <div style="display:none">
            <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
        </div>
    </body>

    </html>