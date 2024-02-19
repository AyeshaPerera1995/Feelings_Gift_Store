<%-- 
    Document   : AddNewCat
    Created on : Aug 30, 2018, 4:22:34 PM
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

            function SearchCat() {
                createXMLHTTp();
                var x = document.getElementById("catid").value;
//            alert(x);
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        document.getElementById("cattable").innerHTML = xhtp.responseText;
                    }
                }
                xhtp.open("GET", "../SearchCat?id=" + x, true);
                xhtp.send();
            }

            function loadCatName(x) {
                createXMLHTTp();
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        document.getElementById("updatecat").innerHTML = xhtp.responseText;
                    }
                }
                xhtp.open("GET", "../LoadCat?id=" + x, true);
                xhtp.send();
            }

        </script>

    </head>
    <body onload="SearchCat()">
        <%@include file="../Admin/A_NavBar.jsp" %>
         <%
            if (request.getParameter("msg")!=null) {
        %>
        <div class="container">
            <div style="background-color: #ce563f;" class="alert fade in">
                <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>ERROR!&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("msg")%></strong>
            </div>
        </div>
            <%
            } else if(request.getParameter("msg")==null){
            %>
                       
        <%
            }
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
                    if (p.getInterfaces().getUrl().equals("../Admin/AddNewCat.jsp")) {
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
        <div class="container">
            <div class="container row">                
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <h4>Category Management</h4>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="row">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Add New Category</div>
                                        <div class="panel-body">
                                            <div class="">
                                                <div class="box-body">
                                                    <div class="row">

                                                        <div class="col-md-5 pull-right">
                                                            <div>
                                                                <input type="text" id="catid" onkeyup="SearchCat()" class="form-control" placeholder="Search Categories" >

                                                            </div>
                                                        </div>
                                                    </div><br>
                                                    <div class="row">
                                                        <form action="../saveCategorySer" method="post">
                                                            <div class="col-md-6">
                                                                <div class="form-group inputs">
                                                                    <input type="text" class="form-control" required="" placeholder="Add New Categories" name="catname">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-2 inputs">
                                                                <input type="submit" value="Add New" class="btn btn-raised btn-primary">
                                                            </div>
                                                        </form>
                                                        <form action="../updateCategory" method="post">
                                                        <div id="updatecat" class="col-md-2">
                                                            <input type="text" class="form-control" required="" placeholder="Category Name">                                                      
                                                        </div>
                                                        <div class="col-md-2">
                                                            <input type="submit" value="Update" class="btn btn-raised btn-warning">
                                                        </div>
                                                        </form>
                                                    </div>
                                                    
                                                    <div class="row">
                                                        <div style="height: 400px; overflow: auto" class="col-md-12">
                                                            
                                                            <table class="table table-striped" >
                                                                <thead>
                                                                    <tr>
                                                                        <th>Category ID</th>
                                                                        <th>Category Name</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="cattable">

                                                                </tbody>
                                                            </table>
                                                            
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
