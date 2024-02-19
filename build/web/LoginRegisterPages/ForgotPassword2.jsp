<%-- 
    Document   : ForgotPassword2
    Created on : Aug 30, 2018, 7:58:27 AM
    Author     : Ayesha
--%>

<%@page import="POJOS.User"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.UserLogin"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>Forgot Password</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body style="background-image: url(../images/back.jpg); background-repeat: no-repeat; background-size: contain; opacity: 0.93; "><br><br><br>
        <%
            Session ses = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                String mail = request.getParameter("email");
                int id = Integer.parseInt(request.getParameter("id"));
                User user= (User)ses.load(User.class, id);
                System.out.println("my mail" + mail);
                System.out.println(user.getSecurityQuestion());
        %>
        <div class="row">
            <div class="col-sm-3"> </div>
            <div class="col-sm-6"> <br><br>
                <div class="panel panel-primary">
                     <div class="panel panel-title">
                            <center> <h4><b>Reset My Password</b></h4></center>
                        </div> 
                    <div class="panel-body">        
                        <!-------------------------email reset password---------------------------------------------->

                            <form action="../ForgetPass2" method="POST">                                
                                <div class="form-group">                       
                                    <div class="col-sm-12">
                                        <label>Security Question :</label>
                                        <input type="hidden" name="user_id" value="<%=user.getIduser()%>">
                                        <input type="hidden" name="email" value="<%=mail%>">
                                        <input type="hidden" name="s_question" value="<%=user.getSecurityQuestion()%>">
                                        <input type="text" disabled="" class="form-control" value="<%=user.getSecurityQuestion()%>"><br>
                                    </div>                           
                                </div>
                                 <div class="form-group">                       
                                    <div class="col-sm-12">
                                        <label>Your Answer :</label>
                                        <input type="text" required="" class="form-control" name="s_answer" placeholder="Enter your answer">
                                    </div>                           
                                </div>
                                <%                   
                                    if (session.getAttribute("answer") != null) {
                                        
                                %>
                                <span class="text-red text-bold"><%=session.getAttribute("answer")%></span>
                                <%
                                    }
                                    session.removeAttribute("answer");

                                %>
                                <div class="form-group"> 
                                    <div class="col-sm-12">
                                       <br> <button type="submit" class="btn btn-github btn-sm btn-block">Next</button><br>

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
