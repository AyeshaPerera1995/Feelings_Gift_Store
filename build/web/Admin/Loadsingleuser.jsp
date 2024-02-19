<%-- 
    Document   : Loadsingleuser
    Created on : Oct 28, 2018, 10:46:17 AM
    Author     : Ayesha
--%>

<%@page import="POJOS.UserLogin"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
    User user = (User) hs.load(User.class, id);
    Criteria cr1 = hs.createCriteria(UserLogin.class);
    cr1.add(Restrictions.eq("user", user));
    UserLogin ul = (UserLogin) cr1.uniqueResult();
%>
<div class="row"  >
    <div class="col-md-12">
        <!--<div class="col-md-5"><img class="img img-thumbnail" style="width: 220px; height: 210px;"></div>-->
        <div class="col-md-9">
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Full Name :</b></h5></div>
                <div class="col-md-7"><h5><%=user.getFirstName() + " " + user.getLastName()%></h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Email :</b></h5></div>
                <div class="col-md-7"><h5><%=ul.getEmail()%></h5></div>
            </div>
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Contact Details :</b></h5></div>
                <div class="col-md-7"><h5><%="0"+user.getTele1() + " / 0" + user.getTele2()%></h5></div>
            </div>            
            <div class="row">
                <div style="color:navy;" class="col-md-5"><h5><b>Address :</b></h5></div>
                <div class="col-md-7"><h5><%=user.getAddress().getAddressline1() + ", " + user.getAddress().getCity().getCityname() + ", " + user.getAddress().getDistrict().getDistrictname() + "."%></h5></div>
            </div>

        </div>
    </div>
</div>
