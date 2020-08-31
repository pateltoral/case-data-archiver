<%-- 
    Document   : edit_profile
    Created on : 19 Apr, 2017, 8:51:04 PM
    Author     : kushal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@include file="header_breadcrumbs.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/jquery-3.1.1.min.js"></script>
        <style>
            .btn-file {
                position: relative;
                overflow: hidden;
            }
            .btn-file input[type=file] {
                position: absolute;
                top: 0;
                right: 0;
                min-width: 100%;
                min-height: 100%;
                font-size: 100px;
                text-align: right;
                filter: alpha(opacity=0);
                opacity: 0;
                outline: none;
                background: white;
                cursor: inherit;
                display: block;
            }

            #img-upload{
                width: 100%;
            }
        </style>
    <%
//            Connect conn = new Connect();
//            Criteria cr= conn.session.createCriteria(CdaDoctor.class);
//            cr.add(Restrictions.eq("email",request.getParameter("email")));
//            cr.add(Restrictions.eq("password",request.getParameter("password")));
//            ArrayList<CdaDoctor> al=(ArrayList<CdaDoctor>)cr.list();
//            
        //System.out.println(al);
    CdaDoctor doc = (CdaDoctor) session.getAttribute("name");
    
    %>
    <body>
        <div class="container">
            <div class="row">
                <!-- left column -->
                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <form class="form-horizontal" role="form" action="DoctorEditProfile" method="POST">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="name" value="<%= doc.getName()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">E-mail:</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="email" name="email" value="<%= doc.getEmail()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Password</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="password" value="<%= doc.getPassword()%>">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Mobile No</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="number" name="contact" value="<%= doc.getContact()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Address</label>
                            <div class="col-lg-8">
                                <textarea class="form-control" rows="5" id="comment" name="address"><%= doc.getAddress()%></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Select Type Of Practice</label>
                            <div class="col-lg-8">
                                <div class="ui-select">
                                    <select name="practicetype" class="form-control" id="typeOfPractice" style="margin-bottom:11px;" value="<%= doc.getPracticeType()%>">
                                        <script>
                                            $(document).ready(function(){
                                               $("#typeOfPractice").val("<%= doc.getPracticeType()%>"); 
                                            });
                                        </script>
                                        <option value="Homoeopathy practice">Homoeopathy practice</option>
                                        <option value="Allopathy practice">Allopathy practice</option>
                                        <option value="General practice">General practice</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">General Register Number:</label>
                            <div class="col-md-8">
                                <input class="form-control" name="grno" type="text" value="<%= doc.getGrno()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Add frequent Symptoms for complaints</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="sym" placeholder="Add Frequent symptoms for complaints">
                            </div>
                            <input type="button" class="btn btn-success" id="addthis" value="+">
                            <div class="col-md-8">
                                <br>
                                <textarea class="form-control" id="showsym" name="symptoms" rows="5"><%= doc.getFreqSymptoms()%></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-8">
                                <input type="submit" class="btn btn-success" value="Save Changes">
                                <span></span>
                                <input type="reset" class="btn btn-success" value="Cancel">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <hr>
    </body>
</html>
<script>
    $(function () {
        
              $("#breadcrums_1st").text("Patient Complaints");
              $("#breadcrums_2nd").text("<%= doc.getName()%>");
              
        $("#addthis").click(function () {
            //alert(1);
            var textarea_val = $("#showsym").val();
            //alert(textarea_val);
            if (textarea_val == "") {
                $("#showsym").val($("#sym").val());
                $("#sym").val("");
            }
            else
            {
                $("#showsym").val(textarea_val + "," + $("#sym").val());
                $("#sym").val("");
            }

        });

    });
</script>