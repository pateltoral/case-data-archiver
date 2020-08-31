<%-- 
    Document   : AddPatient
    Created on : Mar 27, 2017, 8:54:13 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header_login.jsp" %>
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
    </head>
    <body> 
        <div class="container">

            <div class="col-lg-12 well">
                <div class="row">

                    <form id="msform" action="" method="POST"> 

                        <h2 class="fs-title">Select Logo </h2>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <span class="btn btn-default btn-file" style="margin-top:-8px">
                                        Browse   <input type="file" name="xyc">
                                    </span>
                                </span>
                                <input type="text" class="form-control" readonly>
                            </div>
                            <img id='img-upload'/>
                        </div>
                        <input type="text" name="name" placeholder="Change Site Name" />
                        <input type="button" name="update" class="update action-button" value="Update" />
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

