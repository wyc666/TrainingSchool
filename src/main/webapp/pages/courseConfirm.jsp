<%--
  Created by IntelliJ IDEA.
  User: wangjiawei
  Date: 2017/3/14
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="nju.wjw.vo.CourseVO" %>
<%@ page import="java.util.List" %>
<%@ page import="nju.wjw.vo.OrganCourseVO" %><%--
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
    <title>学员选课确认列表</title>
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
<body>

<jsp:include page="header.jsp" />
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>列表</h3>
        <p class="description">
            如下是可由学员选择的课程列表
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="/">主页</a></li>
                <li class="icon6"><a href="/organization/organizationService">机构服务平台</a></li>
                <li class="current-page">课程列表</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->

<% List<OrganCourseVO> courseList = (List<OrganCourseVO>) request.getAttribute("courseList");
    Object update = request.getAttribute("isUpdate");
    boolean isUpdate;
    if(update == null)
        isUpdate = false;
    else
        isUpdate = true;
%>
<div class="courses_box1">
    <div class="container">
        <div class="col-lg-12">
            <div class="course_list">
                <div class="table-header clearfix">
                    <div class="id_col">课程ID</div>
                    <div class="name_col">课程名称</div>
                    <div class="startdate_col" style="width:13%;">开始日期</div>
                    <div class="enddate_col" style="width:13%;">结束日期</div>
                    <div class="price_col">课程审核状态</div>
                    <div class="check_col" style="width:13%;">待审核人数</div>
                    <div class="check_col" style="width:13%;">成绩登记</div>
                </div>
                <ul class="table-list">
                    <%
                        if(courseList != null)
                            for (OrganCourseVO c: courseList) { %>
                    <li class="clearfix">
                        <div class="id_col"><%=c.courseId %></div>

                        <% if (!isUpdate){ %>

                        <div class="name_col"><a href="/organization/courseConfirmDetail?id=<%=c.courseId%>"><%=c.courseName %></a></div>

                        <% }else {%>

                        <div class="name_col"><a style="color:#002a80;" href="/organization/updateCourseApplyDetail?id=<%=c.courseId%>"><%=c.courseName %></a></div>

                        <%}%>

                        <div class="startdate_col" style="width:13%;"><%=c.startTime %></div>

                        <div class="enddate_col" style="width:13%;"><%=c.endTime %></div>

                        <div class="price_col"><%=c.state %></div>

                        <div class="price_col" style="width:13%;"><%=c.waitingNumber %></div>

                        <div class="price_col" style="width:13%;">
                            <a style="color:#d2322d;" href="/organization/scoreCheckIn?id=<%=c.courseId%>">成绩登记</a>
                        </div>
                    </li>
                    <% } %>

                </ul>
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