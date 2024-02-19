<%-- 
    Document   : Loadsingleinvo
    Created on : Mar 9, 2019, 6:40:52 PM
    Author     : Ayesha
--%>

<%@page import="java.util.Set"%>
<%@page import="POJOS.Invoiceproduct"%>
<%@page import="POJOS.Invoice"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int invoid = Integer.parseInt(request.getParameter("id"));
    Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
    Invoice invoice = (Invoice) hs.load(Invoice.class, invoid);
%>
<div class="row">
    <div class="col-md-12">
        <div style="border-color: black; border-style: solid; border-width:1px;"class="col-md-7">
            <h4 style="font-weight: bold;">Customer Details</h4>
            <div class="row">
                <div class="col-md-5"><h5><b>Full Name :</b></h5></div>
                <div class="col-md-7"><h5><%=invoice.getUser().getFirstName() + " " + invoice.getUser().getLastName()%></h5></div>
            </div>
            <div class="row">
                <div class="col-md-5"><h5><b>Address :</b></h5></div>
                <div class="col-md-7"><h5><%=invoice.getUser().getAddress().getAddressline1() + ", " + invoice.getUser().getAddress().getCity().getCityname() + ", " + invoice.getUser().getAddress().getDistrict().getDistrictname()
                        + "."%></h5></div>
            </div>
            <div class="row">
                <div class="col-md-5"><h5><b>Contact Details :</b></h5></div>
                <div class="col-md-7"><h5><%="0" + invoice.getUser().getTele1() + " / 0" + invoice.getUser().getTele2()%></h5></div>
            </div>            

        </div>
            <div class="col-md-5">
                <span style="float: right; font-size:18px;"class="label label-default">INVOICE ID : <%=invoice.getIdinvoice()%></span>
            </div>
    </div>
</div><br>
<div class="row">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Image</th>
                <th>Product Name</th>
                <th>Order Quantity</th>
                <th>Unit Price</th>
                <th>Sub Total</th>
                <th>Delivary Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                Set<Invoiceproduct> invoiceproduct = invoice.getInvoiceproducts();
                for (Invoiceproduct invopro : invoiceproduct) {                                          
            %>
            <tr>
                <td><%=invopro.getProduct().getIdproduct()%></td>
                <td>
                    <img width="60" height="50" class="img-responsive img-thumbnail" src="../<%=invopro.getProduct().getImgurl()%>">
                </td>
                <td><%=invopro.getProduct().getProname()%></td>
                <td><%=invopro.getQty()%></td>
                <%
                if (invopro.getProduct().getSecondPrice()==null) {
                %>
                <td><%=invopro.getProduct().getUnitPrice()%></td>
                <%
                }else{
                %>
                <td><%=invopro.getProduct().getSecondPrice()%></td>
                <%
                }
                %>
                <td><%=invopro.getTotal()%></td>
                <%
                if (invopro.getStatus()==0) {
                %>
                <td><span class="label label-danger"> Pending...</span></td>
                <%
                } else if(invopro.getStatus()==1) {
                %>
                 <td><span class="label label-success"> Delivery Ok</span></td>
                <%
                }
                %>
            </tr> 
            <%
            }
            %>
            
        </tbody>

    </table>
</div>
