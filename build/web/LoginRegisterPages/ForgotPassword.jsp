<%-- 
    Document   : ForgotPassword
    Created on : Aug 29, 2018, 3:31:28 PM
    Author     : Ayesha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body style="background-image: url(../images/back.jpg); background-repeat: no-repeat; background-size: contain; opacity: 0.9; ">

        <div class="row">
            <div class="col-sm-4">

            </div>
            <center>
                <div class="col-sm-4">
                    <br><br><br><br><br><br>
                    <div class="panel panel-primary">

                        <div class="panel panel-title">
                            <center> <h4><b>Reset Password</b></h4></center>
                        </div>               
                        <div class="panel-body">
                            <form action="../ForgetPass" method="POST">                                

                                <div class="form-group">                       
                                    <div class="col-sm-12">
                                        <input required="" type="email" class="form-control" name="email" placeholder="Enter your email">
                                    </div>                           
                                </div>
                                <%                   
                                    if (session.getAttribute("forgotmsg") != null) {
                                        
                                %>
                                <span class="text-red text-bold"><%=session.getAttribute("forgotmsg")%></span>
                                <%
                                    }
                                    session.removeAttribute("forgotmsg");

                                %>

                                <div class="form-group"> 
                                    <div class="col-sm-12">
                                        <br><button type="submit" class="btn btn-github btn-md btn-block">Next</button><br>

                                    </div>
                                </div>


                            </form>

                        </div>

                    </div>

                </div>
            </center>

            <div class="col-sm-4">

            </div>
        </div>
    </body>
</html>
