<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Edit User Profile</title>
        <%@include file="Header.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>

            <%
                String email=(String)session.getAttribute("useremail");
            %>
                
             var vem="<%=email%>";
            function getuserdata()

            {    
               // alert("getworkingdata");
                var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                        renderAsHTML(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./getuserdata?email=" + vem, true);

                //step3
                xhttp.send();


            }

           function renderAsHTML(t)
            {
                //alert("getuserdata");
                var ans = "";
                var obj = JSON.parse(t);
                var arr = obj["ans"];
                console.log(arr);
                var obj = arr[0];

                document.getElementById("name").value = obj.username;
                document.getElementById("email").value = obj.email;
                
                document.getElementById("ph").value = obj.phoneno;
            }

          function user_edit_profile()
          {
             // alert("user_edit_profile working");
              var name=document.getElementById("name").value;
              var ph =document.getElementById("ph").value;
              
            //  alert(name);
            //  alert(ph);
              
              
               var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                       // alert(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./user_edit_profile?email="+vem+"&name="+name+"&phoneno="+ph+" ", true);

                //step3
                xhttp.send();
                
                Swal.fire({
                                icon: 'success',
                                title: 'Done',
                                text: 'Successfully!'
                            });
              
          }

        </script>

    </head>
    <body onload="getuserdata()">
<%@include file="Navbar3.jsp"%>
        <section class="appointment" id="appointment" >
         
            <div class="test_agile_info py-5" style="background-size: cover; height: 110vh;">
                <div class="container py-lg-3" >
                    <div class="heading text-center">
                        <br><br><br>
                        <a href="index.jsp"><i class="fas fa-home"></i></a>
                        
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase" >Edit your Profile</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                
                                
                                
                                 <div class="form-group">
                                     <input class="form-control" type="email"  id="email" placeholder="Email" required="" readonly="">
                                </div>
                                
                                <div class="form-group">
                                    <input class="form-control" type="text"  id="name" placeholder="Username" required="">
                                </div>
                               


                                <div class="form-group">
                                    <input class="form-control" type="text"  id="ph" placeholder="Phone Number" required="">
                                </div>



                                



                            </div>
                            <div style="text-align: center">
                            <input class="btn btn-primary" type="button" value="Edit Profile" onclick="user_edit_profile()" style="width: 50%">
                            </div>
                    </div>
                        </form>
                    </div>
                </div>
            </div>

          
        </section>
        
    </body>
</html>