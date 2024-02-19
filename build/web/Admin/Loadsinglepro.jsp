<%-- 
    Document   : Loadsinglepro
    Created on : Sep 14, 2018, 4:00:36 PM
    Author     : Ayesha
--%>

<%@page import="POJOS.Product"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int proid = Integer.parseInt(request.getParameter("id"));
    Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
    Product product = (Product) hs.load(Product.class, proid);
%>
<div class="row"  >
    <div class="col-md-12">
        <div class="col-md-5"><img class="img img-thumbnail" src="../<%=product.getImgurl()%>" style="width: 220px; height: 210px;"></div>
        <div class="col-md-7">
            <div class="row">
                <div style="color:navy;"class="col-md-5"><h5><b>Product Name :</b></h5></div>
                <div class="col-md-7"><h5><%=product.getProname()%></h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Description :</b></h5></div>
                <div class="col-md-7"><h5><%=product.getProdesc()%></h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Available Qty :</b></h5></div>
                <div class="col-md-7"><h5><%=product.getQty()%> items</h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Sold Qty :</b></h5></div>
                <div class="col-md-7"><h5><%=product.getSoldQty()%> items</h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Category :</b></h5></div>
                <div class="col-md-7"><h5><%=product.getCategory().getCatname()%></h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Sub Category :</b></h5></div>
                <div class="col-md-7"><h5 ><%=product.getSubcategory().getSubcatname()%></h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Made Type :</b></h5></div>
                <div class="col-md-7"><h5><%=product.getMadetype().getMadetypename()%></h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Gender Type :</b></h5></div>
                <div class="col-md-7"><h5><%=product.getGendertype().getGendertypename()%></h5></div>
            </div>
        </div>
    </div>
</div>

