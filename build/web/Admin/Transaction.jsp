<%-- 
    Document   : Transaction
    Created on : Mar 9, 2019, 4:03:54 PM
    Author     : Ayesha
--%>

<%@page import="POJOS.Privilages"%>
<%@page import="java.util.Set"%>
<%@page import="org.hibernate.Session"%>
<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction</title>
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
                $(document).on('click', '#viewinvo', function () {
// SearchProduct servlet eke tyne, viewpro id eka tyena button eka click kalama me function eka call venva
                    var invoId = $(this).data('id');
//                    data-id ekata e button eke dila tyena prodcut id eka allagannva
// e product id eka aran Loadsinglepro.jsp ekata yanava
                    $.ajax({url: "Loadsingleinvo.jsp?id=" + invoId, success: function (result) {
//                            eken ena result eka model eke body eke id eka, #probody eke penava
                            $('#invobody').html(result);
                        }});
                });
            }
            );
            
            function searchTrans(type) {
                createXMLHTTp();
                
                var x = document.getElementById("date1").value;
                var y = document.getElementById("date2").value;
                
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        document.getElementById("invotable").innerHTML = xhtp.responseText;
                    }
                }
                xhtp.open("GET", "../SearchTransaction?d1=" + x + "&d2=" + y+"&type="+type, true);
                xhtp.send();
            }          
        </script>
    </head>
    <body onload="searchTrans(0)">
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
                    if (p.getInterfaces().getUrl().equals("../Admin/Transaction.jsp")) {
                        b = true;
                        break priloop;
                    }
                }
                if (!b) {
                    response.sendRedirect("../store.jsp");
                }
            }
        %>
        <%@include file="../Admin/A_NavBar.jsp" %>
        <br><br><br><br>
       
        <section class="container">
            <section class="container row">
 
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="row">                            
                                <div class="col-md-6">
                                    <h4>Transaction Details</h4>
                                </div>
                            <div class="col-md-6 form-group text-right">                           
                                    
                                    <input value="0" type="date" id="date1">
                                        <input value="0" type="date" id="date2">
                                        <span>
                                            <input class="btn btn-danger" type="button" name="search" onclick="searchTrans(1)" value="Search"/>
                                        </span>

                                </div>
                             </div><br>
                            
                            <table height="100" class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Invoice ID</th>
                                        <th>Invoice Date</th>
                                        <th>Invoice Time</th>
                                        <th>Delivery Address</th>
                                        <th>Confirmation</th>
                                        <th></th>
                                        <th>View Invoice</th>
                                    </tr>
                                </thead>
                                <tbody id="invotable">
                                
                                </tbody>
                            </table>
                           
                    </div>
                </div>

                <!------------------------------------------------------------------------------------------------->

            </section>
        </section>
        
    </body>
    <!----------------View Info Model------------------->

    <div ng-app="" class="modal fade" id="viewinfo" role="dialag" aria-labelledby="myModal" aria-hidden="true"  ng-app="">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title text-center"><b>- Invoice Details -</b></h4>
                </div>
                <div class="modal-body" id="invobody" ng-app="" ng-controller="">


                </div>
                <div class="modal-footer">
                    <button class="btn btn-flat btn-default"data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</html>
