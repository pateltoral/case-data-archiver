<%-- 
    Document   : AddAppointments
    Created on : Mar 27, 2017, 11:50:57 PM
    Author     : USER
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add New Patient Appointment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/AddPatient.css">
        <script src="js/bootstrap.min.js"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/clockface.css" rel="stylesheet">
        <script src="js/clockface.js"></script>
        <style>
            #breadcrums_2nd
            {
                display:none;
            }
        </style>
    </head>
    <body> 
        <br> <br>
 
         <div class="col-lg-12" style="background:white;">
            <div class="row">
               
                    <%  LocalDate localDate = LocalDate.now();%>
                         <form action="AddAppointmentServ?pid=0" method="POST">
                        <div class="col-sm-12 well well-sm">
                            <b><h3 class="col-sm-12">Add Appointment</h3></b>
                           
                            <b><h3 class="col-sm-12">Patient Details</h3></b>
                            <div class="col-sm-12">
                            <div class="col-sm-4 form-group">
                                <label>Patient Name</label>
                                <b><input type="text" name="pname" class="form-control"></b>
                            </div>
                            </div>
                            
                            <div class="col-sm-4 form-group">
                                <label>Date</label>
                                <input type="date" value="<%= DateTimeFormatter.ofPattern("yyy-MM-dd").format(localDate) %>"
 name="date" class="form-control" required>
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Time</label>
                                <input type="text" id="t1" value="" name="time" data-format="hh:mm A" class="form-control input-small">
                            </div>
                            <div class="col-sm-2 form-group">
                                <label>Patient Type</label>
                                <select name="ptype" class="form-control">
                                    <option>New</option>
                                </select>
                            </div>
                            <div class="col-sm-12 form-group">

                                <button class="btn btn-success" type="submit" value="add_appointment" class="form-control">
                                    Add Appointment
                                </button>
                            </div>
                        </div>
                             </form> 
                        </div>
                         
                     
               
            </div>
        </div>
    </body>
</html>
<script>
    $("#breadcrums_1st").text("Add New Patient Appointment");
    $('#t1').clockface();  
</script>