<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Change Password</title>
        <%@include file="Header.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>

            <%
                String email=(String)session.getAttribute("useremail");
            %>
                 var em="<%=email%>";
          
          function user_change_password()
          {
              
             // alert("user_change_password_working");
             
              var oldpassword= document.getElementById("oldpassword").value ;
               var newpassword= document.getElementById("newpassword").value;
               var confirmnewpassword= document.getElementById("comfirmnewpassword").value;
               
               if(newpassword!==confirmnewpassword){
//                   alert("new password and confirm new password not matching!");
                            Swal.fire({
                                icon: 'error',
                                title: 'new password and confirm new password not matching!',
                                
                            });
               }
              
               else{
              
               var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                       // alert(ans);
                       if(ans== "successfull")
                       {
                           Swal.fire({
                                icon: 'Success',
                                title: 'Done',
                                title: 'Password Changed Successfully!'
                                
                            }).then(function () {
                                window.location = "login.jsp";
                            });
              
                       }
                       else
                       {
                         Swal.fire({
                                icon: 'error',
                                title: 'failed',
                                title: 'Password not Changed!'
                                
                            });
                       }

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./user_change_password?email="+em+"&oldpassword="+oldpassword+"&newpassword="+newpassword, true);

                //step3
                xhttp.send();
                
//                Swal.fire({
//                                icon: 'Success',
//                                title: 'Done',
//                                title: 'Password Changed Successfully!'
//                                
//                            });
              
        }
              
          }
        </script>

    </head>
    <body >


     
        <div>
        <section class="app" id="appointment" style="height: 100vh">
          
            <div class="test_agile_info py-5" style="height: 100vh">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase" >Change Your Password</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                
                                
                                
<!--                                 <div class="form-group">
                                     <input class="form-control" type="email"  id="email" placeholder="Email" required="" >
                                </div>-->
                                
                                <div class="form-group">
                                    <input class="form-control" type="password"  id="oldpassword" placeholder="Old Password" required="">
                                </div>
                               


                                <div class="form-group">
                                    <input class="form-control" type="password"  id="newpassword" placeholder="New Password" required="">
                                </div>
                                
                                 <div class="form-group">
                                    <input class="form-control" type="password"  id="comfirmnewpassword" placeholder=" Confirm New Password" required="">
                                </div>



                               



                            </div>
                            <div style="text-align: center">
                            <input class="btn btn-primary" type="button" value="Edit Profile" onclick="user_change_password()" style="width: 50%">
                            </div>
                            </div>
                        </form>
                    </div>
                </div>
            

         
        </section>
        </div>
    </body>
</html>