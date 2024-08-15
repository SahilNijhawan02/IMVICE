<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Manage Service</title>
       
        <%@include file="Header.jsp" %>

        <script>

            function AddServices()
            {
                var sn = document.getElementById("servname").value;
                var desc = document.getElementById("desc").value;
                var f1=  document.getElementById("f1").files[0];
               
                var formdata = new FormData();


                formdata.append("sn", sn);
                formdata.append("desc", desc);
                formdata.append("photo", f1);
                
                var url = "./admin_manageservice";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsHtml(ans));
            }

            function renderAsHtml(ans)
            {
                if (ans == "success") {
                    Swal.fire({
                                icon: 'Success',
                                title: 'Done...',
                                
                            });
                    
                } else {
                    Swal.fire({
                                icon: 'error',
                                title: 'Failed...',
                                
                            });
                }
            }
            
            function showservices()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();

                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ans = "";

                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<div class=\"row ml-2\" >";
                                
                                ans = ans + "<div class=\"col-sm-3\" >";
                                ans = ans + "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;\" src=\'"+st.photo+"\' >";
                                ans = ans + "</div>";
                                
                                ans = ans + "<div class= \"col-sm-6\" >";
                                ans = ans + "<div class=\"card-body\">";
                                ans = ans + "<label class=\"card-text\" style=\"font-size: 25px\" >Service : " + st.servicename + "</label><br><br>";
                                ans = ans + "<label class=\"card-text\" style=\"font-size: 25px\" >Description : " + st.desc + "</label>";
                                ans = ans + "</div>";
                                ans = ans + "</div>";
                                
                                ans = ans + "<div class= \"col-sm-3\" >";
                                ans = ans + "<input type=\"button\" value=\"Delete Service\" class=\"btn btn-dark\" onclick=\"deleteservice('"+st.id+"')\" ><br><br>";
                                ans = ans + "<input type=\"button\" value=\"Manage Sub Service\" class=\"btn btn-dark\" onclick=\"managesubservices('"+st.id+"')\" >";
                                ans = ans + "</div>";
                                
                            ans = ans + "</div>";
                            ans = ans + "<br>";
                            ans = ans + "<hr>";
                        }
                        document.getElementById("showservice").innerHTML = ans ;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./show_services_servlet", true);

                //3. Send Request
                xhttp.send();
            }
            
            function deleteservice(id)
            {
                //1. Make object of XMLHttpRequest
                    var xhttp = new XMLHttpRequest();

                    //4. Receive XMLHttpResponse from server & use ans

                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            var res = this.responseText;
                            res = res.trim();

                            if (res == "success")
                            {
                                showservices();
                            } else
                            {
                                Swal.fire({
                                icon: 'error',
                                title: 'Error while deleting...',
                                
                            });
                            }
                        }
                    };
                    //2. Prepare request (Define target --> servlet)
                    xhttp.open("POST", "./delete_services_servlet?serviceid="+id, true);

                    //3. Send Request
                    xhttp.send();
            }
            
            function managesubservices(id)
            {
                window.location.href="admin_manage_subservice.jsp?serviceid="+id;
            }

        </script>

    </head>
    <body onload="showservices()">
        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5" style="height:100vh">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase"> Add New Services</h3>
                    </div>
                    
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                
                                <div class="form-group">
                                    <input class="form-control" type="text" id="servname" placeholder="Service Name" required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="text" id="desc" placeholder="Description" required="">
                                </div>
                                
                                <div class="form-group">
                                    <input class="form-control" type="file" id="f1" placeholder="Photo" required="">
                                </div>
                                
                                <input class="btn btn-success"   type="button" onclick="AddServices()" value="ADD SERVICES" style="width: 100%;" >
                            
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </section>
        <br><br>
        <h1 style="text-align: center"><strong><u>ALREADY ADDED SERVICES</u></h1></strong>
        
        <hr>
        <div id="showservice">
            
        </div>
    </body>
</html>