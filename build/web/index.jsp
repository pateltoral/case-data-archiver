<%-- 
    Document   : index
    Created on : Mar 27, 2017, 7:05:31 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header_login.jsp" %>
<html>
    <head>
        <title>Case Data Archiver</title>
        <link rel="shortcut icon" href="img/logo.png" />  

        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
     
    </head>
    <body>
        <div id='msg' hidden></div>

        <!-- multistep form -->
        <form id="msform" name="msform" action="DoctorRegistration" method="POST"> 
            <%

                if (request.getAttribute("SuccessMsg") != null) {
                    String msg1 = request.getAttribute("SuccessMsg").toString();
            %>

            <h3 style="color:green;"> <%=  msg1%> &nbsp;<i class="fa fa-smile-o" aria-hidden="true"></i> </h3>
            <% }
            %>
            <ul id="progressbar">
                <li class="active">Account Setup</li>
                <li>Profile settings</li>
                <li>Personal Details</li>
            </ul>
            <fieldset class="1st">
                <h2 class="fs-title">Create your account</h2>
                <input type="text" id="name" name="name" placeholder="Name(*)"/>
                <input type="email" id="email" name="email" placeholder="Email(*)"/>
                <input type="password" id="password" name="password" placeholder="Password(*)" />
                <input type="password" id="cpassword" name="cpassword" placeholder="Confirm Password(*)" />
                <input type="button" name="next" class="next action-button" value="Next" />
                <br>
                <p class='requiredNote'>(*) indicates required feilds</p>
            </fieldset>
            <fieldset>
                <h2 class="fs-title">Profile settings</h2>
                <input type="number" id="number" name="contact" placeholder="Mobile No." />
                <textarea id="address"  rows="5" cols="8" name="address" placeholder="Address" ></textarea>
                <input type="file" id="photo" name="photo">
                <!--                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <span class="btn btn-default btn-file" style="margin-top:-8px;">
                                                Browse… <input type="file" id="imgInp">
                                            </span>
                                        </span>
                                        <input type="text" class="form-control" readonly>
                                    </div>
                                    <img id='img-upload'/>
                                </div>-->
                <!--<input id="input-1a" name="photo" type="file" class="file" data-show-preview="false">-->
                <input type="button" name="previous" class="previous action-button" value="Previous" />
                <input type="button" id="second" name="next" class="next1 action-button" value="Next" />
                <p class='requiredNote1'>(*) indicates required feilds</p>
            </fieldset>
            <fieldset>
                <h2 class="fs-title">Personal Details</h2>
                <select name="practicetype" class="form-control" id="sel1" style="margin-bottom:11px;">
                    <option>Select Type of practice</option>
                    <option>Homoeopathy practice</option>
                    <option>Allopathy practice</option>
                    <option>General practice</option>
                </select>
                <input type="number" id="grno" name="grno" placeholder="General Register Number" />
                <input type="text" id="sym" placeholder="Add Frequent symptoms for complaints" style="float:left; width:288px">
                <input type="button" id="addthis" value="+" class="button" style="width: 47px; color:white; background:#27AE60">
                <textarea id="showsym"  rows="5" cols="8" name="symptoms" ></textarea>
                <input type="button" name="previous" class="previous action-button" value="Previous" />
                <input type="submit" id="third" name="submit" class="submit action-button" value="Submit" />
                <p class='requiredNote2'>(*) indicates required feilds</p>
            </fieldset>
        </form>



    </body>
</html>  

<script>

    $(function () {

        var jsArray = new Array();
        jsArray = document.getElementsByTagName('script');
        for (i = 0; i < jsArray.length; i++)
        {
            if (jsArray[i].id)
            {
                unloadJS(jsArray[i].id)
            } else
            {
                jsArray[i].parentNode.removeChild(jsArray[i]);
            }
        }
        
//jQuery time
        var current_fs, next_fs, previous_fs; //fieldsets
        var left, opacity, scale; //fieldset properties which we will animate
        var animating; //flag to prevent quick multi-click glitches

        $("#email_login").blur(function () {
            var email_login = $("#email_login").val();
            var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
            if (!filter.test(email_login) || email_login == "")
            {
                $('#formAlert').remove();
                $("#formAlert").show();
                $(".requiredNote_login").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Email is Wrong or missing. </div>");
                $("#email_login").css("border", "1px solid red");
                $("#email_login").val("");
                return false;
            }
            else
            {
                $('#formAlert').remove();
                $("#email_login").css("border", "1px solid #CCC");
                return true;
            }
        });
        ;

        $("#password_login").blur(function (e) {
            var password_login = $("#password_login").val();
            if (password_login == "")
            {
                $('#formAlert').remove();
                $("#formAlert").show();
                $(".requiredNote_login").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a> Enter Password </div>");
                $("#password_login").css("border", "1px solid red");
                return false;
            }
            else
            {
                $('#formAlert').remove();
                $("#password_login").css("border", "1px solid #CCC");
                return true;
            }
        });


        $("#name").blur(function (e) {
            var name = $("#name").val();
            if (name == "")
            {
                $('#formAlert').remove();
                $("#formAlert").show();
                $(".requiredNote").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Please Enter Your Name </div>");
                $("#name").css("border", "1px solid red");
                return false;
            }
            else
            {
                $('#formAlert').remove();
                $("#name").css("border", "1px solid #CCC");
                return true;
            }
        });

        $("#email").blur(function () {
            var email = $("#email").val();
            var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
            if (!filter.test(email) || email == "")
            {
                $('#formAlert').remove();
                $("#formAlert").show();
                $(".requiredNote").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Email is Wrong or missing. </div>");
                $("#email").css("border", "1px solid red");
                $("#email").val("");
                return false;
            }
            else
            {
                $('#formAlert').remove();
                $("#email").css("border", "1px solid #CCC");
                return true;
            }
        });

        $("#password").blur(function (e) {
            var password = $("#password").val();
            if (password == "")
            {
                $('#formAlert').remove();
                $("#formAlert").show();
                $(".requiredNote").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Please Enter Your Password. </div>");
                $("#password").css("border", "1px solid red");
                return false;
            }
            else
            {
                $('#formAlert').remove();
                $("#password").css("border", "1px solid #CCC");
                return true;
            }
        });

        $("#cpassword").blur(function (e) {
            var cpassword = $("#cpassword").val();
            if (cpassword == "")
            {
                $('#formAlert').remove();
                $("#formAlert").show();
                $(".requiredNote").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Please Enter Password again. </div>");
                $("#cpassword").css("border", "1px solid red");
                return false;
            }
            else
            {
                $('#formAlert').remove();
                $("#cpassword").css("border", "1px solid #CCC");
                return true;
            }
        });

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

        $(".next").click(function (e) {

            var name = $("#name").val();
            var email = $("#email").val();
            var password = $("#password").val();
            var cpassword = $("#cpassword").val();
            var number = $("#number").val();
            var address = $("#address").val();
            var photo = $("#photo").val();

            if (name == "" || email == "" || password == "" || cpassword == "")
            {
                if (name == "") {
                    $("#name").css("border", "1px solid red");
                }
                if (email == "") {
                    $("#email").css("border", "1px solid red");
                }
                if (password == "") {
                    $("#password").css("border", "1px solid red");
                }
                if (cpassword == "") {
                    $("#cpassword").css("border", "1px solid red");
                }
                $('#formAlert').remove();
                $("#formAlert").show();
                $(".requiredNote").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Please fill all the required fields.</div>");
                return false;
            }

            if (password != cpassword)
            {
                $('#formAlert').remove();
                $("#cpassword").css("border", "1px solid red");
                $("#formAlert").show();
                $(".requiredNote").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Password Does not match.</div>");
                return false;
            }

            if (animating)
                return false;
            animating = true;

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();

            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({'transform': 'scale(' + scale + ')'});
                    next_fs.css({'left': left, 'opacity': opacity});
                },
                duration: 0,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });

        $("#second").click(function (e) {
            //alert('clicked');
            var number = $("#number").val();
            var address = $("#address").val();
            var photo = $("#photo").val();

            if (number == "" || address == "" || photo == "")
            {
                $('#formAlert').remove();
                $("input").css("border", "1px solid red");
                $("textarea").css("border", "1px solid red");
                $("#formAlert").show();
                $(".requiredNote1").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Please fill all the required fields.</div>");
                return false;
            }

            if (animating)
                return false;
            animating = true;

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();

            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({'transform': 'scale(' + scale + ')'});
                    next_fs.css({'left': left, 'opacity': opacity});
                },
                duration: 0,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });

        $("#third").click(function (e) {
            //alert('clicked');
            var grno = $("#grno").val();
            var sel1 = $("#sel1").val();

            if (grno == "" || sel1 == "")
            {
                $('#formAlert').remove();
                $("input").css("border", "1px solid red");
                $("textarea").css("border", "1px solid red");
                $("#formAlert").show();
                $(".requiredNote2").after("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Warning!</strong> Please fill all the required fields.</div>");
                return false;
            }

            if (animating)
                return false;
            animating = true;

            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();

            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({'transform': 'scale(' + scale + ')'});
                    next_fs.css({'left': left, 'opacity': opacity});
                },
                duration: 0,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });

        $(".previous").click(function () {

            $("#formAlert").remove();
            $("input").css("border-color", "#CCC");

            if (animating)
                return false;
            animating = true;

            current_fs = $(this).parent();
            previous_fs = $(this).parent().prev();

            //de-activate current step on progressbar
            $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

            //show the previous fieldset
            previous_fs.show();
            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale previous_fs from 80% to 100%
                    scale = 0.8 + (1 - now) * 0.2;
                    //2. take current_fs to the right(50%) - from 0%
                    left = ((1 - now) * 50) + "%";
                    //3. increase opacity of previous_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({'left': left});
                    previous_fs.css({'transform': 'scale(' + scale + ')', 'opacity': opacity});
                },
                duration: 0,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });
    });
</script>
<%
    if (request.getAttribute("msg") != null) {
%>
<script>
    $(function () {
        $("#msform").prepend("<div id='formAlert' class='alert alert-danger'><a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a><strong>Invalid Email-ID and Password !</strong> </div>");
        return false;
    });
</script> 
<%
    }
%>
