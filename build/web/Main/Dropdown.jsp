<%-- 
    Document   : Dropdown
    Created on : Aug 28, 2018, 12:33:32 PM
    Author     : Ayesha
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Subcategory"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.Category"%>
<%@page import="org.hibernate.Session"%>
<div class="box box-solid">
    <div class="box-body no-padding" style="display: block;">
        <ul class="nav nav-pills nav-stacked">
            <%
            Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
            Criteria cr = hs.createCriteria(Category.class);
            cr.add(Restrictions.eq("status", 1));
            List<Category> list =cr.list();
            for(Category category : list){
            %>
            
            <li class=""> <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><%=category.getCatname()%><span class="glyphicon glyphicon-chevron-right pull-right" style="color:#001f3f"></span></a> </li>
 
            <%
            }
            %>
            
        </ul>
    </div>
</div>