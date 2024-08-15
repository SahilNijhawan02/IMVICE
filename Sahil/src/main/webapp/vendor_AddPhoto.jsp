<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Photo</title>
        <%@include file="Header.jsp" %>
        
         
        
        
        <script>

            function addPhoto()
            {
               // alert("adding photo");
                var url = "./vendorAddPhotos";
                var photo = document.getElementById("photo").files[0];


//                if (document.getElementById("photo").files.length == 0)
//                {
//                    Swal.fire({
//                        icon: 'error',
//                        title: 'Oops...',
//                        text: 'Select Gym Photo!'
//                    });
//                } else {


                    var formdata = new FormData();
                    formdata.append("photo", photo);


                    fetch(url, {method: "POST", body: formdata})
                            .then(response => response.text())
                            .then(ans => renderAddedPhotos(ans));
               // }
            }
            
             function renderAddedPhotos(ans)
            {
               // alert(ans);
                if (ans == "success")
                {
//                    Swal.fire({
//                        icon: 'sucsess',
//                        title: 'Done...',
//                        text: 'Photo Added Successfully!'
//                    })
                    document.getElementById("vendorpic").reset();
                   vendorShowPhotos();
                } 
//                else
//                {
//                    Swal.fire({
//                        icon: 'error',
//                        title: 'Oops...',
//                        text: 'Error Occured !'
//                    });
//                }
            }

            
            function vendorShowPhotos()
            {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                      //  alert(ans);
                        renderphotos(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./vendorShowPhotos", true);

                //step3
                xhttp.send();

            }

            function renderphotos(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];
                // alert(arr);
                 
                var ren = "";
                ren += "<div class=\"row\" >";
                for (var i = 0; i < arr.length; i++)
                {
                    var st = arr[i];

                    ren += "<div class=\"col-sm-2\" style=\"text-align: center; padding: 5px; margin: 1px; padding-left: 20px\" >";
                    ren += "<img class=\"img-thumbnail\"  style=\"border: 2px solid black; border-radius: 10px; height: 170px\" src=\'" + st.photo + "\' ><br><br>";
                    ren += "<input type=\"button\" value=\"Delete\" class=\"btn btn-success\" onclick=\"deleteVendorPhoto('" + st.photoid + "')\" ><br>";
                    ren += "</div>";
                }
                ren += "</div>";
                document.getElementById("showaddedphotos").innerHTML = ren;

            }


             function deleteVendorPhoto(photoid)
             {
                 // alert(photoid);

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                     //   alert(ans);
                        deletePhoto(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./deleteVendorPhoto?photoid=" +photoid, true);

                //step3
                xhttp.send();
             }
             
              function deletePhoto(ans)
            {
                if (ans === "success")
                {
//                    Swal.fire({
//                        icon: 'sucsess',
//                        title: 'Done...',
//                        text: 'Photo Removed Successfully!'
//                    })
                   vendorShowPhotos();
                } else
                {
//                    Swal.fire({
//                        icon: 'error',
//                        title: 'Oops...',
//                        text: 'Error While Deleting !'
//                    });
                    
                  //  alert("photo not deleted");
                }
            }


</script>
        
    </head>
    
    <body onload="vendorShowPhotos()" >
        
        <%@include file="vendor_navbar.jsp" %>
        <br><br><br><br><br><br><br><br>
      <div class="loader-box">
            <div class="loader-text">
                <span class="let1">L</span>
                <span class="let2">o</span>
                <span class="let3">a</span>
                <span class="let4">d</span>
                <span class="let5">i</span>
                <span class="let6">n</span>
                <span class="let7">g</span>
                <span class="let8">.</span>
                <span class="let9">.</span>
                <span class="let10">.</span>
            </div>
        </div>
        <!-- Loader End -->

        <!-- Header Start -->

        

        <section class="main-classes" >

            <div class="classes-overlay-bg animate-this">
<!--                <img src="assets/images/classes-overlay-bg.png" alt="Overlay">
           -->
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <h2 class="h2-title">Add Your Work Photos</h2>
                        </div>
                    </div>
                </div>

                <div id="login" style="border: 2px solid black; border-radius: 10px;background-color: white; padding: 10px">

                    <form autocomplete="off" id="vendorpic"  >

                        <div class="form-group">
                            <label><b>Choose Photo</b></label><br>
                            <input style="border: 2px solid black; border-radius: 10px" id="photo" type="file" >
                        </div><br>

                        <div id="pass-info" class="clearfix"></div>
                        <input type="button" value="Add Photo" onclick="addPhoto()" class="btn btn-success">

                    </form>

                </div>
            </div>
            <hr>
            <div class="container" ><hr><br>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <h2 class="h2-title">Your Added Photos</h2>
                        </div>
                    </div>
                </div>
                <div id="showaddedphotos" style="border: 2px solid black; border-radius: 10px;background-color: white; padding: 10px" >

                </div>
            </div>

        </section>
<br><br>


    </body>
  <%@include file="footer.jsp"  %>

</html>