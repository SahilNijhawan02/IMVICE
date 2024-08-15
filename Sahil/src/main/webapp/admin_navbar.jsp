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
                                                        
                                                        String email=(String)session.getAttribute("email");
                                                        
                                                       if(email != null)
                                                       {
                                                        %>
                                                    
							<li class="nav-item">
								<a class="nav-link scroll" href="#about">Welcome <%=email%></a>
							</li>
							
                                                        <li class="nav-item">
								<a class="nav-link" href="admin_logout.jsp">Logout</a>
                                                        </li>
                                                                
                                                        <%
                                                            }
                                                            else
                                                            {

                                                        %>
                                                        
                                                          <li class="nav-item active">
								<a class="nav-link" href="admin_login.jsp">AdminLogin
									<span class="sr-only">(current)</span>
								</a>
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
