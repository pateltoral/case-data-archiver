<%-- 
    Document   : AddPatient
    Created on : Mar 27, 2017, 8:54:13 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Patient</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/AddPatient.css">
     <style>
        #breadcrums_2nd
        {
            display:none;
        }
        </style>

    </head>
    <body> 
        <div class="container">

            <div class="col-lg-12 well">
                <div class="row">
                    <form action="patientRegistration" method="POST">
                        <div class="col-sm-12">
                            <h3 class="alert alert-success">Add New Patient</h3>
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <label>First Name</label>
                                    <input name="fname" type="text" placeholder="Enter First Name Here.." class="form-control" required="">
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label>Middle Name</label>
                                    <input name="mname" type="text" placeholder="Enter Middle Name Here.." class="form-control">
                                </div>
                                <div class="col-sm-4 form-group">
                                    <label>Last Name</label>
                                    <input name="lname" type="text" placeholder="Enter Last Name Here.." class="form-control" required="">
                                </div>
                            </div>                  
                            <div class="form-group">
                                <label>Address</label>
                                <textarea name="address" placeholder="Enter Address Here.." rows="2" class="form-control" required=""></textarea>
                            </div> 
                            <div class="row">
                                <div class="col-sm-4 form-group">
                                    <label>Age</label>
                                    <input name="age" type="text"  placeholder="Age" class="form-control">
                                </div>  
                                <div class="col-sm-4 form-group">
                                    <label>Gender</label>
                                    <select name="gender" class="form-control">
                                        <option>Male</option>
                                        <option>Female</option>
                                    </select>
                                </div>  
                                <div class="col-sm-4 form-group">
                                    <label>Blood Group</label>
                                    <select name="bloodgroup" class="form-control">
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
                                    <input type="text" name="occupation" placeholder="Enter Designation Here." class="form-control">
                                </div>    


                                <div class="col-sm-4 form-group">
                                    <label>Email Address</label>
                                    <input type="email" id="email" name="email" placeholder="Enter Email Address Here.." class="form-control">
                                </div>  	
                                <div class="col-sm-4 form-group">
                                    <label>Phone Number</label>
                                    <input id="contact"  type="number" min="0" name="mobile" placeholder="Enter Phone Number Here.." class="form-control" >
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
    $("#breadcrums_1st").text("Add Patient");

</script>
