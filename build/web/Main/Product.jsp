<%-- 
    Document   : Product
    Created on : Aug 28, 2018, 12:46:43 PM
    Author     : Ayesha
--%>

<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="POJOS.Category"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.Product"%>
<%@page import="org.hibernate.Session"%>

<script>
            function AddItemToCart(proid) {
//                alert(proid);
                var qty = 1;
//                alert(qty);
                var xhtp = new XMLHttpRequest();
                xhtp.onreadystatechange = function () {
                    if (xhtp.readyState == 4 && xhtp.status == 200) {
                        var msg = xhtp.responseText;
                        if (msg == 'qty error!!') {
                            
//                            alert('qty error!!');
                        } else {
//                            alert('Add to Cart!!');
                        }
                    }
                }
                xhtp.open("GET", "addtoCartSer?proid=" + proid + "&qty=" + qty, true);
                xhtp.send();
            }
        </script>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
                New Products Item
            </div>
        </div>
    </div>
    <!----------------------------------------------------------------------------------------------------------->
    <div class="col-md-12">

        <%
            int fr = 0;
            int max = 4;
            int x = 0;

            //create the pafgination btns.if we click first btn,x=0..then then fr =0
            //second btn clicked,x=1 and then fr=5
            if (request.getParameter("fr") != null) {
                x = Integer.parseInt(request.getParameter("fr"));
                fr = x * max;
            }

            Session hs3 = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
            Criteria cc = hs3.createCriteria(Product.class);
            cc.add(Restrictions.eq("status", 1));          
            cc.add(Restrictions.eq("secondPrice", 0.0));
            cc.add(Restrictions.ne("qty", 0));
            cc.add(Restrictions.eq("catStatus", 1));
            
            int resultsize = cc.list().size();

            int pages = 0;
            //check the result is even or odd number.odd ekak nam 1 k ekatu krnva.
            if (resultsize % max == 0) {
                pages = resultsize / max;
            } else {
                pages = resultsize / max + 1;
            }
           
            //give the starting point of the list
            cc.setFirstResult(fr);
            //give maximun legth to list
            cc.setMaxResults(4);

            List<Product> li = cc.list();
            int z = 1;

            for (Product product : li) {
//                if (product.getQty() != 0) {
                 
//                    if (product.getSecondPrice() == 0) {

                        if (z % 4 == 1) {
//                            if(product.getCategory().getStatus()==1){ }  
        %>
        <div class="row">

            <%
                
}
            %>
            <div class="col-md-3">
                <div class="thumbnail" style="position:relative;">
                    <div class="">
                        <div class="">
                            <img class="img-responsive center-block"  src="<%=product.getImgurl()%>" alt="" style="width: 70%; height: 160px;">
                            <img src="images/tags/new_corner_lineup.png" style="position: absolute; top: 0px;  right: 110px;">
                        </div>
                    </div>
                    <div class="caption">
                        <div class="row">
                            <div class="col-md-12">
                                <a href="#"><h5><%=product.getProname()%></h5></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="text-left" ng-init="">Rs.<%=product.getUnitPrice()%>0</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-3">
<!--                                        <form action="shoppingCart.jsp?proid=<%=product.getIdproduct()%>" method="post">
                                            <input type="hidden" name="partid" value="" />
                                            <input type="hidden" name="qty" value="" />
                                            <input style="font-size:12px;" type="submit" value="Add to Cart" class="btn bg-navy btn-flat"/>
                                        </form>-->
                                 <button style="font-size:12px;" onclick="AddItemToCart(<%=product.getIdproduct()%>)" class="btn bg-navy btn-flat">Add to Cart</button>
                                                          
                                        
                                    </div>

                                    <div class="col-md-2 col-md-offset-3">
                                        <form action="SingleProduct.jsp?proid=<%=product.getIdproduct()%>&subid=<%=product.getSubcategory().getIdsubcategory()%>" method="post">
                                            <input type="hidden" name="pid" value="" />

                                            <input style="font-size:12px;" type="submit" value="Details"  class="btn btn-default btn-flat" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    if (z % 4 == 0) { %>
        </div>
        <%
                        }

                        z++;

//                    }
//                }
//}
            }


        %>



    </div>
        <center>
    <!--set the buttons count of pages-->
    <%                    for (int i = 0; i < pages; i++) {
            if (x == i) {
    %>
    <a href="store.jsp?fr=<%=i%>"> 
        <button class="btn btn-primary btn-sm"> 

            <%=i + 1%>
        </button></a>
        <%
        } else {
        %>

    <a href="store.jsp?fr=<%=i%>"> 
        <button class="btn btn-default btn-sm"> 

            <%=i + 1%>
        </button>
    </a>
    <%

            }
        }
    %>
        </center>

</div>
