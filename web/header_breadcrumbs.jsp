<%-- 
    Document   : header_breadcrumbs
    Created on : Mar 27, 2017, 7:21:03 PM
    Author     : USER
--%>

<%@page import="org.hibernate.Query"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="controller.Connect"%>
<%@page import="model.CdaPatient"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <script src="js/jquery-1.12.4.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script>
            $(function() {
                var availablePatient = [];
                var av = [];
            <%
                Connect HeaderBreadConnection = new Connect();
                try{
                String hql = "FROM CdaPatient";
                Query query = HeaderBreadConnection.session.createQuery(hql);
                ArrayList<CdaPatient> pt = (ArrayList<CdaPatient>) query.list();

//out.print(results);

            %>
                av = [
            <%                   for (int i = 0; i < query.list().size(); i++) {
                    CdaPatient cd = pt.get(i);
            %>
                    {label: "<%= cd.getPName()%> <%= cd.getPContact()%>", value:<%= cd.getId()%>},
            <% }%>
                            ]

                            //$('.widget').html($('.widget').html().substring(3));
                            $("#search").autocomplete({
                                source: av,
                                select: function(event, ui) {
                                    event.preventDefault();
                                    var a = ui.item.value;
                                    var b = ui.item.label;
                                    $("#search").val(b);
                                    window.location = "PatientComplaints.jsp?pid=" + a;
                                },
                                focus: function(event, ui) {
                                    event.preventDefault();
                                    $("#search").val(ui.item.label);
                                }
                            });

                        });
        </script>
    </head>

    <body>

        <div class="container-fluid">
            <ol class="breadcrumb" style="height:auto; margin-left:15px;  background-color:white; font-size:15px; color:black;">
                <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                <li class="breadcrumb-item" id="breadcrums_1st"></li>
                <li class="breadcrumb-item" id="breadcrums_2nd"></li>

                <div class="form-group" style="float:right; margin-top:-5px;">
                    <input id="search" type="text" class="form-control" placeholder="Search" style="width:300px;">


                </div>		
            </ol>
            <hr>    
        </div>
    </body>
</html>
<script>
    $("#search").change(function(){
        window.location.href = "SearchResults.jsp?name="+($("#search").val());
    });
</script>
<%
                }
                finally{
                    HeaderBreadConnection.Close();
                }
%>