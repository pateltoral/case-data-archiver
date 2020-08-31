<%-- 
    Document   : AddComplaints
    Created on : Mar 27, 2017, 9:02:34 PM
    Author     : USER
--%>

<%@page import="model.CdaComplaints"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.CdaCase"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Edit Complaints</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="css/font-awesome.css">
		<link rel="stylesheet" href="css/AddPatient.css">
                 
</head>
<body> 
    <body> 
        <%
        Connect EditComplaintsConnection = new Connect();
        try{
String complaintid = request.getParameter("complaintid");

  
     Criteria cr = EditComplaintsConnection.session.createCriteria(CdaComplaints.class);
     cr.add(Restrictions.eq("id", Long.parseLong(complaintid)));
     ArrayList<CdaComplaints> al1 = (ArrayList<CdaComplaints>) cr.list();
     CdaComplaints cc1 = al1.get(0);
     
Criteria cr1  = EditComplaintsConnection.session.createCriteria(CdaPatient.class);
cr1.add(Restrictions.eq("id", cc1.getPid()));
ArrayList<CdaPatient> al2 = (ArrayList<CdaPatient>)cr1.list();
CdaPatient pt1 = al2.get(0);
 HttpSession hs = request.getSession();
 hs.setAttribute("pc", cc1);
%>
        <script>
              $("#breadcrums_1st").text("Edit Complaints");
              $("#breadcrums_2nd").text("<%= pt1.getPName() %>");
              </script>
        <div class="col-lg-12" style="background:white;">
            <div class="row">
               
                    <div class="col-sm-12">
                        <div class="col-sm-12 well well-sm">
                            <b><h3 class="col-sm-12">Patient Details</h3></b>
                            <div class="col-sm-4 form-group">
                                <label>Patient Name</label>
                                <b><input type="text" value="<%=pt1.getPName()%>" class="form-control" disabled></b>
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Patient Mobile</label>
                                <input type="number" value="<%=pt1.getPContact() %>" class="form-control" disabled>
                            </div>
                            <div class="col-sm-4 form-group">
                                <label>Patient Address</label>
                                <input type="text" value="<%=pt1.getPAddress() %>" class="form-control" disabled>
                            </div>
                        </div> 
                            <form action="EditComplaintServ" method="POST">
                                <input type="hidden" name="pid" value="<%= pt1.getId()%>">
                                   <input type="hidden" name="cid" value="<%= cc1.getCid() %>">
                        <div class="col-sm-12 well well-sm">
                            <b><h3 class="col-sm-12">Add Patient Complaint</h3></b>
                            <div class="col-sm-2 form-group">
                                <label>Date</label>
                                <input type="date" name="casedate" value="<%= cc1.getCompDate() %>" required>
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>Complaints</label>
                                <textarea id="complaints" placeholder="Enter Patient Complaints Here.." name="complaints" rows="10" class="form-control" required><%=cc1.getComplaints()%></textarea>
                            </div> 

                            <div class="col-sm-6 form-group">
                                <label>Medicines(Rx)</label>
                                <textarea placeholder="Prescribtion" name="medicine" rows="4" class="form-control" required><%= cc1.getMedicine() %></textarea>
                            </div>  
                            <div class="col-sm-1 form-group">
                                <label>Days</label>
                                <input type="number" placeholder="2" value="<%= cc1.getDaysOfMedicine() %>" name="dom" class="form-control" min="1" required>
                            </div>

                            <div class="col-sm-12"></div>
                            <div class="col-sm-1 form-group">
                                <label>Amount</label>
                                <input type="number" id="amount" value="<%= cc1.getAmount() %>" name="amount" class="form-control" readonly>
                            </div> 
                            <div class="col-sm-1 form-group">
                                <label>Paid</label>
                                <input type="number" name="paid" id="paid" class="form-control" readonly>
                            </div> 

                            <div class="col-sm-1 form-group">
                                <label>Unpaid</label>
                                <input type="number" value="<%= cc1.getUnpaid() %>" id="unpaid" name="unpaid" value="0" class="form-control" readonly>
                            </div> 
                            <div class="col-sm-12 form-group">
                                <button type="submit" class="btn btn-success">Save</button>      
                            </div>
                        </div>  
                         </form> 
                    </div>
               
            </div>
        </div>
    </body>
</html>
     <script type="text/javascript">
    
    $("#paid").blur(function(){
       var paid = $("#paid").val();
       var amount = $("#amount").val();
       if(+paid > +amount)
       {
           alert("Paid amount should be less than "+amount);  
           $("#paid").val("");
           $("#unpaid").val(0);
       }
       else
       {
           var unpaid = amount - paid;
           $("#unpaid").val(unpaid);
       }
       //alert(unpaid);
    });
</script>
<%
        }
        finally{
            EditComplaintsConnection.Close();
        }
%>