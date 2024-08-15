<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendor Login</title>
       
        <%@include file="Header.jsp" %>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>

            function vendorlogin()
            {
                var email = document.getElementById("Email").value;
                var password = document.getElementById("Password").value;
                //alert("abc");
if (email === "" || password === "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Fill all the fields properly !'
                    });
                }  else if (email.indexOf("@") === -1)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter Email in Proper Format !'
                    });
                }  
                  
                else
                {
                
                var formdata = new FormData();


                formdata.append("email", email);
                formdata.append("password", password);
                
                var url = "./vendor_login";

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
                                text: 'Signed In successfully!'
                            }).then(function () {
                                window.location = "vendor_index.jsp";
                            });
                } else {
                    Swal.fire({
                                icon: 'error',
                                title: 'Failed',
                                text: 'Sign In Failed'
                            }).then(function () {
                                window.location = "vendor_login.jsp";
                            });
                }
            }

        </script>

    </head>
    <body>
        <section class="app" id="appointment">
            <div class="test_agile_info py-5" style="height:100vh">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <a href="index.jsp">   <i class="fas fa-home"></i></a>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">VENDOR LOGIN</h3>
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
                                
                                <input class="btn btn-success"   type="button" onclick="vendorlogin()" value="LOGIN" style="width: 100%;" >
                            </div>
                        </form>
                         <div style=" margin: 40px; text-align: center">
                             <a href="vendor_sign_up.jsp"><article><b>Not Registered? SignIn here!</b></article></a>
        </div>
                    </div>

                </div>
            </div>
        </section>
    </body>
</html>
