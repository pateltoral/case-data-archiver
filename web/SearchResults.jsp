<%-- 
    Document   : SearchResults
    Created on : Mar 27, 2017, 11:54:20 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Search Results</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/AddPatient.css">
         <style>
            #breadcrums_2nd
            {
                display:none;
            }
        </style>
    </head>
    <body>
        <br/>
        <div class="container"> 
            <h3 class="alert alert-success">Search Results</h3>
            <hr/>
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Sr. No</th>
                        <th>Name</th>
                        <th>Mobile No</th>
                        <th>Address</th>
                        <th colspan="1">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    Connect SearchResultConnection = new Connect();
                    try{
                    String name = request.getParameter("name");
                        
                    //String hql1 = "FROM CdaPatient WHERE p_name LIKE '%"+name+"%'";
                        //out.print(hql1);
                        Query query1 = SearchResultConnection.session.createQuery("FROM CdaPatient WHERE p_name LIKE '%" + name + "%'");
                        ArrayList<CdaPatient> pt1 = (ArrayList<CdaPatient>) query1.list();

                        for (int i = 0; i < query1.list().size(); i++) {
                            CdaPatient cd = pt1.get(i);
                    //     out.println(cd.getPName());
                            //     out.println("\n");

                    %>

                    <tr>
                        <td><%= i + 1%></td>
                        <td><%= cd.getPName()%></td>
                        <td><%= cd.getPContact()%></td>
                        <td><%= cd.getPAddress()%></td>
                        <td class="col-sm-1">
                            <a href="PatientComplaints.jsp?pid=<%= cd.getId()%>">
                                <button type="button" class="btn btn-success">
                                    View 
                                </button>
                            </a>
                        </td>	     
                    </tr>
                        <% }%> 
                </tbody>
            </table>
        </div>
    </body>	
</html>
<script>
  $("#breadcrums_1st").text("Search Results");  
</script>
<%
    }
                    finally{
                        SearchResultConnection.Close();
                    }
%>