<%-- 
    Document   : ChangePassword
    Created on : Apr 19, 2019, 12:43:26 PM
    Author     : Ayesha
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background-image: url(../images/back.jpg); background-repeat: no-repeat; background-size: contain; opacity: 0.9; ">
        <div class="row"><br><br><br>
            <%
                Session ses = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                int id = Integer.parseInt(request.getParameter("id"));
                User user = (User) ses.load(User.class, id);
            %>
            <div class="col-sm-3"> </div>
            <div class="col-sm-6"> <br><br>
                <div class="panel panel-default">
                    <div class="panel panel-title">
                        <center> <h4><b>Change Password</b></h4></center><hr>
                    </div>
                    <div class="panel panel-body">
                        <form action="../ChangePassForgot" method="post">

                            <input type="hidden" name="id" value="<%=user.getIduser()%>">

                            <div class="row">
                                <div class="col-sm-4">
                                    <label><span>New Password :</span></label>                               
                                </div> 
                                <div class="col-sm-5">                                                      
                                    <input required="" type="password" name="npass" class="form-control">
                                </div> 
                            </div><br>
                            <div class="row">
                                <div class="col-sm-4">
                                    <label><span>Retype New Password :</span></label>                               
                                </div> 
                                <div class="col-sm-5">                                                      
                                    <input required="" type="password" name="rnpass" class="form-control">
                                </div> 
                            </div><br>                                                 
                            <div class="row">
                                <div class="col-sm-7">                                                      
                                </div> 
                                <div class="col-sm-5">
                                    <input class="btn btn-block btn-github" type="submit" value="Change Password">
                                </div> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-3"> </div>
        </div>
    </body>
</html>
