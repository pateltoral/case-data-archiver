<%-- 
    Document   : PatientComplaints
    Created on : Mar 27, 2017, 11:51:59 PM
    Author     : USER
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.CdaComplaints"%>
<%@page import="model.CdaCase"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title class="title"></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/AddPatient.css">

    </head>
    <body> 
        <br> <br>  
        <%
         Connect PatientComplaintsConnection = new Connect();
         try{
            String pid = request.getParameter("pid");
           
            Criteria cr = PatientComplaintsConnection.session.createCriteria(CdaPatient.class);
            cr.add(Restrictions.eq("id", Long.parseLong(pid)));
            ArrayList<CdaPatient> al1 = (ArrayList<CdaPatient>) cr.list();
            CdaPatient pt1 = al1.get(0);
            Criteria cr1 = PatientComplaintsConnection.session.createCriteria(CdaCase.class);
            cr1.add(Restrictions.eq("pid", Long.parseLong(pid)));
            ArrayList<CdaCase> al2 = (ArrayList<CdaCase>) cr1.list();
            CdaCase cc1 = al2.get(0);
        %>
        <script>
            $("#breadcrums_1st").text("Patient Complaints");
            $("#breadcrums_2nd").text("<%= pt1.getPName()%>");
            $(".title").text("<%=pt1.getPName()%>");
        </script>
        <a href="AddAppointments.jsp?pid=<%=pt1.getId()%>"><button type="button" class="btn btn-success" style="float: right; margin-right: 15px; margin-top: -45px;">Add Appointment</button></a>
        <div class="col-lg-12" style="background:white;">
            <div class="row">

                <div class="col-sm-12">
                    <div class="col-sm-12 well well-sm">
                        <h3 class="col-sm-12"><b>Patient Details</b></h3>
                        <div class="col-sm-4 form-group">
                            <label>Patient Name</label>
                            <b><input type="text" value="<%=pt1.getPName()%>" class="form-control" disabled></b>
                        </div>
                        <div class="col-sm-4 form-group">
                            <label>Patient Mobile</label>
                            <input type="text" value="<%=pt1.getPContact()%>" class="form-control" disabled>
                        </div>
                        <div class="col-sm-4 form-group">
                            <label>Patient Address</label>
                            <input type="text" value="<%= pt1.getPAddress()%>" class="form-control" disabled>
                        </div>
                    </div> 

                    <div class="col-sm-12 well well-sm">
                        <h3 class="col-sm-12"><b>Complaint Details</b></h3>

                        <div class="container-fluid table">         
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Address</th>
                                        <th>Medicine</th>
                                        <th>Amount</th>
                                        <th colspan="3">Action</th>
                                    </tr>
                                </thead>
                                <%
                                    CdaComplaints comp1 = null;
                                    Criteria cr5 = PatientComplaintsConnection.session.createCriteria(CdaComplaints.class);
                                    cr5.add(Restrictions.eq("pid", Long.parseLong(pid)));
                                    ArrayList<CdaComplaints> compal = (ArrayList<CdaComplaints>) cr5.list();
                                    if (compal.size() != 0) {
                                        for (int i = 0; i < compal.size(); i++) {

                                            comp1 = compal.get(i);
                                %>
                                <tbody>
                                    <tr id="a">
                                        <td><%=comp1.getCompDate()%></td>
                                        <td style="max-width:100px; word-wrap:break-word;"><%=pt1.getPAddress()%></td>
                                        <td><%=comp1.getMedicine()%></td>
                                        <td><%=comp1.getAmount()%></td>

                                        <td class="col-sm-1">
                                            <form action="EditComplaint.jsp?complaintid=<%= comp1.getCompid()%>" method="post">
                                                <button type="submit" class="btn btn-success">
                                                    Edit
                                                </button>
                                            </form>
                                        </td>
                                        <td class="col-sm-1"><button type="button" date="<%= comp1.getCompDate()%>" pname="<%= pt1.getPName()%>" contact="<%= pt1.getPContact()%>" complaints="<%= comp1.getComplaints()%>" id="<%= comp1.getCompid()%>" class="btn btn-primary view<%= comp1.getCompid()%>" role="button" data-toggle="modal" data-target="#login-modal">View  </button></form></td>
                                        <td class="col-sm-1">  <button type="button" class="btn btn-danger" data-href="DeleteComplaintServ?id=<%= comp1.getCompid()%>&pid=<%= pt1.getId()%>" data-toggle="modal" data-target="#confirm-delete">
                                                Delete 
                                            </button></td>
                                    </tr>
                                </tbody>
                                <%}
                                  } else {%>
                                <script> window.location = "AddComplaints.jsp?pid=" + <%=pt1.getId()%></script>
                                <% }%> 

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
                        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header" align="center">
                                        Complaints
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        </button>
                                    </div>

                                    <div class="modal-body">

                                        <table class="table table-striped table-bordered">

                                            <tr>
                                                <td>Date</td>
                                               
                                                <td id="compdate"  ></td>
                                            </tr>
                                            <tr>
                                                <td>Name</td>
                                                <td id="compname"></td>
                                            </tr>
                                            <tr>
                                                <td>Contact</td>
                                                <td id="compcontact"></td>
                                            </tr>
                                            <tr>
                                               <td>Complaints</td>
                                                <td style="max-width:100px; word-wrap:break-word;" id="complaints">
                                                    <textarea id="showcomplaints" rows="10" cols="38" style="border-color: white; background-color: white;" disabled=""></textarea>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>

                                    <!-- End # DIV Form -->

                                </div>

                            </div>

                        </div>      
 <% LocalDate localDate = LocalDate.now();%>
                        <form action="AddComplaintsServ" method="POST">
                            <input type="hidden" name="pid" value="<%= pt1.getId()%>">
                            <input type="hidden" name="cid" value="<%= cc1.getCid()%>">
                            <div class="col-sm-2 form-group">
                                <label>Date</label> 
                                <input type="date" value="<%= DateTimeFormatter.ofPattern("yyy-MM-dd").format(localDate) %>" name="casedate" required>
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>Complaints</label>
                                <textarea placeholder="Enter Patient Complaints Here.." name="complaints" rows="10" class="form-control" required></textarea>
                            </div> 

                            <div class="col-sm-6 form-group">
                                <label>Medicines(Rx)</label>
                                <textarea placeholder="Prescribtion" name="medicine" rows="4" class="form-control" required></textarea>
                            </div>  
                            <div class="col-sm-1 form-group">
                                <label>Days</label>
                                <input type="number" placeholder="2" name="dom" class="form-control" min="1" required>
                            </div>

                            <div class="col-sm-12"></div>
                            <div class="col-sm-2 form-group">
                                <label>Amount</label>
                                <input type="number" id="amount" name="amount" class="form-control" required="">
                            </div> 
                            <div class="col-sm-2 form-group">
                                <label>Paid</label>
                                <input type="number" name="paid" id="paid" class="form-control" required="">
                            </div> 

                            <div class="col-sm-2 form-group">
                                <label>Unpaid</label>
                                <input type="number" id="unpaid" name="unpaid" value="0" class="form-control" readonly>
                            </div> 
                             <div class="col-sm-2 form-group">
                                <label>Deposit</label>
                                <input type="number" id="deposit" name="deposit" value="0" class="form-control" readonly>
                            </div> 
                            <div class="col-sm-12 form-group">
                                <button type="submit" class="btn btn-success">Save</button>      
                            </div>
                        </form> 
                    </div>  
                </div>

            </div>
        </div>

        <script type="text/javascript">
            <%
                CdaComplaints comp2 = null;
                Criteria cr6 = PatientComplaintsConnection.session.createCriteria(CdaComplaints.class);
                cr6.add(Restrictions.eq("pid", Long.parseLong(pid)));
                ArrayList<CdaComplaints> compal1 = (ArrayList<CdaComplaints>) cr6.list();
                for (int i = 0; i < compal1.size(); i++) {
                    comp2 = compal1.get(i);
            %>
            $(".view<%= comp2.getCompid()%>").click(function() {
                //var compid = $(".view").attr("id");
                var compdate = $(".view<%= comp2.getCompid()%>").attr("date");
                var pname = $(".view<%= comp2.getCompid()%>").attr("pname");
                var compcontact = $(".view<%= comp2.getCompid()%>").attr("contact");
                var complaints = $(".view<%= comp2.getCompid()%>").attr("complaints");
                //alert(pname);
                //alert(compdate);
                $("#compdate").text(compdate);
                $("#compname").text(pname);
                $("#compcontact").text(compcontact);
                $("#showcomplaints").val(complaints);
            });
            <% } %>
            <%
                Query query1 = PatientComplaintsConnection.session.createQuery("FROM CdaComplaints WHERE pid=" + pid + " ORDER BY compid DESC");
                ArrayList<CdaComplaints> al3 = (ArrayList<CdaComplaints>) query1.list();
                if(al3.size()!=0){
                CdaComplaints comp = al3.get(0);
            %>
            var unpaid = <%= comp.getUnpaid()%>;
            var deposit = <%= comp.getDeposit()%>;
            $("#amount").focus(function(){
               $("#amount").val("");
               $("#paid").val(0);
               $("#unpaid").val(<%= comp.getUnpaid() %>);
               $("#deposit").val(<%= comp.getDeposit()%>);
            });
                    <%}else{
                   %>
               window.location = "AddComplaints.jsp?pid=" + <%=pt1.getId()%>  
            <% 
                }%>
            $("#unpaid").val(unpaid);
            $("#deposit").val(deposit);
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
                if(+paid == ""){
                    $("#paid").val(0);
                }
                if (+paid > +amount)
                {
                     var deposit1 = +paid - +amount;
                    $("#deposit").val(deposit1);
                    $("#unpaid").val(0);
                }
                else
                {
                    // var deposit1 = +amount - +paid;
                    $("#deposit").val(0);
                    var unpaid = amount - paid;
                    $("#unpaid").val(unpaid);
                }
            });
            
        </script>    
         <script>
        $('#confirm-delete').on('show.bs.modal', function(e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
        });
    </script>
    <%
         }
         finally{
             PatientComplaintsConnection.Close();
         }
    %>