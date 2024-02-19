<%-- 
    Document   : AddNewSubCat
    Created on : Aug 30, 2018, 4:22:52 PM
    Author     : Ayesha
--%>

<%@page import="POJOS.Privilages"%>
<%@page import="java.util.Set"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Subcategory"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.Category"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Sub Category</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>

    </head>
    <body onload="SearchSubCat()">
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
                    if (p.getInterfaces().getUrl().equals("../Admin/AddNewSubCat.jsp")) {
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
                                <h4>Sub Category Management</h4>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="row">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Add New Sub Category</div>
                                        <div class="panel-body">
                                            <div class="">
                                                <div class="box-body">

                                                    <div class="row">
                                                        <form action="../saveSubCatSer" method="post">
                                                            <div class="col-sm-5">
                                                                <select  name="catid" class="form-control">
                                                                    <option> Select Category </option>  
                                                                    <%
                                                                        Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                                                                        Criteria cr = hs.createCriteria(Category.class);
                                                                        List<Category> list = cr.list();
                                                                        for (Category category : list) {
                                                                    %>
                                                                    <option value="<%=category.getIdcategory()%>" id="cat_id"> <%=category.getCatname()%></option>  
                                                                    <%
                                                                        }
                                                                    %>
                                                                </select>
                                                            </div>
                                                            <div class="col-sm-5">
                                                                <div class="form-group inputs">
                                                                    <input type="text" class="form-control" required="" placeholder="Add New Sub Categories" name="subcat">
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-2">
                                                                <input type="submit" value="Add New" class="btn btn-raised btn-primary">
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <table  class="table table-condensed" >
                                                                <thead>
                                                                    <tr>
                                                                        <th>ID</th>
                                                                        <th>Category Name</th>
                                                                        <th>Sub Categories</th>
                                                                    </tr>
                                                                </thead>
                                                                <%
                                                                    Criteria c = hs.createCriteria(Category.class);
                                                                    List<Category> l = c.list();

                                                                    for (Category category : l) {
                                                                %>
                                                                <tbody>
                                                                    <tr>
                                                                        <td> <%=category.getIdcategory()%></td>
                                                                        <td> <%=category.getCatname()%></td>

                                                                        <td>
                                                                            <ul>
                                                                                <%
                                                                                    Criteria c1 = hs.createCriteria(Subcategory.class);
                                                                                    Category category1 = (Category) hs.load(Category.class, category.getIdcategory());
                                                                                    c1.add(Restrictions.eq("category", category1));
                                                                                    List<Subcategory> li = c1.list();

                                                                                    for (Subcategory subcategory : li) {
                                                                                %>
                                                                                <li><%=subcategory.getSubcatname()%></li>
                                                                                    <%
                                                                                        }
                                                                                    %>
                                                                            </ul>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                                <%
                                                                    }
                                                                %>
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
