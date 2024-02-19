<%-- 
    Document   : Signin
    Created on : Aug 28, 2018, 11:08:47 PM
    Author     : Ayesha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
<link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>        
        <%
            if (session.getAttribute("msg")!=null) {
                if (session.getAttribute("msg").equals("Enter your details correctly!")) {
        %>
        <br>
        <div class="container">
            <div style="background-color: #ce563f;" class="alert fade in">
                <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>LOGIN ERROR!&nbsp;&nbsp;&nbsp;&nbsp;<%=session.getAttribute("msg")%></strong>
            </div>
        </div>
       <%
           }else if(session.getAttribute("msg").equals("Please verify your email account!!")){
%>
<br>
        <div class="container">
            <div style="background-color: #ce563f;" class="alert fade in">
                <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong><%=session.getAttribute("msg")%></strong>
            </div>
        </div>
<%
}
    session.removeAttribute("msg");
            }

            Cookie[] cookies = request.getCookies();
        %>
        <div class="row">

            <div class="col-sm-4">
            </div>
            <center>
                <div class="col-sm-4">
                    <br><br><br><br>
                    <div class="panel panel-default">

                        <div class="panel panel-title">
                            <center> <h4><b>Sign in first...</b><a href="../store.jsp"><span style="float: right; margin-right: 5px;"class="glyphicon glyphicon-home"></span></a></h4></center>
                        </div>               
                        <div class="panel-body">
                            <form action="../LoginSer" method="POST">                                
                                <%
                                    for (Cookie cooky : cookies) {
                                        if (cooky.getName().equals("email")) {
                                %>    
                                <div class="form-group">                       
                                    <div class="col-sm-12">
                                        <input type="email" required="" value="<%=cooky.getValue()%>" class="form-control" name="email" placeholder="Enter Email"><br>
                                    </div>                           
                                </div>
                                <%
                                    }
                                    if (cooky.getName().equals("pass")) {
                                %>
                                <div class="form-group">

                                    <div class="col-sm-12"> 
                                        <input type="password" required="" value="<%=cooky.getValue()%>" class="form-control" name="pwd" placeholder="Enter Password">
                                    </div>
                                </div>  

                                <div class="form-group"> 
                                    <div class="col-sm-12">
                                        <div class="checkbox">
                                            <label><input name="remember" value="true" type="checkbox" checked> Remember me</label>
                                            <button type="submit" class="col-lg-offset-5 btn btn-danger"type="button">Sign in</button>
                                        </div>

                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>

                                <%
                                    if (cookies.length <= 1) {
                                %>
                                <div class="form-group">                       
                                    <div class="col-sm-12">
                                        <input type="email" class="form-control" name="email" placeholder="Enter Email"><br>
                                    </div>                           
                                </div>
                                <div class="form-group">

                                    <div class="col-sm-12"> 
                                        <input type="password" class="form-control" name="pwd" placeholder="Enter Password">
                                    </div>
                                </div>  

                                <div class="form-group"> 
                                    <div class="col-sm-12">
                                        <div class="checkbox">
                                            <label><input value="true" name="remember" type="checkbox"> Remember me</label>
                                            <button type="submit" class="col-lg-offset-5 btn btn-danger"type="button">Sign in</button>
                                        </div>

                                    </div>
                                </div>

                                <%
                                    }
                                %>
                                <div class="form-group"> 
                                    <div class="col-sm-12">

                                        <p><b>-- OR --</b></p>
                                        <a href="#" class="btn btn-primary btn-md btn-flat"></i> Sign in using
                                            Facebook</a>

                                    </div>
                                </div>


                            </form>

                        </div>
                        <div class="panel panel-footer">
                            <a href="../LoginRegisterPages/ForgotPassword.jsp" >I forgot my password</a><br>
                            <a href="../LoginRegisterPages/Register.jsp" >Register as a new Customer</a>
                        </div>
                    </div>

                </div>
            </center>

            <div class="col-sm-4">

            </div>
        </div>
    </body>
</html>
