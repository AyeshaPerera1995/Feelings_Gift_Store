<%-- 
    Document   : Navigation_Bar
    Created on : Aug 28, 2018, 6:46:28 AM
    Author     : Ayesha
--%>


<%@page import="MyClass.SessionCart"%>
<%@page import="MyClass.SessionCartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJOS.Cart"%>
<%@page import="java.util.Set"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.Session"%>

<nav class="navbar navbar-inverse navbar-fixed-top" id="myNavbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
        </div>

        <div class="collapse navbar-collapse">
            <%
                Session se = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                if (request.getSession().getAttribute("user") != null) {

                    User user = (User) request.getSession().getAttribute("user");
                    user = (User) se.load(User.class, user.getIduser());
                    if (user.getUserType().getTypeName().equals("Admin")) {
            %>    
            <ul class="nav navbar-nav">

                <p class="nav navbar-text"><b>Hi</b>&nbsp;
                    <b style="color: white;"><%=user.getFirstName()%></b>&nbsp;
                    | <a class="navbar-link ">Feelings Gift Store Admin</a>   
                    | <a href="Admin/ProductStatusManage.jsp" class="navbar-link ">Admin Panel</a>   

                </p>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Gift Store<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="AccountSetting.jsp"><span class="glyphicon glyphicon-user"></span>My Profile</a></li>

                        <li class="divider"></li>
                        <li><a href="SignoutSer"><span class="glyphicon glyphicon-log-out"></span>Sign out </a></li>

                    </ul>
                </li>               
               <%-- <%
                    Set<Cart> cset = user.getCarts();
                    if (cset.size() > 0) {
                %>
                <!--<li><a href="#"><img src="images/navbar/s.png"><span class="badge"> 0</span></a></li>-->
                <li><a href="shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge"> <%=cset.iterator().next().getCartproducts().size()%></span></a></li>
                            <%
                            } else {
                            %>
                <li><a href="shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge"> 0</span></a></li>
                            <%
                                }
                            %>--%>
            </ul>

            <%
            } else if (user.getUserType().getTypeName().equals("Buyer")) {
            %>
            <ul class="nav navbar-nav">

                <p class="nav navbar-text"><b>Hi</b>&nbsp;
                    <b style="color: white;"><%=user.getFirstName()%></b>&nbsp;
                    | <a href="advancedSearch.jsp" class="navbar-link ">Search Your Product</a>      

                </p>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Gift Store<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu" aria-labellebdy="dropdownMenu">
                        <li><a href="AccountSetting.jsp"><span class="glyphicon glyphicon-user"></span>My Profile</a></li>

                        <li class="divider"></li>
                        <li><a href="SignoutSer"><span class="glyphicon glyphicon-log-out"></span>Sign out </a></li>

                    </ul>
                </li>               
                <%

                    Set<Cart> cset = user.getCarts();
                    if (cset.size() > 0) {
                %>
                <!--<li><a href="#"><img src="images/navbar/s.png"><span class="badge"> 0</span></a></li>-->
                <li><a href="shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge"><%=cset.iterator().next().getCartproducts().size()%></span></a></li>
                            <%
                            } else {
                            %>
                <li><a href="shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge"> 0</span></a></li>
                            <%
                                }
                            %>
            </ul>


            <%
                }
            } else {
            %>

            <ul class="nav navbar-nav">

                <p class="nav navbar-text"><b>Hi</b>&nbsp;
                    <a href="LoginRegisterPages/Signin.jsp" class="navbar-link">Sign in or Register</a>&nbsp;
                    | <a href="advancedSearch.jsp" class="navbar-link ">Search Your Product</a>   

                </p>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <%
                    int count = 0;
                    if (request.getSession().getAttribute("cart") != null) {
                        SessionCart cart = (SessionCart) request.getSession().getAttribute("cart");
                        ArrayList<SessionCartItem> ci = cart.getSessinCart();                       
                        for (SessionCartItem cartItem : ci) {
                            count += 1;
                        }
                    }
                   if(count!=0){
                %>
                <li><a href="shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge"><%=count%></span></a></li>
<%
}else{
%>
     <li><a href="shoppingCart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge"> 0</span></a></li>
           
                <%
                }
                %>
            </ul>

            <%                }
            %>
        </div>
    </div>
</nav>

