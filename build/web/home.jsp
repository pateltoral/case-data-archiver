<%-- 
    Document   : home
    Created on : Mar 27, 2017, 8:15:48 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
         <style>
        #breadcrums_1st,#breadcrums_2nd
        {
            display:none;
        }
        </style>
    </head>
    <body>
        <!-- header starts -->
        <% 
        if(request.getAttribute("SuccessMsg")!=null){
            String SuccessMsg =  request.getAttribute("SuccessMsg").toString();
        
        %>
    <center><h3  style="color:green;"> <%= SuccessMsg %> &nbsp;<i class="fa fa-smile-o" aria-hidden="true"></i> </h3></center>
        <%
        }
        %>
        <section>
            <div class="container">
                <div class="row">

                   <div class="col-md-4 ">
                        <div class="pv-30 ph-20 service-block bordered shadow text-center object-non-visible animated object-visible fadeInDownSmall" data-animation-effect="fadeInDownSmall" data-effect-delay="100">
                            <div class="icon-col">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <h3>Add patient</h3>
                            <div class="divider clearfix"></div>
                            <p>Lets you add patient and maintain there details.</p>
                            <a href="AddPatient.jsp" ><button type="button" class="btn btn-success">Add Patient</button></a><!-- <a href="#">Add Patient <i class="pl-5 fa fa-angle-double-right"></i></a> -->
                        </div>
                    </div>
                    <div class="col-md-4 ">
                        <div class="pv-30 ph-20 service-block bordered shadow text-center object-non-visible animated object-visible fadeInDownSmall" data-animation-effect="fadeInDownSmall" data-effect-delay="100">
                            <div class="icon-col">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </div>
                            <h3>View patients</h3>
                            <div class="divider clearfix"></div>
                            <p>Lets Edit,Update and delete patient details.</p>
                        <form action="fetchserv" method="POST">
            <input type="submit" name="btnsub" value="View patient" class="btn btn-success" />
        </form>
                        </div>
                    </div>
                    <div class="col-md-4 ">
                        <div class="pv-30 ph-20 service-block bordered shadow text-center object-non-visible animated object-visible fadeInDownSmall" data-animation-effect="fadeInDownSmall" data-effect-delay="100">
                            <div class="icon-col">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </div>
                            <h3>View Complaints</h3>
                            <div class="divider clearfix"></div>
                            <p>Lets you view patient Complaints.</p>
                            <form action="FetchComplaintServ" method="POST">
                            <button type="submit" class="btn btn-success">View Complaints</button><!-- <a href="#">Add Patient <i class="pl-5 fa fa-angle-double-right"></i></a> -->
                            </form>
                        </div>
                    </div>
                    <div class="col-md-4 ">
                        <div class="pv-30 ph-20 service-block bordered shadow text-center object-non-visible animated object-visible fadeInDownSmall" data-animation-effect="fadeInDownSmall" data-effect-delay="100">
                            <div class="icon-col">
                                <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <h3>Add Appointment</h3>
                            <div class="divider clearfix"></div>
                            <p>Lets you Add New patient direct Appointments.</p>
                            <a href="AddNewAppointment.jsp" ><button type="button" class="btn btn-success">Add Appointments</button></a><!-- <a href="#">Add Patient <i class="pl-5 fa fa-angle-double-right"></i></a> -->
                        </div>
                    </div>
                       <div class="col-md-4 ">
                        <div class="pv-30 ph-20 service-block bordered shadow text-center object-non-visible animated object-visible fadeInDownSmall" data-animation-effect="fadeInDownSmall" data-effect-delay="100">
                            <div class="icon-col">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </div>
                            <h3>View Appointments</h3>
                            <div class="divider clearfix"></div>
                            <p>Lets you view patient Appointments.</p>
                            <form action="FetchAppServ" method="POST">
                            <button type="submit" class="btn btn-success">View Appointments</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
