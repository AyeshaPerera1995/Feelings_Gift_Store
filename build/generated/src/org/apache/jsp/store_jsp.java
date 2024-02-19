package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import MyClass.SessionCart;
import MyClass.SessionCartItem;
import java.util.ArrayList;
import POJOS.Cart;
import java.util.Set;
import POJOS.User;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import POJOS.Subcategory;
import java.util.List;
import org.hibernate.Criteria;
import POJOS.Category;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import java.util.List;
import POJOS.Product;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;
import POJOS.Adds;
import org.hibernate.Session;
import java.util.Set;
import java.util.List;
import POJOS.Subcategory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;
import POJOS.Category;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import POJOS.Category;
import org.hibernate.criterion.Restrictions;
import java.util.List;
import org.hibernate.Criteria;
import POJOS.Product;
import org.hibernate.Session;

public final class store_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(8);
    _jspx_dependants.add("/Main/Navigation_Bar.jsp");
    _jspx_dependants.add("/Main/Dropdown.jsp");
    _jspx_dependants.add("/Main/Specialitems.jsp");
    _jspx_dependants.add("/Main/Adds.jsp");
    _jspx_dependants.add("/Main/Slider.jsp");
    _jspx_dependants.add("/Main/Category.jsp");
    _jspx_dependants.add("/Main/Product.jsp");
    _jspx_dependants.add("/Main/Mainfooter.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"images/cat/khann.jpg\">\n");
      out.write("        <title>Feelings Gift Store</title>  \n");
      out.write("        <link href=\"styles/bootstrap/dist/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"styles/jquery/jquery.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"styles/bootstrap/dist/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"css/AdminLTE.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/_all-skins.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/mystyle.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <!--<link href=\"css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\"/>-->\n");
      out.write("        <!--<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">-->\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <!--navbar start-->\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<nav class=\"navbar navbar-inverse navbar-fixed-top\" id=\"myNavbar\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"navbar-header\">\n");
      out.write("            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("                <span class=\"icon-bar\"></span>\n");
      out.write("                <span class=\"icon-bar\"></span>                        \n");
      out.write("            </button>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"collapse navbar-collapse\">\n");
      out.write("            ");

                Session se = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                if (request.getSession().getAttribute("user") != null) {

                    User user = (User) request.getSession().getAttribute("user");
                    user = (User) se.load(User.class, user.getIduser());
                    if (user.getUserType().getTypeName().equals("Admin")) {
            
      out.write("    \n");
      out.write("            <ul class=\"nav navbar-nav\">\n");
      out.write("\n");
      out.write("                <p class=\"nav navbar-text\"><b>Hi</b>&nbsp;\n");
      out.write("                    <b style=\"color: white;\">");
      out.print(user.getFirstName());
      out.write("</b>&nbsp;\n");
      out.write("                    | <a class=\"navbar-link \">Feelings Gift Store Admin</a>   \n");
      out.write("                    | <a href=\"Admin/ProductStatusManage.jsp\" class=\"navbar-link \">Admin Panel</a>   \n");
      out.write("\n");
      out.write("                </p>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("            <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">My Gift Store<span class=\"caret\"></span></a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                        <li><a href=\"AccountSetting.jsp\"><span class=\"glyphicon glyphicon-user\"></span>My Profile</a></li>\n");
      out.write("\n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li><a href=\"SignoutSer\"><span class=\"glyphicon glyphicon-log-out\"></span>Sign out </a></li>\n");
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                </li>               \n");
      out.write("               ");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("            ");

            } else if (user.getUserType().getTypeName().equals("Buyer")) {
            
      out.write("\n");
      out.write("            <ul class=\"nav navbar-nav\">\n");
      out.write("\n");
      out.write("                <p class=\"nav navbar-text\"><b>Hi</b>&nbsp;\n");
      out.write("                    <b style=\"color: white;\">");
      out.print(user.getFirstName());
      out.write("</b>&nbsp;\n");
      out.write("                    | <a href=\"advancedSearch.jsp\" class=\"navbar-link \">Search Your Product</a>      \n");
      out.write("\n");
      out.write("                </p>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("            <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">My Gift Store<span class=\"caret\"></span></a>\n");
      out.write("                    <ul class=\"dropdown-menu\" role=\"menu\" aria-labellebdy=\"dropdownMenu\">\n");
      out.write("                        <li><a href=\"AccountSetting.jsp\"><span class=\"glyphicon glyphicon-user\"></span>My Profile</a></li>\n");
      out.write("\n");
      out.write("                        <li class=\"divider\"></li>\n");
      out.write("                        <li><a href=\"SignoutSer\"><span class=\"glyphicon glyphicon-log-out\"></span>Sign out </a></li>\n");
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                </li>               \n");
      out.write("                ");


                    Set<Cart> cset = user.getCarts();
                    if (cset.size() > 0) {
                
      out.write("\n");
      out.write("                <!--<li><a href=\"#\"><img src=\"images/navbar/s.png\"><span class=\"badge\"> 0</span></a></li>-->\n");
      out.write("                <li><a href=\"shoppingCart.jsp\"><span class=\"glyphicon glyphicon-shopping-cart\"></span><span class=\"badge\">");
      out.print(cset.iterator().next().getCartproducts().size());
      out.write("</span></a></li>\n");
      out.write("                            ");

                            } else {
                            
      out.write("\n");
      out.write("                <li><a href=\"shoppingCart.jsp\"><span class=\"glyphicon glyphicon-shopping-cart\"></span><span class=\"badge\"> 0</span></a></li>\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");

                }
            } else {
            
      out.write("\n");
      out.write("\n");
      out.write("            <ul class=\"nav navbar-nav\">\n");
      out.write("\n");
      out.write("                <p class=\"nav navbar-text\"><b>Hi</b>&nbsp;\n");
      out.write("                    <a href=\"LoginRegisterPages/Signin.jsp\" class=\"navbar-link\">Sign in or Register</a>&nbsp;\n");
      out.write("                    | <a href=\"advancedSearch.jsp\" class=\"navbar-link \">Search Your Product</a>   \n");
      out.write("\n");
      out.write("                </p>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("            <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                ");

                    int count = 0;
                    if (request.getSession().getAttribute("cart") != null) {
                        SessionCart cart = (SessionCart) request.getSession().getAttribute("cart");
                        ArrayList<SessionCartItem> ci = cart.getSessinCart();                       
                        for (SessionCartItem cartItem : ci) {
                            count += 1;
                        }
                    }
                   if(count!=0){
                
      out.write("\n");
      out.write("                <li><a href=\"shoppingCart.jsp\"><span class=\"glyphicon glyphicon-shopping-cart\"></span><span class=\"badge\">");
      out.print(count);
      out.write("</span></a></li>\n");

}else{

      out.write("\n");
      out.write("     <li><a href=\"shoppingCart.jsp\"><span class=\"glyphicon glyphicon-shopping-cart\"></span><span class=\"badge\"> 0</span></a></li>\n");
      out.write("           \n");
      out.write("                ");

                }
                
      out.write("\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("            ");
                }
            
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!--navbar end-->       \n");
      out.write("        <!--top button code-->\n");
      out.write("        <button onclick=\"topFunction()\" id=\"myBtn\" title=\"Go to top\">^</button>\n");
      out.write("        <script>\n");
      out.write("            window.onscroll = function () {\n");
      out.write("                scrollFunction()\n");
      out.write("            };\n");
      out.write("\n");
      out.write("            function scrollFunction() {\n");
      out.write("                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {\n");
      out.write("                    document.getElementById(\"myBtn\").style.display = \"block\";\n");
      out.write("                } else {\n");
      out.write("                    document.getElementById(\"myBtn\").style.display = \"none\";\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function topFunction() {\n");
      out.write("                document.body.scrollTop = 0;\n");
      out.write("                document.documentElement.scrollTop = 0;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("        <!--top button code-->\n");
      out.write(" \n");
      out.write(" <br><br><br><br>\n");
      out.write(" <section id=\"content\" class=\"container\">\n");
      out.write("            <div class=\" container row\">\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-xs-12 col-md-12\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-3\">\n");
      out.write("                                <a href=\"#\" class=\"\" >\n");
      out.write("                                    <img src=\"images/logo.png\" style=\"width: 240px; height:130px;\">\n");
      out.write("\n");
      out.write("                                </a>\n");
      out.write("                                <hr>\n");
      out.write("                                <!--dropdowm start-->\n");
      out.write("                                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"box box-solid\">\n");
      out.write("    <div class=\"box-body no-padding\" style=\"display: block;\">\n");
      out.write("        <ul class=\"nav nav-pills nav-stacked\">\n");
      out.write("            ");

            Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
            Criteria cr = hs.createCriteria(Category.class);
            cr.add(Restrictions.eq("status", 1));
            List<Category> list =cr.list();
            for(Category category : list){
            
      out.write("\n");
      out.write("            \n");
      out.write("            <li class=\"\"> <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write('"');
      out.write('>');
      out.print(category.getCatname());
      out.write("<span class=\"glyphicon glyphicon-chevron-right pull-right\" style=\"color:#001f3f\"></span></a> </li>\n");
      out.write(" \n");
      out.write("            ");

            }
            
      out.write("\n");
      out.write("            \n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write("\n");
      out.write("                                <!--dropdowndown end-->\n");
      out.write("\n");
      out.write("                                <!--special item start-->\n");
      out.write("                                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    function AddItemToCart(proid) {\n");
      out.write("//                alert(proid);\n");
      out.write("        var qty = 1;\n");
      out.write("//                alert(qty);\n");
      out.write("        var xhtp = new XMLHttpRequest();\n");
      out.write("        xhtp.onreadystatechange = function () {\n");
      out.write("            if (xhtp.readyState == 4 && xhtp.status == 200) {\n");
      out.write("                var msg = xhtp.responseText;\n");
      out.write("                if (msg == 'qty error!!') {\n");
      out.write("                    alert('qty error!!');\n");
      out.write("                } else {\n");
      out.write("                    alert('Add to Cart!!');\n");
      out.write("\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        xhtp.open(\"GET\", \"addtoCartSer?proid=\" + proid + \"&qty=\" + qty, true);\n");
      out.write("        xhtp.send();\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<div class=\"panel panel-default\">\n");
      out.write("    <div class=\"panel-body \">\n");
      out.write("        Special Items\n");
      out.write("    </div>\n");
      out.write("</div>\n");

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


      out.write("\n");
      out.write("\n");
      out.write("<div class=\"thumbnail\" style=\"position: relative;\">\n");
      out.write("    <img class=\"img-responsive\"  src=\"");
      out.print(product.getImgurl());
      out.write("\" alt=\"\" style=\"width:auto; height: 180px;\">\n");
      out.write("    <img src=\"images/tags/special.png\" alt=\"\" style=\"position: absolute; top: 0px;right: 165px;\">\n");
      out.write("    <div class=\"caption\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("\n");
      out.write("            <div class=\"col-md-12\">\n");
      out.write("                <a href=\"#\"><h5>");
      out.print(product.getProname());
      out.write("</h5></a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-6\">\n");
      out.write("                <h4 style=\"font-size: 16px;\" class=\"text-left\" ng-init=\"\"><del>Rs.");
      out.print(product.getUnitPrice());
      out.write("</del></h4>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-6\">\n");
      out.write("                <h4 style=\"font-size: 16px;\" class=\"text-right text-red\" ng-init=\"\">Rs.");
      out.print(product.getSecondPrice());
      out.write("</h4>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-12\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-1\"></div>\n");
      out.write("                    <div class=\"col-md-5 col-md-pull-1\">\n");
      out.write("                        <button onclick=\"AddItemToCart(");
      out.print(product.getIdproduct());
      out.write(")\" class=\"btn bg-navy btn-flat\">Add to Cart</button>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <form action=\"SingleProduct.jsp?proid=");
      out.print(product.getIdproduct());
      out.write("&subid=");
      out.print(product.getSubcategory().getIdsubcategory());
      out.write("\" method=\"post\">\n");
      out.write("                            <input type=\"hidden\" name=\"pid\" value=\"\" />\n");
      out.write("                            <input type=\"submit\" value=\"Details\" class=\"btn btn-default btn-flat\" />\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                   \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");


    }

      out.write("\n");
      out.write("<center>\n");
      out.write("<!--set the buttons count of pages-->\n");

    for (int i = 0; i < pages_s; i++) {

//                check the fr equls to current run page
        if (xs == i) {

      out.write("\n");
      out.write("<a href=\"store.jsp?frs=");
      out.print(i);
      out.write("\"> \n");
      out.write("    <button class=\"btn btn-primary btn-sm\"> \n");
      out.write("\n");
      out.write("        ");
      out.print(i + 1);
      out.write("\n");
      out.write("    </button>\n");
      out.write("</a>\n");


} else {

      out.write("\n");
      out.write("\n");
      out.write("<a href=\"store.jsp?frs=");
      out.print(i);
      out.write("\"> \n");
      out.write("    <button class=\"btn btn-default btn-sm\"> \n");
      out.write("\n");
      out.write("        ");
      out.print(i + 1);
      out.write("\n");
      out.write("    </button>\n");
      out.write("</a>\n");

        }
    }

      out.write("\n");
      out.write("</center>");
      out.write("\n");
      out.write("                                <!--special item end-->\n");
      out.write("<br>\n");
      out.write("                                <!--adds start-->\n");
      out.write("                                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"row\">\n");
      out.write("    ");

    Session session1 = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
    Criteria criteria =session1.createCriteria(Adds.class);
    criteria.add(Restrictions.eq("status", 1));
    criteria.setMaxResults(1);
    Adds adds = (Adds)criteria.uniqueResult();

    
      out.write("\n");
      out.write("    <div class=\"col-md-8 col-md-offset-2\">\n");
      out.write("        <img class=\"img-responsive\" src=\"");
      out.print(adds.getImgurl());
      out.write("\" style=\"width: 100%;height: 250px;\">\n");
      out.write("        <br>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("                                <br>\n");
      out.write("                                <!--adds end-->\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-md-9\">                            \n");
      out.write("                                <br>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <!--slider start-->\n");
      out.write("                                    ");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"row\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <div class=\"row-fluid\">\n");
      out.write("            <div class=\"span12\">                                \n");
      out.write("                <div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\">\n");
      out.write("                    <!-- Indicators -->\n");
      out.write("                    <ol class=\"carousel-indicators\">\n");
      out.write("                        <li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>\n");
      out.write("                        <li data-target=\"#myCarousel\" data-slide-to=\"1\"></li>\n");
      out.write("                        <li data-target=\"#myCarousel\" data-slide-to=\"2\"></li>\n");
      out.write("                        <li data-target=\"#myCarousel\" data-slide-to=\"3\"></li>\n");
      out.write("                        <li data-target=\"#myCarousel\" data-slide-to=\"4\"></li>\n");
      out.write("                       <li data-target=\"#myCarousel\" data-slide-to=\"5\"></li>\n");
      out.write("                    </ol>\n");
      out.write("\n");
      out.write("                    <!-- Wrapper for slides -->\n");
      out.write("                    <div class=\"carousel-inner\" role=\"listbox\">\n");
      out.write("\n");
      out.write("                        <div class=\"item active\">\n");
      out.write("                            <img src=\"images/slider/slide6.jpg\" alt=\"\" width=\"868\" height=\"360\">       \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"item\">\n");
      out.write("                            <img src=\"images/slider/slide3.jpg\" alt=\"\" width=\"868\" height=\"360\">        \n");
      out.write("                        </div>    \n");
      out.write("                       \n");
      out.write("                        <div class=\"item\">\n");
      out.write("                            <img src=\"images/slider/slide2.jpg\" alt=\"\" width=\"868\" height=\"360\">        \n");
      out.write("                        </div> \n");
      out.write("                        <div class=\"item\">\n");
      out.write("                            <img src=\"images/slider/slide1.jpg\" alt=\"\" width=\"868\" height=\"360\">        \n");
      out.write("                        </div> \n");
      out.write("                        <div class=\"item\">\n");
      out.write("                            <img src=\"images/slider/slide9.jpg\" alt=\"\" width=\"868\" height=\"360\">        \n");
      out.write("                        </div> \n");
      out.write("                        <div class=\"item\">\n");
      out.write("                            <img src=\"images/slider/slide7.jpg\" alt=\"\" width=\"868\" height=\"360\">        \n");
      out.write("                        </div> \n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>");
      out.write("\n");
      out.write("                                    <!--slider end-->\n");
      out.write("                                </div> \n");
      out.write("                                <br>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <!--nav page start-->\n");
      out.write("                                    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    Session hs1 = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
    Criteria cr1 = hs1.createCriteria(Category.class);
    cr1.add(Restrictions.eq("status", 1));
    cr1.setMaxResults(6);
    List<Category> list1 = cr1.list();



      out.write("\n");
      out.write("<div class=\"row\">\n");
      out.write("    <div class=\"col-md-12\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            ");
                  for (Category category : list1) {
            
      out.write("\n");
      out.write("            <div class=\"col-md-4\">\n");
      out.write("                <div class=\"thumbnail\">\n");
      out.write("                    ");

                        if(category.getIdcategory()==1){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/khann.jpg\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==2){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/birthday.webp\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==3){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/anniversary.jpg\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==4){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/unique.jpg\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==5){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/orn.jpg\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==6){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/mugs.jpg\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==7){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/clock.jpg\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==8){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/toy.jpg\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==9){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/birthday.webp\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }else if(category.getIdcategory()==10){
                    
      out.write("\n");
      out.write("                    <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><img class=\"img-responsive img-thumbnail\" src=\"images/cat/christmas.jpg\" alt=\"\" style=\"width: 80%; height: 170px;\"></a>\n");
      out.write("                    ");

                    }
                    
      out.write("\n");
      out.write("                    <div class=\"caption\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-12\">\n");
      out.write("                                <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><h4 class=\"text-center\">");
      out.print(category.getCatname());
      out.write("</h4></a>\n");
      out.write("                            </div> \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-12\">\n");
      out.write("                                <a href=\"productPreview.jsp?catid=");
      out.print(category.getIdcategory());
      out.write("\"><h5 style=\"font-weight: bold; color: red;\"class=\"text-center\">\n");
      out.write("                                  View more...\n");
      out.write("                                    </h5></a>\n");
      out.write("                            </div> \n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            ");

                }
            
      out.write("              \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write(" \n");
      out.write("                                    <!--nav_page end-->\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col-md-12\">\n");
      out.write("                                            <div class=\"thumbnail\">\n");
      out.write("                                                <div class=\"btn-group\">\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon1.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon2.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon3.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon4.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon5.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon6.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon1.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon3.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon7.png\"></a>\n");
      out.write("                                                    <a href=\"#\" class=\"btn btn-link\"><img src=\"images/icons/icon8.png\"></a>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>                                   \n");
      out.write("                                    <!--product start-->\n");
      out.write("                                    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("            function AddItemToCart(proid) {\n");
      out.write("//                alert(proid);\n");
      out.write("                var qty = 1;\n");
      out.write("//                alert(qty);\n");
      out.write("                var xhtp = new XMLHttpRequest();\n");
      out.write("                xhtp.onreadystatechange = function () {\n");
      out.write("                    if (xhtp.readyState == 4 && xhtp.status == 200) {\n");
      out.write("                        var msg = xhtp.responseText;\n");
      out.write("                        if (msg == 'qty error!!') {\n");
      out.write("                            \n");
      out.write("//                            alert('qty error!!');\n");
      out.write("                        } else {\n");
      out.write("//                            alert('Add to Cart!!');\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("                xhtp.open(\"GET\", \"addtoCartSer?proid=\" + proid + \"&qty=\" + qty, true);\n");
      out.write("                xhtp.send();\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("<div class=\"row\">\n");
      out.write("    <div class=\"col-md-12\">\n");
      out.write("        <div class=\"panel panel-default\">\n");
      out.write("            <div class=\"panel-body\">\n");
      out.write("                New Products Item\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <!----------------------------------------------------------------------------------------------------------->\n");
      out.write("    <div class=\"col-md-12\">\n");
      out.write("\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        <div class=\"row\">\n");
      out.write("\n");
      out.write("            ");

                
}
            
      out.write("\n");
      out.write("            <div class=\"col-md-3\">\n");
      out.write("                <div class=\"thumbnail\" style=\"position:relative;\">\n");
      out.write("                    <div class=\"\">\n");
      out.write("                        <div class=\"\">\n");
      out.write("                            <img class=\"img-responsive center-block\"  src=\"");
      out.print(product.getImgurl());
      out.write("\" alt=\"\" style=\"width: 70%; height: 160px;\">\n");
      out.write("                            <img src=\"images/tags/new_corner_lineup.png\" style=\"position: absolute; top: 0px;  right: 110px;\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"caption\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-12\">\n");
      out.write("                                <a href=\"#\"><h5>");
      out.print(product.getProname());
      out.write("</h5></a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-12\">\n");
      out.write("                                <h4 class=\"text-left\" ng-init=\"\">Rs.");
      out.print(product.getUnitPrice());
      out.write("0</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-md-12\">\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"col-md-3\">\n");
      out.write("<!--                                        <form action=\"shoppingCart.jsp?proid=");
      out.print(product.getIdproduct());
      out.write("\" method=\"post\">\n");
      out.write("                                            <input type=\"hidden\" name=\"partid\" value=\"\" />\n");
      out.write("                                            <input type=\"hidden\" name=\"qty\" value=\"\" />\n");
      out.write("                                            <input style=\"font-size:12px;\" type=\"submit\" value=\"Add to Cart\" class=\"btn bg-navy btn-flat\"/>\n");
      out.write("                                        </form>-->\n");
      out.write("                                 <button style=\"font-size:12px;\" onclick=\"AddItemToCart(");
      out.print(product.getIdproduct());
      out.write(")\" class=\"btn bg-navy btn-flat\">Add to Cart</button>\n");
      out.write("                                                          \n");
      out.write("                                        \n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"col-md-2 col-md-offset-3\">\n");
      out.write("                                        <form action=\"SingleProduct.jsp?proid=");
      out.print(product.getIdproduct());
      out.write("&subid=");
      out.print(product.getSubcategory().getIdsubcategory());
      out.write("\" method=\"post\">\n");
      out.write("                                            <input type=\"hidden\" name=\"pid\" value=\"\" />\n");
      out.write("\n");
      out.write("                                            <input style=\"font-size:12px;\" type=\"submit\" value=\"Details\"  class=\"btn btn-default btn-flat\" />\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            ");

                    if (z % 4 == 0) { 
      out.write("\n");
      out.write("        </div>\n");
      out.write("        ");

                        }

                        z++;

//                    }
//                }
//}
            }


        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("        <center>\n");
      out.write("    <!--set the buttons count of pages-->\n");
      out.write("    ");
                    for (int i = 0; i < pages; i++) {
            if (x == i) {
    
      out.write("\n");
      out.write("    <a href=\"store.jsp?fr=");
      out.print(i);
      out.write("\"> \n");
      out.write("        <button class=\"btn btn-primary btn-sm\"> \n");
      out.write("\n");
      out.write("            ");
      out.print(i + 1);
      out.write("\n");
      out.write("        </button></a>\n");
      out.write("        ");

        } else {
        
      out.write("\n");
      out.write("\n");
      out.write("    <a href=\"store.jsp?fr=");
      out.print(i);
      out.write("\"> \n");
      out.write("        <button class=\"btn btn-default btn-sm\"> \n");
      out.write("\n");
      out.write("            ");
      out.print(i + 1);
      out.write("\n");
      out.write("        </button>\n");
      out.write("    </a>\n");
      out.write("    ");


            }
        }
    
      out.write("\n");
      out.write("        </center>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("                                    <!--Product end-->\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>   \n");
      out.write("        <hr> \n");
      out.write("\n");
      out.write("        <section class=\"container\">\n");
      out.write("            <div class=\"container row\">\n");
      out.write("                <!--footer start--> \n");
      out.write("                ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<footer>\n");
      out.write("\n");
      out.write("    <div class=\"col-md-5\">\n");
      out.write("        Download our app<br><br>\n");
      out.write("        <a href=\"#\"><img src=\"images/footer/App Store.png\" alt=\"#\"></a>\n");
      out.write("        <a href=\"#\"><img src=\"images/footer/Play Store.png\" alt=\"#\"></a><br><br>\n");
      out.write("        Contact with us<br>\n");
      out.write("        <a href=\"#\"><img src=\"images/footer/Facebook.png\" alt=\"#\"> Like us on Facebook</a><br>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"col-md-2\">\n");
      out.write("        <span class=\"glyphicon glyphicon-map-marker text-danger text-bold\">&nbsp;Location</span><br>        \n");
      out.write("        <a href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Feelings Gift Store,</a><br>\n");
      out.write("        <a href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Malwatta road,</a><br>\n");
      out.write("        <a href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Asgiriya,</a><br>\n");
      out.write("        <a href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gampaha.</a>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <div class=\"col-md-2\">\n");
      out.write("        <span class=\"glyphicon glyphicon-phone-alt text-danger text-bold\">&nbsp;Contact Us</span><br>\n");
      out.write("        <a href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+94 71 750 4177</a><br>\n");
      out.write("        <a href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+94 77 465 3452</a><br>\n");
      out.write("        <a href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+94 31 687 5615</a>\n");
      out.write("    </div>                 \n");
      out.write("    <div class=\"col-md-2\">\n");
      out.write("        <span class=\"glyphicon glyphicon-envelope text-danger text-bold\">&nbsp;Email</span><br>\n");
      out.write("        <a href=\"#\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Feelingsgiftstore.se@gmail.com</a><br>\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("</footer>");
      out.write(" \n");
      out.write("                <!--footer end--> \n");
      out.write("            </div>\n");
      out.write("            <hr>\n");
      out.write("            <h6>\n");
      out.write("                Copyright © 2019 Feelings Gift Store. Powered by Feelings Inc. All Rights Reserved. \n");
      out.write("            </h6>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
