<%-- 
    Document   : header
    Created on : Mar 27, 2017, 7:19:43 PM
    Author     : USER
--%>

<%@page import="model.CdaDoctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="shortcut icon" href="img/logo.png" type="image/x-icon" sizes="100%" />

        <style>
            #text_header{
                border-radius: 50px;
            }   
        </style>
    </head>

    <body>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid"> 

                <img src="img/logo.png" class="logo"><h3 class="header-h3">Case Data Archiver</h3>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user"></span> 
                                <%
                                    if (session.getAttribute("name") != null) {
                                        CdaDoctor doc = (CdaDoctor) session.getAttribute("name");
                                %>

                                <strong><%= doc.getName()%></strong>
                                <span class="glyphicon glyphicon-chevron-down"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="navbar-login">
                                        <div class="row">
                                             <center>
                                            <div class="col-lg-4" id="text_header" style="background-color: lightgrey; width: 70px; height: 70px; margin-left: 30px; border: 2px solid black">
                                                <p class="text-center">
                                                    <center><span style="color: black;"><h1 style="margin-top:17px;"><%= doc.getName().toUpperCase().charAt(0) %><h1></span></center>
                                                </p>
                                            </div>
                                            </center>
                                            <div class="col-lg-8">
                                                <p class="text-left small"><%= doc.getEmail()%></p>
                                                <p class="text-left">
                                                    <a href="edit_profile.jsp" class="btn btn-success btn-block btn-sm">My Account</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <%
                                    }
                                %>
                                <li class="divider"></li>
                                <li>
                                    <div class="navbar-login navbar-login-session">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <p>
                                                    <a href="settings.jsp" class="btn btn-success btn-block">Settings</a>
                                                </p>
                                            </div>
                                            <div class="col-lg-6">
                                                <p>
                                                    <a href="index.jsp" class="btn btn-success btn-block">Log Out</a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
