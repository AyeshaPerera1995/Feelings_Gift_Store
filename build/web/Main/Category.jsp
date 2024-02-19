<%-- 
    Document   : Categorypage
    Created on : Aug 28, 2018, 12:42:44 PM
    Author     : Ayesha
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Subcategory"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.Category"%>
<%@page import="org.hibernate.Session"%>

<%
    Session hs1 = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
    Criteria cr1 = hs1.createCriteria(Category.class);
    cr1.add(Restrictions.eq("status", 1));
    cr1.setMaxResults(6);
    List<Category> list1 = cr1.list();


%>
<div class="row">
    <div class="col-md-12">
        <div class="row">
            <%                  for (Category category : list1) {
            %>
            <div class="col-md-4">
                <div class="thumbnail">
                    <%
                        if(category.getIdcategory()==1){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/khann.jpg" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==2){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/birthday.webp" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==3){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/anniversary.jpg" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==4){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/unique.jpg" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==5){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/orn.jpg" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==6){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/mugs.jpg" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==7){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/clock.jpg" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==8){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/toy.jpg" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==9){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/birthday.webp" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }else if(category.getIdcategory()==10){
                    %>
                    <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><img class="img-responsive img-thumbnail" src="images/cat/christmas.jpg" alt="" style="width: 80%; height: 170px;"></a>
                    <%
                    }
                    %>
                    <div class="caption">
                        <div class="row">
                            <div class="col-md-12">
                                <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><h4 class="text-center"><%=category.getCatname()%></h4></a>
                            </div> 
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <a href="productPreview.jsp?catid=<%=category.getIdcategory()%>"><h5 style="font-weight: bold; color: red;"class="text-center">
                                  View more...
                                    </h5></a>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>              
        </div>
        
    </div>
</div>
