<%-- 
    Document   : Adds
    Created on : Aug 28, 2018, 12:38:05 PM
    Author     : Ayesha
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.Adds"%>
<%@page import="org.hibernate.Session"%>
<div class="row">
    <%
    Session session1 = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
    Criteria criteria =session1.createCriteria(Adds.class);
    criteria.add(Restrictions.eq("status", 1));
    criteria.setMaxResults(1);
    Adds adds = (Adds)criteria.uniqueResult();

    %>
    <div class="col-md-8 col-md-offset-2">
        <img class="img-responsive" src="<%=adds.getImgurl()%>" style="width: 100%;height: 250px;">
        <br>
    </div>
</div>
