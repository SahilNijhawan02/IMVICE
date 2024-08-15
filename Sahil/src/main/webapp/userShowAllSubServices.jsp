<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Sub Services</title>
        <style>
            * { 
  margin : 0;
  padding: 0;
  box-sizing : border-box;
  font-familly : "Poppins", sans-serif;
}
row {
  display : flex;
  align-items : center;
  justify-content : center;  
  background-color: #43345d;
  min-height : 900px;
}

.container1 {
  position : relative;
  width : 1300px;
  display : flex;
  align-items : center;
  justify-content : center;
  flex-warp : warp;
 padding : 30px;  
}

.container1 .card1 {
  position: relative;
  max-width : 300px;
  height : 215px;  
  background-color : #fff;
  margin : 30px 10px;
  padding : 20px 15px;
  
  display : flex;
  flex-direction : column;
  box-shadow : 0 5px 20px rgba(0,0,0,0.5);
  transition : 0.3s ease-in-out;
  border-radius : 15px;
}
.container1 .card1:hover {
  height : 320px;    
}


.container1 .card1 .image {
  position : relative;
  width : 300px;
  height : 300px;
  
  top : -40%;
  left: 8px;
  box-shadow : 0 5px 20px rgba(0,0,0,0.2);
  z-index : 1;
}

.container1 .card1 .image1 img {
  max-width : 100%;
  border-radius : 15px;
}

.container1 .card1 .content1 {
  position : relative;
  top : -140px;
  padding : 10px 15px;
  color : #111;
  text-align : center;
  
  visibility : hidden;
  opacity : 0;
  transition : 0.3s ease-in-out;
    
}

.container1 .card1:hover .content1 {
   margin-top : 30px;
   visibility : visible;
   opacity : 1;
   transition-delay: 0.2s;
  
}
        </style>

        <%@include file="Header.jsp"  %>


        <% 
            String  serviceid=(String)request.getParameter("serviceid");
            String servicename=(String)request.getParameter("servicename");
            
        %>
        <style>
            #nav:hover {
            text-decoration: none;
            font-weight: bold;
        }
/*            #nav{
                font-weight: bold;
            }*/
        </style>
        <script>

            function userShowAllSubService()
            {
//               
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
//                console.log(serviceid);
                xhttp.open("GET", "./userShowAllSubService?serviceid=" +<%=serviceid%>, true);
                //step3
                xhttp.send();
            }

            function renderAsHTML(t) {
                //alert(t);

                var ans = "";
                var obj = JSON.parse(t);
                var arr = obj.ans;
                console.log(arr);
                
                
                for (var i = 0; i < arr.length; i++)
                {

                    var service = arr[i];
                   
                    ans += "<div class=\"col-lg-3 col-sm-6 mb-lg-0 mb-5 text-center\" >";
                    ans += "<div class=\"barber-grid1\">";
                    ans += "<img src=\"" + service.photo + "\"class=\"img-fluid\" alt=\"\"  style=\"height:200px; width:300px;border: 1px solid black\" />";
                    ans += "</div>";
                    ans += "<a href=\"showAllVendors.jsp?subservice="+service.subservicename+"\"><h4 id=\"nav\" class=\"mt-3\" onMouseOver=\"this.style.color='#1B1212';\" onMouseOut=\"this.style.color='#1B1212'\" style=\"color:#1B1212\">"+service.subservicename+"</h4>";
                    ans += "<p style=\" border: 2px solid white; text-align: center\">" + service.desc + "</p>";
                   ans += "<div class=\"social mt-2\">";
                   ans += "<ul class=\"d - flex justify - content - center\">";
                    ans += "</ul>";
                   ans += "</div>";
                   ans += "<br><br>";
                    
                   ans += "</div>";
                }

                document.getElementById("subservicesrendering").innerHTML = ans;
            }



        </script>


    </head>

    <body onload="userShowAllSubService()">
<%@include file="Navbar1.jsp" %>
<br><br>

        <!-- Team -->
<!--        <section class="barbers py-5" id="team">-->
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Sub Services Of <%=servicename%></h3>
                </div>
                <div class="row barber-grids" id="subservicesrendering">


                </div>
            </div>
        </section>
        <!-- //Team -->


        <%@include file="footer.jsp" %>

    </body>
</html>