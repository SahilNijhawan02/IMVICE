<!DOCTYPE html>
<html lang="en">
<head>
   
   
<title>Admin Index</title>
	
	<%@include file="Header.jsp" %>
</head>

<body>
<%@include file="admin_navbar.jsp" %>
<div id="v1"> 

</div>
 
<br><br><br><br><br><br>  <br><br>
<section class="services py-5" id="services">
	<div class="container-fluid">
		<div class="heading text-center">
			<i class="fas fa-home"></i>
			<h3 class="heading mb-sm-5 mb-3 text-uppercase">Manage Panels</h3>
		</div>
        </div> 

	<div class="container py-lg-3 py-2">
<!--		<div class="heading text-center">
			
			
		</div>-->
		<div class="row about-grids">
                    
			<div class="col-lg-6 about-grid1 mb-lg-0 mb-5">
				<div class="about-grid6 p-5" style="text-align:center;border: 4px solid black; border-radius: 50px;">
                                    <h3 style="color:white;">   <a href="admin_ManageService.jsp" style="color:white; font-family:verdana"> <font size="+3">Manage<br>Service </font></a> </h3>
				</div>
			</div>
                    
<!--			<div class="col-lg-4 about-grid1 mb-lg-0 mb-5">
                            <div class="about-grid2 p-5" style="text-align:center">
                                <h3 style="color:white;">   <a href="admin_manage_subservice.jsp" style="color:white; font-family:verdana"> <font size="+3">Manage<br>Sub-Service</font></a> </h3>
				</div>
			</div>-->
                    
			<div class="col-lg-6 about-grid1 mb-lg-0 mb-5">
				<div class="about-grid5 p-5" style="text-align:center;border: 4px solid black; border-radius: 50px;">
                                    <h3 style="color:white;">   <a href="admin_manageVendors.jsp" style="color:white; font-family:verdana"> <font size="+3">Manage<br>Vendors</font></a> </h3>
				</div>
			</div>
		</div>
	</div>
</section>


<%@include file="footer.jsp" %>



	
</body>
</html>