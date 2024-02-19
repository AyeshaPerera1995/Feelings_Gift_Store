<%-- 
    Document   : ProductManage
    Created on : Aug 30, 2018, 10:51:36 AM
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
        <title>JSP Page</title>
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
                $(document).on('click', '#viewpro', function () {
// SearchProduct servlet eke tyne, viewpro id eka tyena button eka click kalama me function eka call venva
                    var proId = $(this).data('id');
//                    data-id ekata e button eke dila tyena prodcut id eka allagannva
// e product id eka aran Loadsinglepro.jsp ekata yanava
                    $.ajax({url: "Loadsinglepro.jsp?id=" + proId, success: function (result) {
//                            eken ena result eka model eke body eke id eka, #probody eke penava
                            $('#probody').html(result);
                        }});
                });
            }
            );

            function searchProduct() {
                createXMLHTTp();
                var x = document.getElementById("Titel").value;
//            alert(x);
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        document.getElementById("protable").innerHTML = xhtp.responseText;
                    }
                }
                xhtp.open("GET", "../SearchProduct?id=" + x, true);
                xhtp.send();

            }


        </script>
    </head>
    <body onload="searchProduct()">
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
                    if (p.getInterfaces().getUrl().equals("../Admin/ProductStatusManage.jsp")) {
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
                        <div style="height: 600px; overflow: auto" class="row">
                            <div>
                                <div class="col-md-6">
                                    <h4>Product Management</h4>
                                </div>
                                <div class="">
                                    <div class="col-md-6">
                                        <input type="text" id="Titel" onkeyup="searchProduct()" class="form-control" value="" placeholder="Search Products" name="searchpro">
                                        <!--<button class="btn btn-danger" onclick="searchProduct()"> Search</button>-->
                                    </div>
                                </div>
                            </div>
<!--                             <div style="height: 500px; overflow: auto;">-->
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Product Name</th>
                                        <th>Unit Price</th>
                                        <th>Quantity</th>
                                        <th>Status</th>
                                        <th>View Product</th>
                                        <th>Active or Deactive</th>
                                    </tr>
                                </thead>


                                <tbody id="protable">
                                    <!--                                                                        <tr>
                                                                                                           <td>Data</td> 
                                                                                                           <td>Data</td> 
                                                                                                           <td>Data</td> 
                                                                                                           <td>Data</td> 
                                                                                                           <td>Data</td> 
                                                                                                           <td><button type="button" data-toggle="modal" data-target="#viewinfo" class="btn btn-primary">View Information</button></td>                                    
                                                                                                           <td><form method="post" action="ChangeStatus"><input type="hidden" name="productid" value=""><button type="submit" class="btn btn-success">Activated Product</button></form></td> 
                                                                                                        </tr>-->

                                </tbody>
                            </table>
                             <!--</div>-->
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

                                <h5>1 - Activated Product</h5>
                                <h5>0 - Deactivated Product</h5>

                            </div>
                        </div> 
                    </div>
                </div>
            </section>
        </section>
    </body>
    <!----------------View Info Model------------------->

    <div ng-app="" class="modal fade" id="viewinfo" role="dialag" aria-labelledby="myModal" aria-hidden="true"  ng-app="">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title text-center"><b>- Product Information -</b></h4>
                </div>
                <div class="modal-body" id="probody" ng-app="" ng-controller="">


                </div>
                <div class="modal-footer">
                    <button class="btn btn-flat btn-primary"data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</html>
