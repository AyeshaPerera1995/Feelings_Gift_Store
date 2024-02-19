<%-- 
    Document   : Specialitems
    Created on : Aug 28, 2018, 12:36:17 PM
    Author     : Ayesha
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Product"%>
<%@page import="org.hibernate.Criteria"%>
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
                    alert('qty error!!');
                } else {
                    alert('Add to Cart!!');

                }
            }
        }
        xhtp.open("GET", "addtoCartSer?proid=" + proid + "&qty=" + qty, true);
        xhtp.send();
    }
</script>

<div class="panel panel-default">
    <div class="panel-body ">
        Special Items
    </div>
</div>
<%
    int frs = 0;
    int maxs = 2;
    int xs = 0;
    
    //create the pafgination btns.if we click first btn,x=0..then then fr =0
    //second btn clicked,x=1 and then fr=5

    if (request.getParameter("frs") != null) {
        xs = Integer.parseInt(request.getParameter("frs"));
        frs = xs * maxs;

    }

    Session hs2 = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
    Criteria c = hs2.createCriteria(Product.class);
    c.add(Restrictions.eq("status", 1));
//    0.0 novena tka load kranva ( restrictions.ne  ) eken..........
    c.add(Restrictions.ne("secondPrice", 0.0));
    c.add(Restrictions.ne("qty", 0));
    c.add(Restrictions.eq("catStatus", 1));

    int resultsize_s = c.list().size();
    int pages_s = 0;
    //check the result is even or odd number.odd ekak nam 1 k ekatu krnva.
    if (resultsize_s % maxs == 0) {
        pages_s = resultsize_s / maxs;
    } else {
        pages_s = resultsize_s / maxs + 1;
    }

    //give the starting point of the list
    c.setFirstResult(frs);
    //give maximun legth to list
    c.setMaxResults(2);

    //get the list size.
    List<Product> l = c.list();
    for (Product product : l) {

%>

<div class="thumbnail" style="position: relative;">
    <img class="img-responsive"  src="<%=product.getImgurl()%>" alt="" style="width:auto; height: 180px;">
    <img src="images/tags/special.png" alt="" style="position: absolute; top: 0px;right: 165px;">
    <div class="caption">
        <div class="row">

            <div class="col-md-12">
                <a href="#"><h5><%=product.getProname()%></h5></a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <h4 style="font-size: 16px;" class="text-left" ng-init=""><del>Rs.<%=product.getUnitPrice()%></del></h4>
            </div>
            <div class="col-md-6">
                <h4 style="font-size: 16px;" class="text-right text-red" ng-init="">Rs.<%=product.getSecondPrice()%></h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-5 col-md-pull-1">
                        <button onclick="AddItemToCart(<%=product.getIdproduct()%>)" class="btn bg-navy btn-flat">Add to Cart</button>

                    </div>
                    <div class="col-md-4">
                        <form action="SingleProduct.jsp?proid=<%=product.getIdproduct()%>&subid=<%=product.getSubcategory().getIdsubcategory()%>" method="post">
                            <input type="hidden" name="pid" value="" />
                            <input type="submit" value="Details" class="btn btn-default btn-flat" />
                        </form>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
</div>
<%

    }
%>
<center>
<!--set the buttons count of pages-->
<%
    for (int i = 0; i < pages_s; i++) {

//                check the fr equls to current run page
        if (xs == i) {
%>
<a href="store.jsp?frs=<%=i%>"> 
    <button class="btn btn-primary btn-sm"> 

        <%=i + 1%>
    </button>
</a>
<%

} else {
%>

<a href="store.jsp?frs=<%=i%>"> 
    <button class="btn btn-default btn-sm"> 

        <%=i + 1%>
    </button>
</a>
<%
        }
    }
%>
</center>