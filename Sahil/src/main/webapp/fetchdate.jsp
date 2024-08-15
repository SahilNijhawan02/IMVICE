<html>
    <head>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Fetch Date</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href=
              'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'
              rel='stylesheet'>

        <script src=
                "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" >
        </script>

        <script src=

                "https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" >
        </script>
        <%@include file="Header.jsp" %>
        
        <script>
            $(document).ready(function () {

                $(function () {
                    $("#my_date_picker").datepicker({
                        minDate:0,
                    });
                });
            })
        </script>


        <%
       String email= (String) request.getParameter("email");
       String date=(String)request.getParameter("date");
        %>

        <script>
            var grandtotal = 0;
            var slotamount =0;
            var count = 0;

            var em = "<%=email%>";


            function fetchdetails() {
                // var date = document.getElementById("my_date_picker").value;
                //alert(em);
                
            var date = document.getElementById("my_date_picker").value;
               // alert(date);
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                       // alert(ans);
                        renderAstable(ans);
                    }
                };

                xhttp.open("GET", "./fetchdate?date=" + date + "&email=" + em + " ", true);

                xhttp.send();
            }

            function renderAstable(ans) {
                var mainobj = JSON.parse(ans);
                console.log(mainobj);
                var arr = mainobj.ans;
                var count = 1;
                var output = '<table class="table table-hover style="border: solid 3px black;">';
                output += ' <tr>';
                output += ' <th>Index Number</th>';
                output += '<th>Start Slot</th>';
                output += '<th>End Slot</th>';

                output += '<th>Status</th>';
                output += '</tr>';
                for (var i = 0; i < arr.length; i++) {
                    var obj = arr[i];
                    output += '<tr>';
                    if (obj.status === "Booked") {
                        output += '<td><input type="checkbox" disabled name="r2"/></td>';
                    } else {
                        output += '<td><input type="checkbox"  name="r2" value=' + obj.start_slot + ' onchange="slot(this)"/></td>';
                    }
                    output += '<td>' + obj.start_slot + '</td>';
                    output += '<td>' + obj.end_slot + '</td>';
                    output += '<td>' + obj.status + '</td>';
                    slotamount = obj.slot_amount;

                    output += '</tr>';
                    count++;
                }
                output += '</table>';
                document.getElementById("d2").innerHTML = output;

                           }
            function slot(checkbox) {

                if (checkbox.checked) {

                    count++;
                    // alert(count+" "+grandtotal);
                } else {
                    count--;
                }

                grandtotal = count * slotamount;
                var ans = "";

                ans += " <h3> Grand Total =" + grandtotal + "</h3>";
                document.getElementById("d3").innerHTML = ans;

            }
            function bookslot() {
               
                var allslots = "";
                var date = document.getElementById("my_date_picker").value;
                var name = document.getElementsByName("r2");
                //console.log(name);
              //  alert(name);

                for (var i = 0; i < name.length; i++) {

                    if (name[i].checked) {
                        allslots += name[i].value + ",";
                        //alert(name[i].value);
                    }
                }
                //alert(allslots);
                console.log(allslots);
                
                if(grandtotal == 0){
                    //alert("select the slots");
                    Swal.fire({
                        icon: 'alert',
                        title: 'Oops...',
                        text: 'Select the Slot !'
                    });
                }else{

                window.location.href = "modeofpayment.jsp?date=" + date + "&vendoremail=" + em + "&total=" + grandtotal + "&allslots=" + allslots;
                }

            }

        </script>
        
         </head>
        <body>
            
            <%@include file="Navbar1.jsp" %><br><br><br>
            
<div class="container" style="text-align: center" >
    <h2>Choose Your Date of Booking</h2>
    <input type="text" id="my_date_picker" class="mt-lg-3" placeholder="Select your date"><br><br>
            <input type="submit" value="Fetch Data" class="btn btn-dark" onclick="fetchdetails()"/><br><br><br>
         
             <div id="d2">
                
                
            </div>
            <br>
            
            
            <div id="d3">
                
                
            </div>
            <br>
            <input type="button" value="Book Slots" onclick="bookslot()" />
            </div>
            <br><br>
            
            
             <%@include file="footer.jsp" %>
        </body>
    </html>