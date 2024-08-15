<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Edit Profile</title>
        <%@include file="Header.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>

            <%
                String vendoremail=(String)session.getAttribute("Vendor_Email");
            %>
                
             var vem="<%=vendoremail%>";
            function getvendordata()

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
                xhttp.open("GET", "./getvendordata?email=" + vem, true);

                //step3
                xhttp.send();


            }

           function renderAsHTML(t)
            {
               // alert("getrenderdata");
                var ans = "";
                var obj = JSON.parse(t);
                var arr = obj["ans"];
                console.log(arr);
                var obj = arr[0];

                document.getElementById("name").value = obj.Vendor_Name;
                document.getElementById("email").value = obj.Vendor_Email;
                document.getElementById("description").value = obj.Desc;
                document.getElementById("slot_amount").value = obj.slot_amount;
            }

          function vendor_edit_profile()
          {
             // alert("vendor_edit_profile working");
              var name=document.getElementById("name").value;
              var description =document.getElementById("description").value;
              var slot_amount=document.getElementById("slot_amount").value;
              
               var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                       // alert(ans);
                        Swal.fire({
                        icon: 'Success',
                        title: 'Done...',
                        text: 'Edited Successfully !'
                    });

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./vendor_edit_profile?email="+vem+"&name="+name+"&description="+description+"&slot_amount="+slot_amount+"", true);

                //step3
                xhttp.send();
              
          }

        </script>

    </head>
    <body onload="getvendordata()">

        <section class="appointment" id="appointment">
         
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-home"></i>
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
                                    <input class="form-control" type="text"  id="description" placeholder="Your description" required="">
                                </div>



                                <div class="form-group">
                                    <input class="form-control" type="text"  id="slot_amount" placeholder="slot_amount" required="">
                                </div>



                            </div>
                            <div style="text-align: center">
                            <input class="btn btn-primary" type="button" value="Edit Profile" onclick="vendor_edit_profile()" style="width: 50%">
                            </div>
                    </div>
                        </form>
                    </div>
                </div>
            </div>

           
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>