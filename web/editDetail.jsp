<%-- 
    Document   : AddPatient
    Created on : Mar 27, 2017, 8:54:13 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.CdaPatient"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Edit Patient</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
    </head>
    <body> 
        <div class="container">

            <div class="col-lg-12 well">
                <div class="row">
                     <form action="updatePatientDetail" method="POST">
                        <%
           //CdaPatient  t = (CdaPatient)request.getAttribute("ob");
           CdaPatient t = (CdaPatient) session.getAttribute("ob");
           //out.print(t);
              %>
                        <div class="col-sm-12">
                            <h3 class="alert alert-success">Edit Patient Detail</h3>
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <label>Patient Name</label>
                                      <input type="hidden" name="id" value="<%= t.getId() %>" />
                                      <input name="fname" value="<%= t.getPName()%>" type="text" placeholder="Enter First Name Here.." class="form-control" required="">
                                </div>
                               
                            </div>                  
                            <div class="form-group">
                                <label>Address</label>
                                <textarea name="address" placeholder="Enter Address Here.." rows="2" class="form-control"><%= t.getPAddress() %></textarea>
                            </div> 
                           
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <label>Age</label>
                                    <input name="age" type="number" value="<%=t.getPAge()%>" placeholder="Age" class="form-control" required>
                                </div>  
                                <div class="col-sm-4 form-group">
                                    <label>Gender</label>
                                    <select value="<%= t.getPGender()%>" name="gender" class="form-control">
                                        <option>Male</option>
                                        <option>Female</option>
                                    </select>
                                </div>  
                                <div class="col-sm-4 form-group">
                                    <label>Blood Group</label>
                                    <select name="bloodgroup" value="<%= t.getPBloodgroup()%>" class="form-control">
                                        <option>A+</option>
                                        <option>B+</option>
                                        <option>AB+</option>
                                        <option>O+</option>
                                        <option>A-</option>
                                        <option>B-</option>
                                        <option>AB-</option>
                                        <option>O-</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <label>Occupation</label>
                                    <input type="text" name="occupation" value="<%=t.getPOccupation()%>" placeholder="Enter Designation Here." class="form-control">
                                </div>    


                                <div class="col-sm-4 form-group">
                                    <label>Email Address</label>
                                    <input type="email" id="email" name="email" value="<%= t.getPEmail()%>" placeholder="Enter Email Address Here.." class="form-control">
                                </div>      
                                <div class="col-sm-4 form-group">
                                    <label>Phone Number</label>
                                    <input id="contactno"  type="number" name="contactno" value="<%= t.getPContact()%>" placeholder="Enter Phone Number Here.." class="form-control">
                                </div>      
                            </div>


                            <button type="submit" class="btn btn-success">Submit</button>                   
                        </div>
                    </form> 
                </div>
            </div>
        </div>
    </body>
</html>
<script>
    $("#breadcrums_1st").text("Edit Patient");
    $("#breadcrums_2nd").text("<%= t.getPName()%>");
</script>