<%-- 
    Document   : ManageAdds
    Created on : Apr 12, 2019, 9:45:23 PM
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
        <title>Manage Adds</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/myscript.js" type="text/javascript"></script>

        <script>
            var xhtp;
            function createXMLHTTp() {
                xhtp = new XMLHttpRequest();
            }

            function searchAdds() {
                createXMLHTTp();
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
//                        alert(xhtp.responseText);
                        document.getElementById("addtable").innerHTML = xhtp.responseText;
                    }
                }
                xhtp.open("GET", "../SearchAdds", true);
                xhtp.send();
            }
        </script>
    </head>

    <body onload="searchAdds()">
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
                    if (p.getInterfaces().getUrl().equals("../Admin/ManageAdds.jsp")) {
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
        <div class="container">
            <div class="container row">                
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <h4>Manage Advertisements</h4>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="row">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Add New Advertisement</div>
                                        <div class="panel-body">
                                            <div class="">
                                                <div class="box-body">                                               
                                                    <div class="row">
                                                        <form action="../saveAdd" method="post" enctype="multipart/form-data">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group inputs">
                                                                        <input type="text" class="form-control" required="" placeholder="Name" name="name">
                                                                    </div>
                                                                </div>
                                                                <!--                                                                <div class="col-md-6">
                                                                                                                                    Select One :
                                                                                                                                    <div class="checkbox">
                                                                                                                                        <label><input type="checkbox" value="" name="home">Home Page</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                                                                       <label><input type="checkbox" value="" name="home">Product Preview Page</label> 
                                                                                                                                    </div>
                                                                                                                                </div>-->
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group inputs">
                                                                        <input required="" type="file" name="addImage" class="form-control" accept="images/*" onchange="readurl(this, 'productChoosePic4');"/> <br>
                                                                        <img src="" style="width: 140px; height: 140px;" class="img-responsive form-control" alt="Add Image" id="productChoosePic4"/><br>

                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group inputs">
                                                                        <input type="submit" value="Add New Advertisement" class="btn btn-raised btn-primary">    
                                                                    </div>
                                                                </div>
                                                            </div>                                                          
                                                        </form>                                                        
                                                    </div>                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <center>
                                        <div class="row">
                                            <div class="col-md-12">

                                                <table class="table table-condensed" >
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Image</th>
                                                            <th>Status</th>
                                                            
                                                        </tr>
                                                    </thead>
                                                    <tbody id="addtable">
<!--                                                        <tr>
                                                            <td></td>
                                                            <td>Data</td>
                                                            <td>Data</td>
                                                            <td>Data</td>
                                                            <td>Data</td>
                                                            <td>
                                                                <div class='row'><div class='col-sm-6'>
                                                                        <button value="hy" name="" class="btn btn-primary">Click</button> 
                                                                    </div><div class='col-sm-6'>
                                                                      <button class="btn btn-success">Click</button>  
                                                                    </div></div>  
                                                            </td>
                                                        </tr>   -->
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-md-4 col-md-offset-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">

                    </div>
                    <div class="panel-body col-sm-offset-3">
                        <h5>0 - New Advertisement </h5>
                        <h5>1 - View in Home Page </h5>
                        <h5>2 - View in Product Preview Page</h5>

                    </div>
                </div> 
            </div>
        </div>

    </body>
</html>
