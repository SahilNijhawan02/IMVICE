<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
       
        <%@include file="Header.jsp" %>

        <script>

            function adminlogin()
            {
                var email = document.getElementById("Email").value;
                var password = document.getElementById("Password").value;
                //alert("abc");

//                alert(email);
//                alert(password);
//                
                var formdata = new FormData();

                formdata.append("email", email);
                formdata.append("password", password);
                
                var url = "./admin_login";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsHtml(ans));
            }

            function renderAsHtml(ans)
            {
               // alert(ans);
                if (ans == "success") {
                   Swal.fire({
                                icon: 'Success',
                                title: 'Done...',
                                text: 'Logged In successfully!'
                            })
                            .then(function () {
                                window.location = "admin_index.jsp";
                            });
                } else {
                    Swal.fire({
                                icon: 'error',
                                title: 'Failed',
                                text: 'Sign In Failed'
                            }).then(function () {
                                window.location = "admin_login.jsp";
                            });
                }
            }

        </script>

    </head>
    <body>
        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5" style="height:100vh">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <a href="index.jsp"> <i class="fas fa-home"></i> </a>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">ADMIN LOGIN</h3>
                    </div>
                    
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                
                                <div class="form-group">
                                    <input class="form-control" type="email" id="Email" placeholder="Email" required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="password" id="Password" placeholder="Password" required="">
                                </div>
                                
                                <input class="btn btn-success"   type="button" onclick="adminlogin()" value="LOGIN" style="width: 100%;" >
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </section>
    </body>
</html>
