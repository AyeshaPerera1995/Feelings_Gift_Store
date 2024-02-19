<%-- 
    Document   : A_NavBar
    Created on : Aug 30, 2018, 10:45:01 AM
    Author     : Ayesha
--%>

<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                       
                        <li><a class="nav navbar-brand">Admin Panel</a></li>
                        <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Product Management <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="../Admin/ProductStatusManage.jsp">Product Status Management</a></li>
                                        <li class="divider"></li>                                        
                                        <li><a href="../Admin/AddNewProduct.jsp">Add New Product</a></li>
                                    </ul>
                                </li>
                        <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Category Management <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="../Admin/AddNewCat.jsp">Add New Category</a></li>
                                        <li class="divider"></li>
                                        <li><a href="../Admin/AddNewSubCat.jsp">Add New Sub Category</a></li>
                                        
                                    </ul>
                        </li>
                        <li><a href="../Admin/BuyerManage.jsp" class="navbar-link">User Management</a></li>
                        <li><a href="../Admin/Transaction.jsp" class="navbar-link ">Transaction Details</a></li>
                       
                        <li><a href="../Admin/ManageAdds.jsp" class="navbar-link ">Manage Advertisements</a></li>
                        <li><a href="../Admin/Loadmessages.jsp" class="navbar-link">Load Messages</a></li>
<!--                        <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Reports <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="../Reports/IncomeReport1.jsp">Daily Income</a></li>
                                        <li class="divider"></li>
                                        <li><a href="../Reports/IncomeReport2.jsp">Monthly Income</a></li>
                                        
                                    </ul>
                        </li>-->
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="../store.jsp"> Back to Home</a></li>
                         </ul>
                </div>
            </div>
        </nav>
