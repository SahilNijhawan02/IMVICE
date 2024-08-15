
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%
            String vendoremail = request.getParameter("vendor_Email");
        %>
        
<!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no" />
        <title>Plomberie - A Plumber HTML Template</title>
        <meta name="author" content="Mannat Studio">
        <meta name="description" content="Plomberie is a Responsive HTML5 Template for plumbing company, repair, maintenance, roofing, handyman or any other type of plumbing service.">
        <meta name="keywords" content="Plomberie, responsive, html5, air condition, cleaning, handyman, hvac, maintenance, plumber, plumber service, plumbing, Plumbing Service, repair, repair service, roofing">

        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

        <link href="css/base.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/fonts/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/css/navigation.css">

        <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>-->

        <title>Vendor Bookings</title>

        <script>

            function showslots()
            {
                

                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                       // alert(res);
                        var arr = JSON.parse(res).ans;
                        var ans = "";
                        var ans2 = "";
                        
                        for(var i=0;i<arr.length;i++)
                        {
                            var singleobj = arr[i];
                            if (singleobj.status == "Pending")
                            {
                                ans += "<div  style=\"text-align: center; padding-left: 30px;\" class=\"row\" >";
                                
                                ans += "<div class=\"col-sm-4\" style=\"text-align: center\" >";
                                ans += "<div class=\"row\"><lable style=\"font-size: 15px;\" >Customer Email: " + singleobj.useremail + "</lable></div><br>";
                                ans += "<div class=\"row\" ><lable style=\"font-size: 15px;\" >Booked Slot Date : " + singleobj.date + "</lable></div>";
                                ans += "</div>";
                                
                                ans += "<div class=\"col-sm-5\" style=\"text-align: center\" >";
                                ans += "<div class=\"row\"><lable style=\"font-size: 15px;\" >Total Price : " + singleobj.totalprice + "</lable></div><br>";
                                ans += "<div class=\"row\" ><lable style=\"font-size: 15px;\" >Mode of payment : " + singleobj.paymenttype + "</lable></div>";
                                ans += "</div>";
                                
                                ans += "<div class=\"col-sm-3\" style=\"text-align: center\" >";
                                ans += "<input type=\"button\" value=\"Approve\" class=\"btn btn-success\" onclick=\"approveslot(" + singleobj.bookingid + ")\" >";
                                ans += "</div>";
                                
                                ans += "</div><br><hr>";
                            }
                            else
                            {
                                ans2 += "<div  style=\"text-align: center; padding-left: 30px;\" class=\"row\" >";
                                
                                ans2 += "<div class=\"col-sm-4\" style=\"text-align: center\" >";
                                ans2 += "<div class=\"row\"><lable style=\"font-size: 15px;\" >Customer Email : " + singleobj.useremail + "</lable></div><br>";
                                ans2 += "<div class=\"row\" ><lable style=\"font-size: 15px;\" >Booked Slot Date : " + singleobj.date + "</lable></div>";
                                ans2 += "</div>";
                                
                                ans2 += "<div class=\"col-sm-5\" style=\"text-align: center\" >";
                                ans2 += "<div class=\"row\"><lable style=\"font-size: 15px;\" >Total Price : " + singleobj.totalprice + "</lable></div><br>";
                                ans2 += "<div class=\"row\" ><lable style=\"font-size: 15px;\" >Mode of payment : " + singleobj.paymenttype + "</lable></div>";
                                ans2 += "</div>";
                                
                                ans2 += "<div class=\"col-sm-3\" style=\"text-align: center\" >";
                                ans2 += "<input type=\"button\" value=\"Cancle\" class=\"btn btn-danger\" onclick=\"pendingslot(" + singleobj.bookingid + ")\" >";
                                ans2 += "</div>";
                                
                                ans2 += "</div><br><br><br><hr>";
                            }
                        }
                        document.getElementById("approved").innerHTML = ans;
                        document.getElementById("pending").innerHTML = ans2;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("Get", "./show_vendorslots_servlet", true);

                //3. Send Request
                xhttp.send();
            }
            
            function approveslot(bookingid)
            {
                var xhttp = new XMLHttpRequest();
                //4. Receive XMLHttpResponse from server & use ans
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {

                        var res = this.responseText;
                        res = res.trim();
                        console.log(res);

                        if (res == "success")
                        {
                            showslots();
                        } else
                        {
                            //alert("Error occured");
                            Swal.fire({
                                icon: 'error',
                                title: 'Error Occured'
                                
                            });
                        }
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./approvedslot_servlet?bookingid=" + bookingid, true);
                //3. Send Request
                xhttp.send();
            }
            
            function pendingslot(bookingid)
            {
                var xhttp = new XMLHttpRequest();
                //4. Receive XMLHttpResponse from server & use ans
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {

                        var res = this.responseText;
                        res = res.trim();
                        console.log(res);

                        if (res == "success")
                        {
//                            window.location.href = "manageslots.jsp";
showslots();
                        } else
                        {
                           // alert("Error occured");
                           Swal.fire({
                                icon: 'error',
                                title: 'Error Occured...'
                                
                            });
                        }
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./pendingslot_servlet?bookingid=" + bookingid, true);
                //3. Send Request
                xhttp.send();
            }

        </script>

    </head>

    <body onload="showslots()" >    
        
        <%@include file="Header.jsp"%>
        
        
        <div class="container text-center text-success" ><br>
            <div style="border: 2px solid black; border-radius: 10px;margin: 40px;margin-left: 50px;margin-right: 50px ;background-color: white; padding: 5px" >
                <h1>Pending Slots</h1><br>
                
                <div id="approved" >
                    
                </div>
                
            </div>
            
            <br>
            
            <div style="border: 2px solid black; border-radius: 10px;margin: 40px;margin-left: 50px;margin-right: 50px ;background-color: white; padding: 5px" >
                <h1>Approved Slots</h1><br>
                
                <div id="pending" >
                    
                </div>
                
            </div>
        </div>

        <%@include file="footer.jsp" %>%>

    </body>
</html>