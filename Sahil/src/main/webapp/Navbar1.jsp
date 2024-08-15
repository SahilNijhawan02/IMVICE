
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        

        <style>
.dropdown-menu
{
     background-color: gray;
}
.dropdown-item{
    color: white;
}
.dropbtn {
  font-size: 17px;
  border: none;
  outline: none;
  color: white;
  padding: 6px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0; /* Important for vertical align on mobile phones */
}


/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: graytext;
}



/* Add a grey background color to dropdown links on hover */
.dropdown-content a:hover {
  background-color: #ddd;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}
        </style>
        
<!--    <div class="top-bar_sub container-fluid">-->
        <div class="top-forms text-left mt-3" style="background-color: #000">
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
                                                        
                                String useremail=(String)session.getAttribute("useremail");
                                                        
                               if(useremail != null)
                               {
                            %>

                            <li class="nav-item">
                                <a class="nav-link scroll" href="#about">Welcome <%=useremail%></a>
                            </li>
<!--                            <li class="nav-item">
                                <a class="nav-link scroll" href="#services">Services</a>
                            </li>-->
                            <li class="nav-item">
                                <a class="nav-link" href="user_bookings.jsp">MyBookings</a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="edit_user_profile.jsp">EditUserProfile</a>
                            </li>
                            
                             <li class="nav-item">
                                <a class="nav-link" href="user_change_password.jsp">ChangePassword</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="user_logout.jsp">Logout</a>
                            </li>
                        </ul>
                            <%
                                }
                                else
                                {

                            %>
                            
                           
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
                            
                            <li class="nav-item">
                                <div class="dropdown">
  <button class="dropbtn " type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    User  <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="USER_SIGN_UP.jsp">UserSignUp</a>
    <a class="dropdown-item" href="login.jsp">UserLogin</a>
    
  </div>
</div>
                                
                            </li>
  <li>
                                <div class="dropdown">
  <button class="dropbtn " type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Vendor  <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="vendor_sign_up.jsp">VendorSignUp</a>
    <a class="dropdown-item" href="vendor_login.jsp">VendorLogin</a>
    
  </div>
</div>
  </li>
  
  <li>
                                <div class="dropdown">
  <button class="dropbtn " type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Admin  <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="admin_login.jsp">AdminLogin</a>
   
    
  </div>
</div>
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
<!--        <div class="logo text-center">
            <a class="navbar-brand" href="index.html">
                <i></i><span></span></a> 
                
        </div>-->
    

