<%-- 
    Document   : Loadmessages
    Created on : Apr 23, 2019, 6:44:37 AM
    Author     : Ayesha
--%>

<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.UserLogin"%>
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
        <title>Load Messages</title>

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
    
    //send reply to user..............
     $(document).ready(function () {
                $(document).on('click', '#viewrply', function () {
                    var Id = $(this).data('id');
                    $.ajax({url: "LoadingMsg.jsp?msgid=" + Id, success: function (result) {
                            $('#rplybody').html(result);
                        }});
                });
            }
            );

            function Loadmsg() {
                createXMLHTTp();
//                alert('ok');
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        document.getElementById("msgtable").innerHTML = xhtp.responseText;
                    }
                }
                xhtp.open("GET", "../LoadMsg", true);
                xhtp.send();

            }



        </script>

    </head>
    <body onload="Loadmsg()">

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
                                    <h4>Load Messages</h4>
                                </div>

                            </div>
                            <table height="100" class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Subject</th>
                                        <th>Description</th>
                                        <th>Sending Date</th>
                                        <th>View Profile</th>
                                        <th>Respond Status</th>
                                        <th> </th>
                                        <th>Delete Messages</th>
                                    </tr>
                                </thead>

                                <tbody id="msgtable">
<!--                                    <tr>
                                        <th>1</th>
                                        <th>About Activation</th>
                                        <th><textarea disabled='' rows='5' cols='25'>My account is deactivated.Please check it and activate it.Thank you.</textarea></th>
                                        <th>ayeshaperera9519@gmail.com</th>
                                        <th>2019-04-22</th>
                                        <th>View Profile</th>
                                        <th>Respond or Not Respond</th>
                                        <th>Delete Message</th>
                                    </tr>-->
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
                                <h5>1 - Respond to message</h5>
                                <h5>2 - Not Respond to message</h5>

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
                    <h4 class="modal-title text-center"><b>- View Profile -</b></h4>
                </div>
                <div class="modal-body" id="userbody" ng-app="" ng-controller="">

                </div>
                <div class="modal-footer">
                    <button class="btn btn-flat btn-primary"data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <!----------------Sed rply to user------------------->
    <div ng-app="" class="modal fade" id="rply" role="dialag" aria-labelledby="myModal" aria-hidden="true"  ng-app="">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title text-center"><b>- Send Reply -</b></h4>
                </div>
                <div class="modal-body" id="rplybody" ng-app="" ng-controller="">

                </div>
                <div class="modal-footer">
                    <button class="btn btn-flat btn-github"data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


</html>
