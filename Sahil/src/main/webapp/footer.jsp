 <section class="newsletter text-center py-5">
                <div class="container py-lg-3">
                    <div class="logo mb-5 text-center" >
                        <a class="navbar-brand" href="index.jsp">
                           
                            <i class="fas fa-home"></i> IMVICE <span>  Your one-stop Solution</span></a> 
                            
                    </div>
  <article style="color: white"> Feel the essence of <b>From our door to Yours</b> - delivery thats never a bore! </article>

                   
                    <div class="copyright mt-5">
                        <p>� 2023 IMVICE. All Rights Reserved </p>
                    </div>
                </div>
            </section>
            <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
            <script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
            <!-- //js -->

            <!-- script for responsive tabs -->
            <script src="js/easy-responsive-tabs.js"></script>
            <script>
                $(document).ready(function () {
                    $('#horizontalTab').easyResponsiveTabs({
                        type: 'default', //Types: default, vertical, accordion           
                        width: 'auto', //auto or any width like 600px
                        fit: true, // 100% fit in a container
                        closed: 'accordion', // Start closed if in accordion view
                        activate: function (event) { // Callback function if tab is switched
                            var $tab = $(this);
                            var $info = $('#tabInfo');
                            var $name = $('span', $info);
                            $name.text($tab.text());
                            $info.show();
                        }
                    });
                    $('#verticalTab').easyResponsiveTabs({
                        type: 'vertical',
                        width: 'auto',
                        fit: true
                    });
                });
            </script>
            <!--// script for responsive tabs -->

            <!-- Flexisel-js for-testimonials -->
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo1").flexisel({
                        visibleItems: 1,
                        animationSpeed: 1000,
                        autoPlay: false,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 1
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 1
                            }
                        }
                    });

                });
            </script>
            <script type="text/javascript" src="js/jquery.flexisel.js"></script>
            <!-- Flexisel-js for-testimonials -->

            <!-- Calendar js for date picker-->
            <script src="js/jquery-ui.js"></script>
            <script>
                $(function () {
                    $("#datepicker,#datepicker1,#datepicker2,#datepicker3").datepicker();
                });
            </script>
            <!-- //Calendar -->

            <!-- Banner Responsiveslides -->
            <script src="js/responsiveslides.min.js"></script>
            <script>
                // You can also use "$(window).load(function() {"
                $(function () {
                    // Slideshow 4
                    $("#slider3").responsiveSlides({
                        auto: true,
                        pager: true,
                        nav: false,
                        speed: 500,
                        namespace: "callbacks",
                        before: function () {
                            $('.events').append("<li>before event fired.</li>");
                        },
                        after: function () {
                            $('.events').append("<li>after event fired.</li>");
                        }
                    });

                });
            </script>
            <!-- // Banner Responsiveslides -->

            <!-- start-smoth-scrolling -->
            <script src="js/SmoothScroll.min.js"></script>
            <script type="text/javascript" src="js/move-top.js"></script>
            <script type="text/javascript" src="js/easing.js"></script>
            <script type="text/javascript">
                jQuery(document).ready(function ($) {
                    $(".scroll").click(function (event) {
                        event.preventDefault();
                        $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                    });
                });
            </script>
            <!-- here stars scrolling icon -->
            <script type="text/javascript">
                $(document).ready(function () {
                    /*
                     var defaults = {
                     containerID: 'toTop', // fading element id
                     containerHoverID: 'toTopHover', // fading element hover id
                     scrollSpeed: 1200,
                     easingType: 'linear' 
                     };
                     */

                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>