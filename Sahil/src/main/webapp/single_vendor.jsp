<html>
    <head>
        
        <style>


            .img-hover-zoom--colorize{
                position: relative;
            }
            .img-hover-zoom--colorize:before {
                border-bottom: 2px solid #eee;
                border-right: 2px solid #eee;
                content: "";
                display: inline-block;
                left: 15px;
                position: absolute;
                right: 15px;
                top: 15px;
                bottom: 15px;
                z-index: 1;
            }
            .img-hover-zoom--colorize:after {
                border-top: 2px solid #eee;
                border-left: 2px solid #eee;
                content: "";
                display: inline-block;
                left: 15px;
                position: absolute;
                right: 15px;
                top: 15px;
                bottom: 15px;
                z-index: 1;
            }

            .img-hover-zoom--colorize img {
                transition: transform 0.5s, filter 1.5s ease-in-out;
                filter: grayscale(100%);
            }

            /* The Transformation */
            .img-hover-zoom--colorize:hover img {
                filter: grayscale(0);
                transform: scale(1.4);
            }
            /*            .img-hover-zoom {
              height: 300px;  [1.1] Set it as per your need 
              overflow: hidden;  [1.2] Hide the overflowing of child elements 
            }
            
             [2] Transition property for smooth transformation of images 
            .img-hover-zoom img {
              transition: transform .5s ease;
            }
            
             [3] Finally, transforming the image when container gets hovered 
            .img-hover-zoom:hover img {
              transform: scale(1.5);
            }*/
                    </style>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Single Vendors</title>
        <link href="bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href=
              'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'
              rel='stylesheet'>

        <script src=
                "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" >
        </script>
<script>
            $(document).ready(function () {

                $(function () {
                    $("#my_date_picker").datepicker();
                });
            })
        </script>
        <script src=

                "https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" >
        </script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <%@include file="Header.jsp"%>
        
            <%
                String email= (String) request.getParameter("Email");
            %>
    </head>
    <script>
        var email = "<%=email%>";
        function infoaboutsinglevendor() {
            //alert("Hello");
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Typical action to be performed when the document is ready:

                    var ans = xhttp.responseText;
                    //alert(ans);
                    renderAsHTML(ans);

                }
            };

            xhttp.open("GET", "./single_vendor?email=" + email + " ", true);

            xhttp.send();

        }

        function renderAsHTML(t) {
            var ans = "";
            var obj = JSON.parse(t);
            var arr = obj["ans"];
            console.log(arr);
            var obj = arr[0];
            
            var output = "<div class=\"card\" style=\"\">";
            output += "<img  style=\"height:653px; border: 2px solid black; \" class=\"card-img-top\"  src=\"myuploads/" + obj.Photo + "\" alt=\"card1IMAGE\"/>";
            output += "<div class=\"card-body\" style=\"border: 2px solid black;\">";


            output += "<br>";
            output += "<div class=\"card-body col-sm-6\">";
            output += "<h2 style=\"color:#2471A3\" class=\"card-text\">VENDOR NAME:</h2>";
            output += "<h3 class=\"card-title\">" + obj.Vendor_Name + "</h3>";
            output += "<hr>";
            output += "</div>";

            output += "<div class=\"card-body col-sm-6\" style=\"\">";
            output += "<h2 style=\"color:#2471A3\" class=\"card-text\">Slot Amount:</h2>";
            output += "<h3 class=\"card-text\">" + obj.slot_amount + "</h3>";
            output += "<hr>";
            output += "</div>";

            output += "<div class=\"card-body col-sm-6\" style=\"\">";
            output += "<h2 style=\"color:#2471A3\" class=\"card-text\">START TIME:</h2>";
            output += "<h3 class=\"card-text\">" + obj.start_time + "</h3>";
            output += "<hr>";
            output += "</div>";

            output += "<div class=\"card-body col-sm-6\" style=\"\">";
            output += "<h2 style=\"color:#2471A3\" class=\"card-text \">END TIME:</h2>";
            output += "<h3 class=\"card-text\">" + obj.end_time + "</h3>";
            output += "<hr>";
            output += "</div>";

            output += "<div class=\"card-body col-sm-12\" style=\"\">";
            output += "<h2 style=\"color:#2471A3\" class=\"card-text\">Description:</h2>";
            output += "<h3 class=\"card-text\">" + obj.Desc + "</h3>";
            output += "<hr>";
            output += "</div>";
            
            output += "<div class=\"card-body col-sm-12\" style=\"\">";
            output += "<input type=\"button\" value=\"Book Slots\" onclick=\"fetchdetails()\" class=\"card-text form-control btn btn-success btn-lg\" >";
//           output += "<hr>";
            output += "</div>";

            output += "</div>";
            output += "</div>";
            
            var latitude = obj.latitude;
        var longitute = obj.longitude;
        document.getElementById("gmap_canvas").src = "https://maps.google.com/maps?q=" + latitude + "," + longitute + "&ie=UTF8&iwloc=&output=embed";

            document.getElementById("d1").innerHTML = output;

            //userShowPhotos(email);
            showphoto(email);

        }

//        function userShowPhotos(email)
//        {  
//            console.log(email);
//            var xhttp = new XMLHttpRequest();
//                xhttp.onreadystatechange = function () {
//                    if (this.readyState == 4 && this.status == 200) {
//                        // Typical action to be performed when the document is ready:
//
//                        var ans = xhttp.responseText;
//                        alert(ans);
//                        renderAsCollage(ans);
//
//                    }
//                };
//
//                xhttp.open("GET", "./view_pics?email="+email+" ", true);
//
//                xhttp.send();
//
//            }
//
//            function renderAsCollage(t) {
//               var ans = "";
//               var mainobj=JSON.parse(t);
//               var arr=mainobj["ans"];
//                console.log(arr);
//                for (var i = 0; i < arr.length; i++)
//                {
//                     var obj= arr[i];
//                     ans+= "<div class=\"col-sm-6\">";
//                   
//                     ans+= "<img src=\"myuploads/"+obj.photo+"\"   class=\"img-thumbnail\" alt=\"vendorworkIMAGEs\"/>";
//                     ans+= "</div>";
//                     
//                }
//               
//            document.getElementById("photo").innerHTML=ans;
//            
//        }
//        

        function showphoto(email)
        {
           // alert("in1");
            var vem = "<%=email%>";
            var xhttp = new XMLHttpRequest();

            //step 4
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Typical action to be performed when the document is ready:

                    var ans = xhttp.responseText;
                    renderAsPic(ans);

                }
            };

            //prepare request Step2
            xhttp.open("GET", "./photo?email=" + vem, true);

            //step3
            xhttp.send();
           // alert("in2");
        }




        function renderAsPic(t)
        {
          //  alert("inside");

            var ans = "";
            console.log(t);
            var obj = JSON.parse(t);
            var arr = obj["ans"];
            console.log(arr);

          //  alert(arr);

            var output1 = "";
            output1 += " <div  class=\"container\" style=\"border: solid 2px black\">";
            output1 += "<br><br><br>";

            for (var i = 0; i < arr.length; i++)
            {
                output1 += "<div class=\"col-lg-4 col-sm-6 text-center\" style=\"height: 200px; width: 200px\" >";
                output1 += "<div class=\"img-hover-zoom--colorize\">";

                output1 += "<img src=" + arr[i].photo + " style=\"height: 150px; width: 150px\" class=\"img-fluid\" alt=\"IMAGE\"/>";

                output1 += "</div>";
                output1 += "</div>";
                

            }
           
            output1 += "</div>";
            document.getElementById("photo").innerHTML = output1;
            userShowRatings();
                    }




//        function fetchdetails() {
//            var date = document.getElementById("my_date_picker").value;
//            alert(date);
//            var xhttp = new XMLHttpRequest();
//            xhttp.onreadystatechange = function () {
//                if (this.readyState == 4 && this.status == 200) {
//                    // Typical action to be performed when the document is ready:
//
//                    var ans = xhttp.responseText;
//                    alert(ans);
//                    renderAstable(ans);
//                }
//            };
//
//            xhttp.open("GET", "./fetchdate?date=" + date + "&email=<%=email%>", true);
//
//            xhttp.send();
//        }
        function fetchdetails()
        {

            window.location.href = "fetchdate.jsp?email=" + email;

        }

//        var slotamount = null;
//        function renderAstable(ans) {
//            var mainobj = JSON.parse(ans);
//            console.log(mainobj);
//            var arr = mainobj.ans;
//            var count = 1;
//            var output = '<table class="table table-hover">';
//            output += ' <tr>';
//            output += ' <th>index number</th>';
//            output += '<th>start slot</th>';
//            output += '<th>end slot</th>';
//
//            output += '<th>status</th>';
//            output += '</tr>';
//            for (var i = 0; i < arr.length; i++) {
//                var obj = arr[i];
//                output += '<tr>';
//                if (obj.status === "Booked") {
//                    output += '<td><input type="checkbox" disabled name="r2"/></td>';
//                } else {
//                    output += '<td><input type="checkbox"  name="r2" value=' + obj.start_slot + ' onchange="slot(this)"/></td>';
//                }
//                output += '<td>' + obj.start_slot + '</td>';
//                output += '<td>' + obj.end_slot + '</td>';
//                output += '<td>' + obj.status + '</td>';
//                slotamount = obj.slot_amount;
//
//                output += '</tr>';
//                count++;
//            }
//            output += '</table>';
//            document.getElementById("d2").innerHTML = output;
//
//                       }
//
//        var count = 0;
//        var grandtotal = 0;
//        function slot(checkbox) {
//
//            if (checkbox.checked) {
//
//                count++;
//                // alert(count+" "+grandtotal);
//            } else {
//                count--;
//            }
//
//            grandtotal = count * slotamount;
//
//            var ans = "";
//            ans += "<h3>GRAND TOTAL=" + grandtotal + "</h3>";
//            document.getElementById("d3").innerHTML = ans;
//        }
//
//        var allslots = "";
//        function bookslot() {
//            var date = document.getElementById("my_date_picker").value;
//            var name = document.getElementsByName("r2");
//            var em = email;
//
//            console.log(name);
//
//            for (var i = 0; i < name.length; i++) {
//
//                if (name[i].checked) {
//                    allslots += name[i].value + ",";
//                }
//            }
//            window.location.href = "modeofpayment.jsp?date=" + date + "&vendoremail=" + em + "&total=" + grandtotal + "&allslot=" + allslots;
//
//        }
//

    </script>
    
    
    <script>

            
            function review1()
            {
                $("#myModal1").modal("show");
            }
            var xhr = new XMLHttpRequest();
            var n = 0;
            function fill(obj)
            {
                var img = obj.src;
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                var i;
                if (n === 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    if (i <= val)
                    {
                        document.getElementById("rating_" + i).src = "rating/filled_star.jpeg";

                    } else
                    {
                        document.getElementById("rating_" + i).src = "rating/empty_star.jpeg";
                    }
                }

            }
            function selected(obj)
            {
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                n = val;
            }
            function unfill(obj)
            {
                var i;
                if (n === 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    document.getElementById("rating_" + i).src = "rating/empty_star.jpeg";
                }
            }

            function addreview(vendoremail)
            {
                
                var comment = document.getElementById("comment").value;
//            var all = document.getElementById("all").value;

                if (n === 0)
                {
                    document.getElementById("label1").style.display = "block";

                } else
                {

                    //1. Make object of XMLHttpRequest
                    var xhttp = new XMLHttpRequest();

                    //4. Receive XMLHttpResponse from server & use ans
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            res = this.responseText;
                            res = res.trim();
                           // alert(res);
                            console.log(res);

                            if (res == "success")
                            {
                            //    alert("Ratting Added successfully");
                                userShowRatings();
                            } else
                            {
                               // alert("An Error occured");
                            }
                        }
                    };

                    //2. Prepare request (Define target --> servlet)
                    xhttp.open("GET", "./userAddReview_Servlet?comment=" + comment + "&vendoremail=" + '<%=email%>' + "&rating=" + n, true);

                    //3. Send Request
                    xhttp.send();

                }
            }

            function userShowRatings() {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ren = "";

                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];
                            ren += "<div class=\"row\" >";

                            ren += "<div class= \"col-sm-4\" style=\"text-align: center\" >";
                            ren += "<div class=\"card-body\">";
                            for (var j = 0; j < st.rating; j++) {
                                ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/filled_star.jpeg\" >";
                            }
                            for (var j = st.rating; j < 5; j++) {
                                ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/empty_star.jpeg\" >";
                            }
                            ren += "</div>";
                            ren += "</div>";

                            ren += "<div class= \"col-sm-4\" style=\"text-align: center\" >";
                            ren += "<div class=\"card-body\">";
                            ren += "<label class=\"card-text text-alli\" style=\"font-size: 16px;text-align: center;color: #005b9a\" ><b>Comment : </b><br>" + st.comment + "</label><br><br>";
                            ren += "</div>";
                            ren += "</div>";

                            ren += "<div class= \"col-sm-4\" style=\"text-align: center\" >";
                            ren += "<div class=\"card-body\">";
                            ren += "<label class=\"card-text text-alli\" style=\"font-size: 16px;text-align: center;color: #005b9a\" ><b>User Email : </b><br>" + st.useremail + "</label><br><br>";
                            ren += "</div>";
                            ren += "</div>";
                            ren += "</div>";

                        }

                        document.getElementById("showratings").innerHTML = ren;
                        averageRating();
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./userShowRatingsServlet?vendoremail=" + '<%=email%>', true);

                //3. Send Request
                xhttp.send();
            }

            function averageRating() {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ren = "";

                        var st = arr[0];
                        var rating2 = st.r1;
                        var getdecimal = rating2.toString().split(".")[1];
                        if(parseInt(getdecimal) == 0){
                        ren += "<div class= \"col-sm-12\" style=\"text-align: center\" >";
                        ren += "<div class=\"card-body\">";
                        for (var j = 0; j < st.r1; j++) {
                            ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/filled_star.jpeg\" >";
                        }
                        for (var j = st.r1; j < 5; j++) {
                            ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/empty_star.jpeg\" >";
                        }
                        ren += "</div>";
                        ren += "</div>";
                    }else{
                        ren += "<div class= \"col-sm-12\" style=\"text-align: center\" >";
                        ren += "<div class=\"card-body\">";
                        for (var j = 0; j < st.r1-1; j++) {
                            ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/filled_star.jpeg\" >";
                        }
                        ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/download.jpeg\" >";
                        for (var j = st.r1; j < 4; j++) {
                            ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/empty_star.jpeg\" >";
                        }
                        ren += "</div>";
                        ren += "</div>";
                    }

                        document.getElementById("averagerating").innerHTML = ren;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./userShowAverageRatingsServlet?vendoremail=" + '<%=email%>', true);

                //3. Send Request
                xhttp.send();
            }

        </script>
    
    <body onload="infoaboutsinglevendor()">
        
            <%@include file="Navbar1.jsp" %><br><br>
        <div class="container">
            <div class="row">
                <div class="col-sm-6" >
                    <h1 class="text-danger mb-3" style="text-align: center"><strong>All INFORMATION</strong></h1>  
                    <br>
                    <div id="d1"  >

                    </div>
                </div>
                
                <div class="col-sm-6" >
                    <h1 class="text-danger mb-3" style="text-align: center"><strong>GALLERY</strong></h1>
                    <br>
                    <div class="mdb-lightbox">
                        <div id="photo" >


                        </div>


                                  </div>

                </div>
            </div>
            
        </div><br><br>
        
        <div class="text-center" >

                            <div class="col-sm-12" style="text-align: center">
                                <input type="button" class="btn btn-success btn-lg" value="ADD REVIEW"
                                       style="border-radius: 10px;text-shadow: 2px 2px 5px black;" onclick="review1()" />

                            </div><br><br><br>
                            <hr>
                            <h2>Average Rating</h2>
                            <div id="averagerating" >

                            </div><br><br><br>
                            <hr>
                            <h2>All Ratings</h2>
                            <div id="showratings" >

                            </div>

                            <div class="modal" id="myModal1" >
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header " style="background: yellowgreen;" >
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" style="color: white;"> Add Review</h4>
                                        </div>
                                        <div class="modal-body " >
                                            <div>



                                                <div id="all">

                                                    <form action="" method="post" id="form1">
                                                        <table>
                                                            <tr> <label class="form-group"> Give Ratings..</label>
                                                            <td>
                                                                <img id="rating_1" src="rating/empty_star.jpeg" onmouseover="fill(this);" onmouseout="unfill(this);" onclick="selected(this);" width="50px;" height="50px;">
                                                            </td>
                                                            <td>
                                                                <img id="rating_2" src="rating/empty_star.jpeg" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                                            </td>
                                                            <td>
                                                                <img id="rating_3" src="rating/empty_star.jpeg" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                                            </td>
                                                            <td>
                                                                <img id="rating_4" src="rating/empty_star.jpeg" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                                            </td>
                                                            <td>
                                                                <img  id="rating_5" src="rating/empty_star.jpeg" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                                            </td>
                                                            </tr>
                                                        </table>
                                                        <br>
                                                        <label> Write Comment : </label> <input style="border-radius: 20px;" type="text" id="comment"  class="form-group"/>
                                                        <input type="button" value="Submit" class="btn btn-primary"
                                                               style="border-radius: 10px;text-shadow: 2px 2px 5px black" onclick="addreview('<%=email%>')" />
                                                        <label style="display: none;color: tomato;" id="label1">Please Select Any Rating</label>

                                                    </form>
                                                </div>

                                            </div>   
                                        </div>
                                        <!--</div>-->
                                        <div class="modal-footer " style="background: yellowgreen;" >
                                            <button type="button" class="btn btn-default" style="border-radius: 10px;" data-dismiss="modal" style="" >Close</button>
                                        </div>


                                    </div>
                                </div>
                            </div>

                        </div>
<!--
        Date: <input type="text" id="my_date_picker" class="mt-lg-3">
        <input type="submit" value="Fetch Data" onclick="fetchdetails()"/>-->
        <br>
        <br>
        <div id="d2">

        </div>
        <h1 class="h2-title" id="gymname2">Find Us on Google Maps :</h1>

                    <div class="main-contact-map-in">
                        <div class="mapouter">
                            <div class="gmap_canvas">
                                <iframe width="100%" height="400px" id="gmap_canvas" src="https://maps.google.com/maps?q=31.636694035778973,74.87413616805217&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                <a href="https://2yu.co"> </a>
                                <br>
<!--                                <style>.mapouter{
                                        position:relative;
                                        text-align:right;
                                        height:100%;
                                        width:100%;
                                        }</style>
                                <a href="https://embedgooglemap.2yu.co/"></a>
                                <style>.gmap_canvas {
                                        overflow:hidden;
                                        background:none!important;
                                        height:100%;
                                        width:100%;
                                        }</style>-->
                            </div>
                        </div>
                    </div>

<!--        <div style="border: solid 4px black" id="d3" class="bg-secondary">

        </div>-->
        
        
        
        
        <!-- <input type="button" value="BookSlots" onclick="bookslot()"/> -->

        
      
      
        
        
     </body>
    <%@include file="footer1.jsp"%>
        
</html>