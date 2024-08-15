<header>
    <div class="top-bar_sub container-fluid" style="background-color: black ">  
		<div class="top-forms text-left mt-3">
			<!--/nav-->
			<div class="header_top">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<button class="navbar-toggler navbar-toggler-right mx-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mx-auto">
                                                    
                                                    <%
                                                        
                                                        String vendor_email=(String)session.getAttribute("Vendor_Email");
                                                        
                                                       if(vendor_email != null)
                                                       {
                                                        %>
                                                    
							<li class="nav-item">
								<a class="nav-link scroll" href="#about">Welcome <%=vendor_email%></a>
							</li>
							
                                                        <li class="nav-item">
								<a class="nav-link" href="vendor_logout.jsp">Logout</a>
                                                        </li>
                                                        
                                                        <li class="nav-item">
								<a class="nav-link" href="vendor_change_password.jsp">ChangePassword</a>
                                                        </li>
                                                                
                                                        <%
                                                            }
                                                            else
                                                            {

                                                        %>
                                                        
                                                          <li class="nav-item active">
								<a class="nav-link" href="vendor_login.jsp">VendorLogin
									<span class="sr-only">(current)</span>
								</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link" href="vendor_sign_up.jsp">VendorSignUp
									<span class="sr-only">(current)</span>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link scroll" href="#about">About</a>
							</li>
							<li class="nav-item">
								<a class="nav-link scroll" href="#services">Services</a>
							</li>
							<li class="nav-item">
								<a class="nav-link scroll" href="#team">Team</a>
							</li>
							<li class="nav-item">
								<a class="nav-link scroll" href="#testimonials">Testimonials</a>
							</li>
							<li class="nav-item">
								<a class="nav-link scroll" href="#pricing">Pricing</a>
							</li>
							<li class="nav-item">
								<a class="nav-link scroll" href="#appointment">Appointment</a>
							</li>
							<li class="nav-item">
								<a class="nav-link scroll" href="#contact">Contact</a>
							</li>
                                                        <%
                                                            }
                                                         %>
						</ul>
					</div>
					
				</nav>
			</div>
			<!--//nav-->
		</div>
		<div class="logo text-center">
			<a class="navbar-brand" href="index.jsp">
				<i class="fas fa-home"></i> <span> </span></a> 
		</div>
	</div>
</header>
