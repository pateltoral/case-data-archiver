<%-- 
    Document   : ViewPatient
    Created on : Mar 27, 2017, 11:56:23 PM
    Author     : USER
--%>

<%@page import="model.CdaCase"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>

<%@page import="java.util.ArrayList"%>
<%@page import="model.CdaPatient"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title>View Patient</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/AddPatient.css">
        <script language="javascript">
            $("#breadcrums_1st").text("View Patient");
        </script>
        <style>
            #breadcrums_2nd
            {
                display:none;
            }
        </style>

    </head>
    <body>
        <script>
            function myFunction() {
                // Declare variables 
                var input, filter, table, tr, td, i;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
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
        <div class="container">
            <h3 class="alert alert-success">View Patient</h3>
            <hr/>

            <div id="custom-search-input">
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
                    <div class="col-sm-4 form-group">
                        <label>Select by Year</label>
                        <select class="form-control">
                            <option>2017</option>
                        </select>
                    </div>

                </div>

            </div>
            <br/>

            <br>
            <div  class="table">         
                <table class="table table-hover results" id="myTable">
                    <thead>
                        <tr>
                            <th>Sr. No</th>
                            <th>Date</th>
                            <th>Name</th>
                            <th>Mobile No</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Blood Group</th>
                            
                        </tr>
                    </thead>

                    <tbody>
                        <%
                         Connect ViewDetailConnection = new Connect();
                         try{
                            ArrayList<CdaPatient> al = null;
                            CdaPatient t = null;
                            al = (ArrayList<CdaPatient>) request.getAttribute("patientlist");
                            for (int i = 0; i < al.size(); i++) {
                                t = al.get(i);
                                
                                Criteria cr_case = ViewDetailConnection.session.createCriteria(CdaCase.class);
                                cr_case.add(Restrictions.eq("pid", t.getId()));
                                ArrayList<CdaCase> ar_case = (ArrayList<CdaCase>) cr_case.list();
                                CdaCase cc = ar_case.get(0);
                        %>

                        <tr class="header">
                            <td><%=i+1%></td>
                            <td><%=cc.getCDate()%></td>
                            <td><%= t.getPName()%> </td>
                            <td><%= t.getPContact()%></td>
                            <td><%=t.getPAddress()%></td>
                            <td><%= t.getPEmail()%></td>
                            <td><%= t.getPAge()%></td>
                            <td><%= t.getPGender()%></td>
                            <td><%= t.getPBloodgroup()%></td>

                            <td class="col-sm-1">
                                <form action="editPatientDetail" method="Post">
                                    <input type="hidden" name="id" value="<%= t.getId()%>" />
                                    <button type="submit" name="edit" id="edit" class="btn btn-success btn-m">Edit </button></form>  </td>

                            <td class="col-sm-1">

                                <button type="button" class="btn btn-danger" data-href="DeletePatientServ?pid=<%= t.getId()%>" data-toggle="modal" data-target="#confirm-delete">
                                    Delete 
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div> 
            <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
                        </div>

                        <div class="modal-body">
                            <p>You are about to delete one track, this procedure is irreversible.</p>
                            <p>Do you want to proceed?</p>
                            <p class="debug-url"></p>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-danger btn-ok">Delete</a>
                        </div>
                    </div>
                </div>
            </div>   
        </div>
    </body>
</html>
<script>
    $('#confirm-delete').on('show.bs.modal', function(e) {
        $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
    });
</script>
<%
}
                         finally{
                             ViewDetailConnection.Close();
                         }
%>
