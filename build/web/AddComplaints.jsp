<%-- 
    Document   : AddComplaints
    Created on : Mar 27, 2017, 9:02:34 PM
    Author     : USER
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
  <title>Case Data Archiver</title>
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
         Connect AddComplaintsConnection = new Connect();
        try{
String pid = request.getParameter("pid");
 
     Criteria cr = AddComplaintsConnection.session.createCriteria(CdaPatient.class);
     cr.add(Restrictions.eq("id", Long.parseLong(pid)));
     ArrayList<CdaPatient> al1 = (ArrayList<CdaPatient>) cr.list();
     CdaPatient pt1 = al1.get(0);
     
Criteria cr1  = AddComplaintsConnection.session.createCriteria(CdaCase.class);
cr1.add(Restrictions.eq("pid", Long.parseLong(pid)));
ArrayList<CdaCase> al2 = (ArrayList<CdaCase>)cr1.list();
CdaCase cc1 = al2.get(0);
%>
        <script>
              $("#breadcrums_1st").text("Patient Complaints");
              $("#breadcrums_2nd").text("<%= pt1.getPName()%>");
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
                                <%
                                 LocalDate localDate = LocalDate.now();
                                %>
                            <form action="AddComplaintsServ" method="POST">
                                <input type="hidden" name="pid" value="<%= pt1.getId()%>">
                                   <input type="hidden" name="cid" value="<%= cc1.getCid()%>">
                        <div class="col-sm-12 well well-sm">
                            <b><h3 class="col-sm-12">Add Patient Complaint</h3></b>
                            <div class="col-sm-2 form-group">
                                <label>Date</label>
                                <input type="date" name="casedate" value="<%= DateTimeFormatter.ofPattern("yyy-MM-dd").format(localDate) %>"
 required>
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>Complaints</label>
                                <textarea placeholder="Enter Patient Complaints Here.." name="complaints" rows="10" class="form-control" required></textarea>
                            </div> 

                            <div class="col-sm-6 form-group">
                                <label>Medicines(Rx)</label>
                                <textarea placeholder="Prescribtion" name="medicine" rows="4" class="form-control" required></textarea>
                            </div>  
                            <div class="col-sm-2 form-group">
                                <label>Days</label>
                                <input type="number" placeholder="2" name="dom" class="form-control" min="1" required>
                            </div>

                            <div class="col-sm-12"></div>
                            <div class="col-sm-2 form-group">
                                <label>Amount</label>
                                <input type="number" placeholder="100" id="amount" name="amount" class="form-control" required="">
                            </div> 
                            <div class="col-sm-2 form-group">
                                <label>Paid</label>
                                <input type="number" placeholder="50" name="paid" id="paid" class="form-control" required="">
                            </div> 

                            <div class="col-sm-2 form-group">
                                <label>Unpaid</label>
                                <input type="number" placeholder="50" id="unpaid" name="unpaid" value="0" class="form-control" readonly>
                            </div> 
                              <div class="col-sm-2 form-group">
                                <label>Deposit</label>
                                <input type="number" id="deposit" name="deposit" value="0" class="form-control" readonly>
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
     $("#amount").blur(function() {
                $("#paid").val("");
                var amount = $("#amount").val();

                if (+unpaid > 0) {
                    amount = (+amount) + (+unpaid);
                    $("#amount").val(amount);
                    $("#unpaid").val(amount);
                }
                if(+deposit > 0){
                    amount = (+amount)- (+deposit);
                    if(amount <= 0){
                         $("#amount").val(0);
                         $("#paid").val(0);
                         $("#paid").attr("disabled",true);
                         $("#deposit").val(Math.abs(+amount));
                    }
                    else{
                        $("#paid").attr("disabled",false);
                      $("#amount").val(amount);
                      $("#deposit").val(0);
                  }
                }
            });
            $("#paid").blur(function() {
                var paid = $("#paid").val();
                var amount = $("#amount").val();
                if (+paid > +amount)
                {
                     var deposit1 = +paid - +amount;
                    $("#deposit").val(deposit1);
                    $("#unpaid").val(0);
                }
                else
                {
                   
                    $("#deposit").val(0);
                    var unpaid = amount - paid;
                    $("#unpaid").val(unpaid);
                }
            });
            $("#amount").focus(function(){
               $("#amount").val(""); 
               $("#paid").val("");
            });
</script>
<%}
finally{
AddComplaintsConnection.Close();
}
%>