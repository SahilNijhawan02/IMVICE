<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User SignUp</title>
       
        <%@include file="Header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>

            function userSignup()
            {
                var un = document.getElementById("UserName").value;
                var em = document.getElementById("Email").value;
                var pw = document.getElementById("Password").value;
                var cpw = document.getElementById("ConfirmPassword").value;
                var f1 = document.getElementById("Photo").files[0];
                var ph = document.getElementById("PhoneNo").value;
                //alert("abc");

                
                var formdata = new FormData();
                if (un === "" || ph === "" || em === "" || pw === "" || cpw=== "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Fill all the fields !'
                    });
                } else if (ph.length !== 10)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter the Phone Number Properly !'
                    });
                } else if (em.indexOf("@") === -1)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter Email in Proper Format !'
                    });
                } else if (document.getElementById("Photo").files.length[0])
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Select the Display Picture !'
                    });
                } else if (pw !== cpw)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Password & Confirm Passowrd do not match !'
                    });
                }  else
                {
                formdata.append("un", un);
                formdata.append("em", em);
                formdata.append("pw", pw);
                formdata.append("cpw", cpw);
                formdata.append("f1", f1);
                formdata.append("ph", ph);

                var url = "./userSignup";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsHtml(ans));
            }
        }

            function renderAsHtml(ans)
            {
                if (ans == "success") {
                    Swal.fire({
                                icon: 'Success',
                                title: 'Done...',
                                text: 'Signed Up successfully!'
                            }).then(function () {
                                window.location = "login.jsp";
                            });
                } else {
                    Swal.fire({
                                icon: 'error',
                                title: 'Failed',
                                text: 'Sign Up Failed'
                            }).then(function () {
                                window.location = "USER_SIGN_UP.jsp";
                            });
                }
            }

        </script>

    </head>
    <body>
        <section class="app" id="appointment">
            <div class="test_agile_info py-5" style="height:110vh">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <a href="index.jsp"> <i class="fas fa-home"></i></a>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">USER SIGN UP</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                <div class="form-group">
                                    <input class="form-control" type="text" id="UserName" placeholder="Username" required="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="email" id="Email" placeholder="Email" required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="password" id="Password" placeholder="Password" required="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="password" id="ConfirmPassword" placeholder="Confirm Password" required="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="file" id="Photo" placeholder="Choose Photo" required="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" id="PhoneNo" placeholder="Phone Number" required="">
                                </div>

                                <input class="btn btn-success"   type="button" onclick="userSignup()" value="SIGN UP" style="width: 100%;" >
                            </div>
                        </form>
                         <div style=" margin: 40px; text-align: center">
                             <a href="login.jsp"><article><b>Already Registered? SignIn here!</b></article></a>
        </div>
                    </div>

                </div>
            </div>
            
        </section>
       
    </body>
</html>
