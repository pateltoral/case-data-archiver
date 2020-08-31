<%-- 
    Document   : ViewComplaints
    Created on : Mar 27, 2017, 11:55:22 PM
    Author     : USER
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.CdaAppointment"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>View Appointments</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/AddPatient.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--<script src="js/jquery-3.1.1.min.js"></script>-->
         <style>
            #breadcrums_2nd
            {
                display:none;
            }
        </style>
        <script>
            $("#breadcrums_1st").text("View Appointments");
            function myFunction() {

                var input, filter, table, tr, td, i;
                input = document.getElementById("new_date");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
            function myFunction1() {

                var input, filter, table, tr, td, i;
                input = document.getElementById("old_date");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable1");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
            function searchnewname() {
                // Declare variables 
                var input, filter, table, tr, td, i;
                input = document.getElementById("searchnew");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
              function searcholdname() {
                // Declare variables 
                var input, filter, table, tr, td, i;
                input = document.getElementById("searchold");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable1");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        
        </script>
    </head>
    <body onload="myFunction(),myFunction1()">
        <%LocalDate localDate = LocalDate.now();%>
        <div class="container">
            <h3 style="color: green;"> <i class="fa fa-arrow-right" aria-hidden="true"></i>&nbsp;New Patient Appointments</h3>
            <a href="DeleteAppointmentServ">
            <button type="button" class="btn btn-success" style="float: right; margin-right: 15px; margin-top: -45px;">Delete appointments</button>
            </a>
            <hr/>
           
            <div id="custom-search-input" >
                <div class="row">
                   
                    <div class="col-sm-3 form-group">
                        <label>Select by Date</label>

 <input type="date" id="new_date" value="<%= DateTimeFormatter.ofPattern("yyy-MM-dd").format(localDate) %>" onchange="myFunction()" class="form-control">
                    </div>
                      <div class="col-sm-4 form-group">
                        <label>Search Patient</label>
                        <input type="text" id="searchnew" class="form-control" onkeyup="searchnewname()" placeholder="Search for names..">
                    </div>
                </div>
            </div>
            <br/>
            <div class="table">         
                <table class="table table-hover" id="myTable">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Patient Name</th>
                            <th>Time</th>
                            <th colspan="3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                         <%
                CdaAppointment app = null;
                ArrayList<CdaAppointment> appal = null;
                appal = (ArrayList<CdaAppointment>) request.getAttribute("New");
                for (int i = 0; i < appal.size(); i++) {
                    app = appal.get(i);

            %>
                        <tr class="header">
                            <td><%=app.getAppDate()%></td>
                            <td><%=app.getPname()%></td>
                            <td><%=app.getAppTime()%></td>

                            <td class="col-sm-1">
                                <a href="AddPatient.jsp">
                                    <button type="button" class="btn btn-success">View </button>
                                </a>
                            </td>
                        </tr>
                        <%}%>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="container">
            <h3 style="color: green;"> <i class="fa fa-arrow-right" aria-hidden="true"></i>&nbsp;Old Patient Appointments</h3>
            <hr/>
             
            <div id="custom-search-input" >
                <div class="row">
                     
                    <div class="col-sm-3 form-group">
                        <label>Select by Date</label>

                        <input type="date" value="<%= DateTimeFormatter.ofPattern("yyy-MM-dd").format(localDate) %>" id="old_date" onChange="myFunction1()" class="form-control">
                    </div>
                     <div class="col-sm-4 form-group">
                        <label>Search Patient</label>
                        <input type="text" id="searchold" class="form-control" onkeyup="searcholdname()" placeholder="Search for names..">
                    </div>
                </div>
            </div>
            <br/>
            <div class="table">         
                <table class="table table-hover" id="myTable1">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Patient Name</th>
                            <th>Mobile No</th>
                            <th>Address</th>
                            <th>Time</th>
                            <th colspan="3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                         <%
                 Connect ViewAppointmentConnection = new Connect();
                 try{
                CdaAppointment app2 = null;
                ArrayList<CdaAppointment> appal2 = null;
                appal2 = (ArrayList<CdaAppointment>) request.getAttribute("old");
                for (int i = 0; i < appal2.size(); i++) {
                    app2 = appal2.get(i);
                    
                  Query query1 = ViewAppointmentConnection.session.createQuery("FROM CdaPatient WHERE id=" + app2.getPid());

                ArrayList<CdaPatient> al3 = (ArrayList<CdaPatient>) query1.list();
                CdaPatient compt = al3.get(0);
            %>
                        <tr>
                            <td><%=app2.getAppDate()%></td>
                            <td><%=app2.getPname()%></td>
                            <td><%=compt.getPContact()%></td>
                            <td><%=compt.getPAddress()%></td>
                            <td><%=app2.getAppTime()%></td>
                            <td class="col-sm-1">
                                   <a href="PatientComplaints.jsp?pid=<%= app2.getPid()%>">
                                <button type="button" class="btn btn-success">View </button>
                                   </a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
<%
                 }
                 finally{
                     ViewAppointmentConnection.Close();
                 }
%>
