<%-- 
    Document   : verifyYourCode
    Created on : Oct 8, 2018, 4:58:28 PM
    Author     : Ayesha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../styles/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../styles/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../styles/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         <div class="row">
            <div class="col-sm-4">

            </div>
            <center>
                <div class="col-sm-4">
                    <br><br><br><br><br><br>
                    <div class="panel panel-default">

                        <div class="panel panel-title">
                            <center> <h3 style="color: #c9302c"><b>-Feelings Gift Store-</b></h3></center>
                            <center> <h5><b>Enter Your Verification Code</b></h5></center>
                        </div>               
                        <div class="panel-body">
                            <form action="../CodeConfirm" method="POST">                                
                                
                            <div class="form-group">                       
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" name="cmfcode" placeholder="Enter your code"><br>
                                    </div>                           
                                </div>
                                
                                <div class="form-group"> 
                                    <div class="col-sm-12">
                                        <input type="submit" value="Enter" class="btn btn-primary btn-sm btn-block"><br>

                                    </div>
                                </div>
                        
                        
                            </form>
                      
                        </div>
                       
                    </div>

                </div>
            </center>

            <div class="col-sm-4">

            </div>
        </div>
    </body>
</html>
