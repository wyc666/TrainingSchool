<%@ page import="nju.wjw.vo.*" %>
<%@ page import="java.util.List" %>
<%@ page import="nju.wjw.util.CourseStudentState" %>
<%--
  Created by IntelliJ IDEA.
  User: wangjiawei
  Date: 2017/3/12
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>学员选课信息确认</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Learn Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="/css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <!-- Custom Theme files -->
    <link href="/css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="/css/jquery.countdown.css" />
    <!----font-Awesome----->
    <link href="/css/font-awesome.css" rel="stylesheet">
    <!----font-Awesome----->
    <script>
        $(document).ready(function(){
            $(".dropdown").hover(
                    function() {
                        $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
                        $(this).toggleClass('open');
                    },
                    function() {
                        $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
                        $(this).toggleClass('open');
                    }
            );
        });
    </script>
</head>
<style>
    form.login {
        text-align: center;
        width: 100%;
        margin: 0 auto;
    }
</style>
<body>

<jsp:include page="header.jsp" />
<!-- banner -->
<%
  CourseConfirmDetailViewVO courseConfirmDetailViewVO = (CourseConfirmDetailViewVO)request.getAttribute("courseConfirmDetailViewVO");
    CourseVO course = courseConfirmDetailViewVO.courseVO;
    OrganizationVO organizationVO = courseConfirmDetailViewVO.organizationVO;
    List<StudentScoreVO> studentScoreVOs = courseConfirmDetailViewVO.studentScoreVOs;
    String managerAsk = (String)request.getAttribute("managerAsk");
    if(managerAsk==null){
%>
<div class="courses_banner">
    <div class="container">
        <h3>课程选课信息确认</h3>
        <p class="description">
            如下是该课程的详细信息
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="/">主页</a></li>
                <li class="icon6"><a href="/organization/organizationService">机构服务平台</a></li>
                <li class="icon6"><a href="/organization/courseConfirm">课程信息列表</a></li>
                <li class="current-page">课程选课详细信息</li>
            </ul>
        </div>
    </div>
</div>
<% }else{%>
<div class="courses_banner">
    <div class="container">
        <h3>课程详细信息查看</h3>
        <p class="description">
            如下是该课程的详细信息
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="/">主页</a></li>
                <li class="icon6"><a href="/managerPlatform/managerService">经理服务平台</a></li>
                <li class="icon6"><a href="/managerPlatform/organizationList">机构信息列表</a></li>
                <li class="icon6"><a href="/managerPlatform/organizationDetail?id=<%=organizationVO.id%>>">机构详细信息</a></li>
                <li class="current-page">课程详细信息</li>
            </ul>
        </div>
    </div>
</div>
<%}%>
<!-- //banner -->


<div class="courses_box1">
    <div class="container">
        <div class="col-md-3">
            <div class="courses_box1-left">
                <form>
                    <div class="select-block1">
                        <select>
                            <option value="">语言</option>
                        </select>
                    </div>
                    <!-- select-block -->
                    <div class="select-block1">
                        <select>
                            <option value="">时段</option>
                        </select>
                    </div>
                    <!-- select-block -->
                    <div class="select-block1">
                        <select>
                            <option value="">难度</option>
                        </select>
                    </div>
                    <!-- select-block -->
                    <div class="select-block1">
                        <select>
                            <option value="">地点</option>
                        </select>
                    </div>
                    <!-- select-block -->
                    <input type="submit" value="search" class="course-submit">
                </form>
            </div>

            <div class="social-widget">
                <h2>Connect with us</h2>
                <p><a href="#" class="fa fa-envelope-o"></a>Email: <%=organizationVO.email%></p>
                <br />
                <ul class="courses_social">
                    <li class="facebook-icon">
                        <div>
                            <a href="#" class="fa fa-renren"></a>
                        </div>
                    </li>
                    <li class="twitter-icon">
                        <div>
                            <a href="#" class="fa fa-skype"></a>
                        </div>
                    </li>
                    <li class="gplus-icon">
                        <div>
                            <a href="#" class="fa fa-weibo"></a>
                        </div>
                    </li>
                    <div class="clearfix"> </div>
                </ul>
            </div>
            <form class="login" action="/organization/courseAddStudent" method="post">
                <p class="lead">添加新的学员</p>
                <input type="hidden" value="<%=course.id%>" name="cid">
                <div class="form-group">
                    <input type="text" width="100%" autocomplete="new-password" class="required form-control" placeholder="姓名 *" name="name" value="">
                </div>
                <div class="form-group">
                    <input type="text" width="100%" autocomplete="new-password" class="required form-control" placeholder="年龄 *" name="age" value="">
                </div>
                <div class="form-group">
                    <input type="text" width="100%" autocomplete="new-password" class="required form-control" placeholder="Email *" name="email" value="">
                </div>
                <div class="form-group">
                    <input type="text" width="100%" autocomplete="new-password" class="required form-control" placeholder="学员卡号 *（没有不填）" name="studentCard" value="">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="添加学员">
                </div>

            </form>


        </div>
        <div class="col-md-9 detail">
            <img src="/images/course.jpg" class="img-responsive" alt=""/>
            <h3><%=course.name %></h3>
            <p><%=course.description %></p>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <i class="fa fa-bookmark-o icon_3"></i>课程名师介绍
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" aria-expanded="true">
                        <div class="panel-body">
                            <%=course.teacher%>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <i class="fa fa-clock-o icon_3"></i> 课程上课时间
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
                        <div class="panel-body">
                            起始日: <%=course.startTime%><br />
                            终止日: <%=course.endTime%>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <i class="fa fa-comments-o icon_3"></i> 课程价格
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree" aria-expanded="false" style="height: 0px;">
                        <div class="panel-body">
                            课程价格： <%=course.price %> RMB
                        </div>
                    </div>
                </div>

            </div>
            <div class="author-box">
                <div class="author-box-left"><img src="/images/t13.png" class="img-responsive" alt=""/></div>
                <div class="author-box-right">
                    <h4>该课程由 <a href="#"><%=organizationVO.name%></a> 机构提供</h4>
                    <p><%=organizationVO.description==null?"该机构暂无介绍":organizationVO.description%></p>
                </div>
                <div class="clearfix"> </div>
            </div>

            <div class="courses_box1">
                <div class="container">
                    <div class="col-md-9">
                        <div class="course_list">
                            <div class="table-header clearfix">
                                <div class="name_col">学生姓名</div>
                                <div class="name_col">选课状态</div>
                                <div class="name_col">学生得分</div>
                                <div class="name_col">学员卡持有</div>
                                <div class="name_col">审核状态</div>
                            </div>
                            <ul class="table-list">
                                <%
                                    if(!studentScoreVOs.isEmpty())
                                        for (StudentScoreVO c: studentScoreVOs) { %>
                                <li class="clearfix">
                                    <div class="name_col"><%=c.name %></div>

                                    <div class="name_col"><%=c.state %></div>

                                    <div class="name_col"><%=c.score.equals("null")?"暂未登记":c.score %></div>

                                    <div class="name_col"><%=c.studentCard==null?"该学生没有学生卡":c.studentCard %></div>

                                    <% if(c.state.equals(CourseStudentState.WAITING)){ %>
                                    <div class="name_col">
                                        <form method="post" action="/organization/courseConfirmPost">
                                            <input type="hidden" value="<%=course.id %>" name="cid" />
                                            <input type="hidden" value="<%=c.sid %>" name="sid" />
                                            <input type="hidden" value="1" name="passCode">
                                            <input type="submit" class="shortcode_but small" style="color:#ffffff; background-color:#d6724f; " value="通过"/>
                                        </form>
                                        <form method="post" action="/organization/courseConfirmPost">
                                            <input type="hidden" value="<%=course.id %>" name="cid" />
                                            <input type="hidden" value="<%=c.sid %>" name="sid" />
                                            <input type="hidden" value="0" name="passCode">
                                            <input type="submit" class="shortcode_but small" style="color:#ffffff; background-color:#d6724f; " value="不通过"/>
                                        </form>
                                    </div>
                                    <% }else{ %>
                                        <div class="name_col">已通过审核</div>
                                    <% }%>

                                </li>
                                <% } %>

                            </ul>
                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>



            <div class="clearfix"> </div>
        </div>
    </div>


    <!-- FlexSlider -->
    <link href="/css/flexslider.css" rel='stylesheet' type='text/css' />
    <script defer src="/js/jquery.flexslider.js"></script>
    <script type="text/javascript">
        $(function(){
            SyntaxHighlighter.all();
        });
        $(window).load(function(){
            $('.flexslider').flexslider({
                animation: "slide",
                start: function(slider){
                    $('body').removeClass('loading');
                }
            });
        });


    </script>
    <!-- FlexSlider -->
</body>
</html>