<%-- 
    Document   : Register
    Created on : Aug 28, 2018, 4:07:38 PM
    Author     : Ayesha
--%>

<%@page import="POJOS.District"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.City"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

    </head>
    <body>
         <%
            if (request.getParameter("ms") != null) {
        %>
        <br>
        <div class="container">
            <div style="background-color: #ce563f;" class="alert fade in">
                <a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>ERROR!&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("ms")%></strong>
            </div>
        </div>
       <%
            }
%>
        <div class="row">
            <div class="col-sm-4">

            </div>
            <center>
                <div class="col-sm-4">
                    <br><br><br><br>
                    <div class="panel panel-default">

                        <div class="panel panel-title">
                            <center> <h4><b>Register Now </b></h4></center>
                        </div>               
                        <div class="panel-body" style="background-color: #d6e3ee">
                            <form action="../UserRegister" method="POST">                                
                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="fname" required="" placeholder="First Name"><br>
                                    </div>                           
                                </div>
                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="lname" required="" placeholder="Last Name"><br>
                                    </div>                           
                                </div>
                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input type="number" max="999999999" min="010000000" maxlength="10" class="form-control" required="" name="mobile" placeholder="Mobile Phone"><br>
                                    </div>                           
                                </div>
                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input type="number" max="999999999" min="010000000" maxlength="10" class="form-control" required="" name="phone" placeholder="Alt:Phone"><br>
                                    </div>                           
                                </div>
                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" required="" name="street" placeholder="Address No/Street"><br>
                                    </div>                           
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <select class="form-control" required="" name="city" id="city">
                                            <option>Select City</option>
                                            <%
                                                Session hs = CONNECTION.NewHibernateUtil.getSessionFactory().openSession();
                                                Criteria cr = hs.createCriteria(City.class);
                                                List<City> list = cr.list();
                                                for (City city : list) {
                                            %>
                                            <option><%=city.getCityname()%></option>
                                            <%
                                                }
                                            %>

                                        </select><br>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <select class="form-control" required="" name="district" id="district">
                                            <option>Select District</option>
                                            <%
                                                Criteria cr1 = hs.createCriteria(District.class);
                                                List<District> list1 = cr1.list();
                                                for (District district : list1) {
                                            %>
                                            <option><%=district.getDistrictname()%></option>
                                            <%
                                                }
                                            %>
                                        </select><br>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <select class="form-control" required="" name="question">
                                            <option>Select Your Security Question</option>
                                            <option>What is your favorite color? </option>
                                            <option>What is your first birthday gift? </option>
                                            <option>What is your favorite car? </option>
                                        </select><br>
                                    </div>
                                </div>
                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" required="" name="answer" placeholder="Enter Your Answer"><br>
                                    </div>                           
                                </div>

                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input data-toggle="tooltip" title="Enter valid email address!" type="email" class="form-control" required="" name="email" placeholder="Enter Email"><br>
                                    </div>                           
                                </div> 
                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input data-toggle="tooltip" title="Enter a password longer than 10 characters!" minlength="10" type="password" class="form-control" required="" name="pass" placeholder="Enter Password"><br>

                                    </div>                           
                                </div>
                                <div class="form-group">                                     
                                    <div class="col-sm-12">
                                        <input type="password" class="form-control" required="" name="confirmpass" minlength="10" placeholder="Confirm Password"><br>
                                    </div>                           
                                </div>
                                <div class="col-sm-12">
                                    <div class="checkbox">
                                        <label><input class="col-sm-offset-3" required="" name="agree" type="checkbox"> I agree to the <a>terms</a></label>
                                    </div>

                                </div>

                                <input type="submit" value="Register" class="btn btn-danger btn-sm btn-block"><br>
                                <div class="form-group"> 
                                    <div class="col-sm-12">

                                        <p><b>-- OR --</b></p>
                                        <a href="../LoginRegisterPages/Signin.jsp" >I already have an Account?</a><br>

                                    </div>
                                </div> 
                            </form>
                        </div>
                        <div class="panel-footer">

                        </div>
                    </div>

                </div>
            </center>

            <div class="col-sm-4">

            </div>
        </div>

    </body>
</html>
