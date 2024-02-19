<%-- 
    Document   : AddNewProduct
    Created on : Aug 30, 2018, 4:25:31 PM
    Author     : Ayesha
--%>

<%@page import="POJOS.Privilages"%>
<%@page import="java.util.Set"%>
<%@page import="POJOS.User"%>
<%@page import="POJOS.Gendertype"%>
<%@page import="POJOS.Madetype"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Subcategory"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Category"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New product</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/myscript.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>

        <script>

            var xhtp;
            function createXMLHTTp() {
                xhtp = new XMLHttpRequest();
            }

            function searchSubCat() {
                var x = document.getElementById("ctid");
                var ctid = x.options[x.selectedIndex].value;
//            alert(ctid);
                createXMLHTTp();
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        var text = xhtp.responseText;
                        document.getElementById("subcat").innerHTML = text;
                    }
                }
                xhtp.open("GET", "../SearchSubCat?cat=" + ctid, true);
                xhtp.send();

            }

            function SearchPro() {
                createXMLHTTp();
                var x = document.getElementById("id").value;
//                alert(x);
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        document.getElementById("loadpro").innerHTML = xhtp.responseText;
                    }
                }
                xhtp.open("GET", "../Search_updateProduct?id=" + x, true);
                xhtp.send();
            }


        </script>

    </head>
    <body>
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
                    if (p.getInterfaces().getUrl().equals("../Admin/AddNewProduct.jsp")) {
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
                                <h4>Product Management</h4>
                            </div>
                            <div class="col-xs-12 col-md-12">
                                <div class="row">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">Add New Product</div>
                                        <div class="panel-body">
                                            <div class="">
                                                <!--start box body-->
                                                <div class="box-body">


                                                    <!--save pro-->

                                                    <div id="loadpro" class="row">
                                                        <form action="../SaveProductSer" method="post" enctype="multipart/form-data">
                                                            <div class="col-sm-6">
                                                                <div class="form-group inputs">
                                                                    <input type="text" class="form-control" required="" placeholder="Product Name" name="proname">
                                                                </div>   

                                                                <div class="form-group inputs">
                                                                    <textarea  id="prodesc" name="prodesc" required=""placeholder="Product Desc" class="form-control" rows="5" cols="10"></textarea>
                                                                </div>


                                                                <div class="form-group inputs">
                                                                    <select required=""onmouseout="searchSubCat()" id="ctid" name="procat" class="form-control">
                                                                        <option value="0">Select Category</option>  
                                                                        <%                                                                            Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                                                                            Criteria cr = hs.createCriteria(Category.class);
                                                                            List<Category> list = cr.list();
                                                                            for (Category category : list) {
                                                                        %>
                                                                        <option id="cat_id" value="<%=category.getIdcategory()%>"> <%=category.getCatname()%></option>  
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>                                                                                                                                      

                                                                <div class="form-group inputs">
                                                                    <select required=""id="subcat" name="prosubcat" class="form-control">
                                                                        <option value="0">Select Sub Category</option>  
                                                                        <%--<%
                                                                            Criteria cr1 = hs.createCriteria(Subcategory.class);
                                                                            List<Subcategory> list1 = cr1.list();
                                                                            for (Subcategory subcategory : list1) {
                                                                        %>
                                                                        <option  value = "<%=subcategory.getIdsubcategory()%>" > <%=subcategory.getSubcatname()%> </option>  
                                                                        <%
                                                                            }
                                                                        %>--%>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group inputs">
                                                                    <select required=""name="promadetype" class="form-control">
                                                                        <option value="0">Select Made Type</option>  
                                                                        <%
                                                                            Criteria cr2 = hs.createCriteria(Madetype.class);
                                                                            List<Madetype> list2 = cr2.list();
                                                                            for (Madetype madetype : list2) {
                                                                        %>
                                                                        <option  value = "<%=madetype.getIdmadeType()%>" > <%=madetype.getMadetypename()%> </option>  
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group inputs">
                                                                    <select required=""name="progendertype" class="form-control">
                                                                        <option value="0">Select Gender Type</option>  
                                                                        <%
                                                                            Criteria cr3 = hs.createCriteria(Gendertype.class);
                                                                            List<Gendertype> list3 = cr3.list();
                                                                            for (Gendertype gendertype : list3) {
                                                                        %>
                                                                        <option  value = "<%=gendertype.getIdgenderType()%>" > <%=gendertype.getGendertypename()%> </option>  
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </select>

                                                                </div>
                                                                <div class="form-group inputs">
                                                                    <input type="number" class="form-control" required=""placeholder="Quantity" name="proqty">
                                                                </div>

                                                                <div class="form-group inputs col-sm-6">
                                                                    <input type="number" class="form-control" required="" placeholder="Unit Price" name="proprice">
                                                                </div>
                                                                <div class="form-group inputs col-sm-6">
                                                                    <input type="number" class="form-control" placeholder="Discount Price(Not Required)" name="prosecondprice">
                                                                </div>

                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="col-sm-12">

                                                                    <input required="" type="file" value="Test" name="proimage1" class="form-control" accept="images/*" onchange="readurl(this, 'productChoosePic1');"/> <br>
                                                                    <img src="" style="width: 200px; height: 150px;" class="img-responsive form-control" alt="Main Product Image " id="productChoosePic1"/><br>

                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <input required="" type="file" name="proimage2" class="form-control" accept="images/*" onchange="readurl(this, 'productChoosePic2');"/> <br>
                                                                    <img src="" style="width: 200px; height: 150px;" class="img-responsive form-control" alt="" id="productChoosePic2"/>

                                                                </div>

                                                                <div class="col-sm-6">

                                                                    <input required="" type="file" name="proimage3" class="form-control" accept="images/*" onchange="readurl(this, 'productChoosePic3');"/> <br>
                                                                    <img src="" style="width: 200px; height: 150px;" class="img-responsive form-control" alt="" id="productChoosePic3"/>

                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <br><input type="submit" value="Add New Product" class="btn btn-raised btn-primary">&nbsp;&nbsp;&nbsp;
                                                                    <input type="submit" value="Update Product" class="btn btn-raised btn-success"> 

                                                                </div>                                                                                                                               
                                                            </div>

                                                        </form>
                                                    </div>
                                                    <!--end save pro-->  

                                                    <!--start update-->
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="col-sm-4">
                                                                <input name="pname" class="form-control" id="id" type="text" placeholder="Search by Name">
                                                            </div>
                                                            <div class="col-sm-2">
                                                                <button onclick="SearchPro()"class="btn btn-danger btn-md">></button>
                                                            </div>  

                                                        </div>

                                                    </div>
                                                    <!--end update-->


                                                </div>
                                                <!--end box body-->
                                            </div>
                                        </div>      
                                        <!--end panel body-->
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
