<%-- 
    Document   : BuyerManage
    Created on : Aug 30, 2018, 4:23:10 PM
    Author     : Ayesha
--%>

<%@page import="POJOS.UserLogin"%>
<%@page import="POJOS.Userstatus"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="POJOS.UserType"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.Privilages"%>
<%@page import="java.util.Set"%>
<%@page import="org.hibernate.Session"%>
<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buyer Manage</title>

        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>

        <script>
            var xhtp;
            function createXMLHTTp() {
                xhtp = new XMLHttpRequest();
            }

            //view information model is open from this..............
            $(document).ready(function () {
                $(document).on('click', '#viewuser', function () {
                    var Id = $(this).data('id');
                    $.ajax({url: "Loadsingleuser.jsp?id=" + Id, success: function (result) {
                            $('#userbody').html(result);
                        }});
                });
            }
            );

            function searchbuyer() {
                createXMLHTTp();
//                alert('ok');
                var x = document.getElementById("Buyer").value;
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        document.getElementById("buyertable").innerHTML = xhtp.responseText;
                    }
                }
                xhtp.open("GET", "../LoadUsers?id=" + x, true);
                xhtp.send();

            }



        </script>

    </head>
    <body onload="searchbuyer()">

        <%@include file="../Admin/A_NavBar.jsp" %>
        <%
            if (request.getSession().getAttribute("user") == null) {
                response.sendRedirect("../store.jsp");
            } else if (request.getSession().getAttribute("user") != null) {
                User user = (User) request.getSession().getAttribute("user");
                Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                user = (User) hs.load(User.class, user.getIduser());
                Set<Privilages> priviSet = user.getUserType().getPrivilageses();
                boolean b = false;
                priloop:
                for (Privilages p : priviSet) {
                    if (p.getInterfaces().getUrl().equals("../Admin/BuyerManage.jsp")) {
                        b = true;
                        break priloop;
                    }
                }
                if (!b) {
                    response.sendRedirect("../store.jsp");
                }
            }
        %>
        <br><br><br><br>
        <section class="container">
            <section class="container row">

                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="row">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Buyer Management</h4>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul class="list-inline pull-right">
                                             <%
                                                Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                                                Criteria cc = hs.createCriteria(UserLogin.class);                                               
                                                cc.add(Restrictions.eq("status", 1));                                           
                                                cc.setProjection(Projections.rowCount());
                                                List ll = cc.list();
                                            %>
                                            <li> <h5>Online Buyers <span class="label label-warning"><%=ll.get(0)%></span></h5></li>
                                           
                                            <%
                                           
                                                Criteria c = hs.createCriteria(User.class);
                                                UserType ut = (UserType) hs.load(UserType.class, 2);
                                                c.add(Restrictions.eq("userType", ut));
                                                c.setProjection(Projections.rowCount());
                                                List l = c.list();
                                            %>
                                            <li> <h5>Registered Buyers <span class="label label-primary"><%=l.get(0)%></span></h5></li>
                                                    <%
                                                        Criteria c1 = hs.createCriteria(User.class);
                                                        Userstatus us = (Userstatus) hs.load(Userstatus.class, 1);
                                                        c1.add(Restrictions.eq("userType", ut));
                                                        c1.add(Restrictions.eq("userstatus", us));
                                                        c1.setProjection(Projections.rowCount());
                                                        List l1 = c1.list();
                                                    %>
                                            <li> <h5>Activated Buyers <span class="label label-success"><%=l1.get(0)%></span></h5></li>
                                                    <%
                                                        Criteria c2 = hs.createCriteria(User.class);
                                                        Userstatus us1 = (Userstatus) hs.load(Userstatus.class, 2);
                                                        c2.add(Restrictions.eq("userType", ut));
                                                        c2.add(Restrictions.eq("userstatus", us1));
                                                        c2.setProjection(Projections.rowCount());
                                                        List l2 = c2.list();
                                                    %>
                                            <li><h5>Deactivated Buyers <span class="label label-danger"><%=l2.get(0)%></span></h5></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6 pull-right">
                                        <input type="text" id="Buyer" onkeyup="searchbuyer()" name="buyer" class="form-control" placeholder="Search Buyer"><br>
                                    </div>
                                </div>
                            </div>
                            <table height="100" class="table table-condensed">
                                <thead
                                    <tr>
                                        <th>ID</th>
                                        <th>Email Address</th>
                                        <th>Full Name</th>
                                        <th>Status</th>
                                        <th>Email Confirmation</th>
                                        <th>View Profile</th>
                                        <th>Active or Deactive</th>
                                    </tr>
                                </thead>

                                <tbody id="buyertable">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!------------------------------------------------------------------------------------------------->
                <div class="row">
                    <div class="col-xs-12 col-md-4 col-md-offset-4">
                        <div class="panel panel-primary">
                            <div class="panel-heading">

                            </div>
                            <div class="panel-body col-sm-offset-3">
                                <h5>1 - Activated Buyer</h5>
                                <h5>2 - Deactivated Buyer</h5>

                            </div>
                        </div> 
                    </div>
                </div>
            </section>
        </section>
    </body>
    <!----------------Profile_Information------------------->
    <div ng-app="" class="modal fade" id="viewprofile" role="dialag" aria-labelledby="myModal" aria-hidden="true"  ng-app="">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title text-center"><b>- Buyer Information -</b></h4>
                </div>
                <div class="modal-body" id="userbody" ng-app="" ng-controller="">

                </div>
                <div class="modal-footer">
                    <button class="btn btn-flat btn-primary"data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</html>
