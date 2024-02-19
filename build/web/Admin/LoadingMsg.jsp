<%-- 
    Document   : LoadingMsg
    Created on : Apr 23, 2019, 1:15:44 PM
    Author     : Ayesha
--%>

<%@page import="POJOS.Message"%>
<%@page import="POJOS.UserLogin"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int msgid = Integer.parseInt(request.getParameter("msgid"));
            Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
            Message message =(Message)hs.load(Message.class, msgid);
            User user = (User) hs.load(User.class, message.getUser().getIduser());
            Criteria cr1 = hs.createCriteria(UserLogin.class);
            cr1.add(Restrictions.eq("user", user));
            UserLogin ul = (UserLogin) cr1.uniqueResult();
        %>
        <div class="row">
            <div class="panel panel-body">
                <form method="post" action="../SendMsgUser">
                    <div class="row">
                        <div class="col-sm-10">
                            <input type="hidden" name="msgid" value="<%=msgid%>">
                            <input type="hidden" name="userid" value="<%=user.getIduser()%>">
                            <input type="hidden" name="usermail" value="<%=ul.getEmail()%>">
                            <input disabled="" placeholder="To : <%=ul.getEmail()%>" type="text" class="form-control">
                        </div>                                                    
                    </div><br>
                    <div class="row">
                        <div class="col-sm-10">
                            <input placeholder="Subject" type="text" name="sub" class="form-control">
                        </div>                                                    
                    </div><br>
                    <div class="row">
                        <div class="col-sm-10">
                            <textarea placeholder="Type here..."rows="5" name="description" class="form-control"></textarea>
                        </div>                                                    
                    </div><br>
                    <div class="row">
                        <div class="col-sm-8">

                        </div> 
                        <div class="col-sm-4">
                            <input class="btn btn-block btn-bitbucket" type="submit" value="Send Email">
                        </div> 
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
