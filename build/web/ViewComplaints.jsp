<%-- 
    Document   : ViewComplaints
    Created on : Mar 27, 2017, 11:55:22 PM
    Author     : USER
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="model.CdaComplaints"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>View Complaints</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/AddPatient.css">
        <script src="js/jquery.table2excel.min.js"></script>
         <style>
            #breadcrums_2nd
            {
                display:none;
            }
        </style>
        <!--<script src="js/jquery-3.1.1.min.js"></script>-->
    </head>
    <body>

        <div class="container">
            <h3 class="alert alert-success">View Complaints</h3>
            <hr/>
            <div id="custom-search-input" >
                <div class="row">

                    <div class="col-sm-4 form-group">
                        <label>Search Patient</label>
                        <input type="text" id="myInput" class="form-control" onkeyup="myFunction()" placeholder="Search for names..">
                    </div>
                    <div class="col-sm-4 form-group">
                        <label>Select by Month</label>
                        <select class="form-control">
                            <option>January</option>
                            <option>February</option>
                            <option>March</option>
                            <option>April</option>
                            <option>May</option>
                            <option>June</option>
                            <option>July</option>
                            <option>August</option>
                            <option>September</option>
                            <option>October</option>
                            <option>November</option>
                            <option>December</option>
                        </select>
                    </div>  
                    <div class="col-sm-3 form-group">
                        <label>Select by Year</label>
                        <select class="form-control">
                            <option>2017</option>
                        </select>
                    </div>
                </div>
            </div>
            <br/>
            <div class="table">         
                <table class="table table-hover" id="complaints_table">
                    <thead>
                        <tr>
                            <th class="check"> </th>
                            <th>Date</th>
                            <th>Name</th>
                            <th>Mobile No</th>
                            <th>Address</th>
                            <th>Medicine</th>
                            <th>Amount</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Connect ComplaintConnection = new Connect();
                        try{
                            if (request.getAttribute("list") != null) {
                                ArrayList<CdaComplaints> al1 = (ArrayList<CdaComplaints>) request.getAttribute("list");
                                if (al1.size() > 0) {
                                    for (int i = 0; i < al1.size(); i++) {
                                        CdaComplaints ct = al1.get(i);
                                        Criteria cr = ComplaintConnection.session.createCriteria(CdaPatient.class);
                                        CdaPatient comp = null;
                                        cr.add(Restrictions.eq("id", ct.getPid()));
                                        ArrayList<CdaPatient> compal = (ArrayList<CdaPatient>) cr.list();
                                        CdaPatient t;
                                        for (int j = 0; j < compal.size(); j++) {
                                            t = compal.get(j);

                        %>
                        <tr id="row<%= i%>">
                            <td class="check">
                                <input type="checkbox" id="inlineCheckbox<%= i%>">
                            </td>
                            <td><%=ct.getCompDate()%></td>
                            <td><%=t.getPName()%></td>  
                            <td><%=t.getPContact()%></td>
                            <td><%=t.getPAddress()%></td>
                            <td><%=ct.getMedicine()%></td>
                            <td><%=ct.getAmount()%></td>  

                        </tr>
                    <script>
                        $('#inlineCheckbox<%= i%>').click(function() {
                            if ($(this).prop("checked") == true) {

                                $("#row<%= i%>").css("background-color", "#afd9ee");
                                $("#row<%= i%>").attr("class", "row_tr");

                            }
                            else
                            {
                                $("#row<%= i%>").css("background-color", "white");
                                $("#row<%= i%>").removeClass("row_tr");
                            }
                        });
                    </script>
                    <%}}}}%>

                    </tbody>
                </table>
            </div>
            <div class="text-center"><button class="btn btn-success" type="button" id="btnExport">Generate Excel </button></div>
        </div>


    </body>
</html>
<script type="text/javascript" >
     $("#breadcrums_1st").text("View Complaints");
    $("#btnExport").click(function(e) {
        //getting values of current time for generating the file name
        var dt = new Date();
        var day = dt.getDate();
        var month = dt.getMonth() + 1;
        var year = dt.getFullYear();
        var hour = dt.getHours();
        var mins = dt.getMinutes();

        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
        $("#complaints_table").table2excel({
            exclude: ".row_tr,.check",
            name: "Excel Document Name",
            filename: "PatientComplaint" + postfix + ".xls",
            exclude_img: true,
            exclude_links: true,
            exclude_inputs: true
        });
    });
    function myFunction() {
        // Declare variables 
        var input, filter, table, tr, td, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("complaints_table");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2];
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
<%
                        }
                        finally{
                            ComplaintConnection.Close();
                        }
%>