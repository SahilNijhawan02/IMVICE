package door_step.Sahil.controllers;

import jakarta.servlet.http.HttpSession;


import java.io.File;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;
import java.util.StringTokenizer;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import door_step.Sahil.vmm.DbLoader;
import door_step.Sahil.vmm.RDBMS_TO_JSON;
import door_step.Sahil.vmm.sendWA;

@RestController
public class MyRestController {

    @PostMapping("/userSignup")
    String userSignup(@RequestParam String un, @RequestParam String pw,
            @RequestParam String em, @RequestPart MultipartFile f1, @RequestParam String ph) throws Exception {

        var ans ="";
        ResultSet rs = DbLoader.executeSQL("select * from users where email= '"+em+"' ");
                if(rs.next()){
                ans = "fail";
            }else{
                    
                    File f = new File("src\\main\\webapp\\myuploads\\" + f1.getOriginalFilename());
            byte b[] = f1.getBytes();
            FileOutputStream fos = new FileOutputStream(f);
            fos.write(b);
            fos.close();
                    
                    rs.moveToInsertRow();
                    rs.updateString("username", un);
                    rs.updateString("password", pw);
                    rs.updateString("email", em);
                    rs.updateString("phoneno", ph);
                   
                    rs.updateString("photo", "../myuploads/" + f1.getOriginalFilename()); 
                    rs.insertRow();
                    
                    ans = "success";
                }

       return ans;
    }
    
    @PostMapping("/userShowService")
     public String userShowService(){
         String ans = "";
         
         ans = new RDBMS_TO_JSON().generateJSON("select * from service");
         
         return ans;
     }
     
    @GetMapping("/userShowAllSubService")
  String userShowAllSubService(@RequestParam String serviceid)
  {         int id=Integer.parseInt(serviceid);
      String ans=new RDBMS_TO_JSON().generateJSON("select * from subservice where serviceid="+id);
    
      return ans;
  } 
  
  @PostMapping("/showAllVendors")
     public String showAllVendors(@RequestParam String subservicename){
         String ans = "";
         System.out.println(subservicename);
         ans=new RDBMS_TO_JSON().generateJSON("select * from vendor_table where sub_service='"+subservicename+"' and status='Approved' ");
         
         return ans;
     }
     
   @GetMapping("/single_vendor")
     public String single_vendor(@RequestParam String email){
         
         
        String ans = new RDBMS_TO_JSON().generateJSON("select * from vendor_table where Vendor_Email='"+email+"'");
         
         return ans;
     }
     
     @GetMapping("/fetch_data")
     public String fetch_data(@RequestParam String email){
         
         
        String ans = new RDBMS_TO_JSON().generateJSON("select * from vendor_table where Vendor_Email='"+email+"'");
         
         return ans;
     }
   
     
     @GetMapping("/fetchdate")
     public String fetchdate(@RequestParam String email,@RequestParam String date) throws Exception{
         
         
       try {
            String ans = "fail";
            int starttime = 0;
            int endtime = 0;
            String slot_amount = null;
            ResultSet rs = DbLoader.executeSQL("select * from vendor_table where Vendor_Email='" + email + "'");
            JSONObject mainobj = new JSONObject();
            JSONArray arr = new JSONArray();
            if (rs.next()) {

                starttime = Integer.parseInt(rs.getString("start_time"));
                endtime = Integer.parseInt(rs.getString("end_time"));
                slot_amount = rs.getString("slot_amount");

            }
            System.out.println("DATE"+date);
            for (int i = starttime; i < endtime; i++) {
                JSONObject subobj = new JSONObject();
                
                System.out.println("select * from booking_detail where start_slot=\'"+i+"\' and bookingid in(select bookingid from booking where date=\'"+date+"\' and vendoremail=\'"+email+"\' ) ");
                ResultSet rs2 = DbLoader.executeSQL("select * from booking_detail where start_slot=\'"+i+"\' and bookingid in(select bookingid from booking where date=\'"+date+"\' and vendoremail=\'"+email+"\' ) ");
                if(rs2.next()){
                    subobj.put("status", "Booked");
                }else{
                    subobj.put("status", "Available");
                }
                
                subobj.put("start_slot", i);
                subobj.put("end_slot", i + 1);
                subobj.put("slot_amount", slot_amount);
                arr.add(subobj);

            }
            mainobj.put("ans", arr);
            return mainobj.toJSONString();
        } 
       catch (Exception e) 
       {
            return (e.toString());
        }

    }
     
  @PostMapping("/login")
    String userlogin(@RequestParam String email, @RequestParam String password, HttpSession session) throws Exception {

        var ans ="";
        ResultSet rs = DbLoader.executeSQL("select * from users where email= '"+email+"' and password= '"+password+"'");
                if(rs.next())
                {
                session.setAttribute("useremail", email);
                    ans = "success";
                
                }
                else
                {
                    ans = "fail";
                }

       return ans;
    }  
    
 @PostMapping("/vendor_login")
    String vendor_login(@RequestParam String email, @RequestParam String password, HttpSession session) throws Exception {

        var ans ="";
        ResultSet rs = DbLoader.executeSQL("select * from vendor_table where Vendor_Email= '"+email+"' and Password= '"+password+"'");
                if(rs.next())
                {
                session.setAttribute("Vendor_Email", email);
                    ans = "success";
                
                }
                else
                {
                    ans = "fail";
                }

       return ans;
    }  
     
@PostMapping("/COD")
public String COD(@RequestParam String email, @RequestParam String date, @RequestParam String allslot, @RequestParam String grandtotal, HttpSession session) throws Exception
    {
        String status = "Pending";
        String payment="COD";
        System.out.println(email);
        System.out.println(date);
        System.out.println(allslot);
        System.out.println(grandtotal);

        
        int bookingid=0;
        String phoneno = "";
        String useremail=(String) session.getAttribute("useremail");
          System.out.println(useremail);
          try{
              
              ResultSet rs10 = DbLoader.executeSQL("select phoneno from users where email = '"+useremail+"' ");
              if(rs10.next()){
                  phoneno = rs10.getString("phoneno");
              }
              System.out.println(phoneno);
              
          ResultSet rs=DbLoader.executeSQL("select * from booking");
          rs.moveToInsertRow();
          rs.updateString("vendoremail",email);
           rs.updateString("useremail",useremail);
            rs.updateString("date",date);
             rs.updateString("totalprice",grandtotal);
             rs.updateString("status", "Pending");
             rs.updateString("paymenttype", "COD");
             rs.insertRow();
             
             ResultSet rs2 = DbLoader.executeSQL("select MAX(bookingid) as bid from booking");
                if(rs2.next())
                {
                    bookingid = rs2.getInt("bid");
                    System.out.println(bookingid);
                }
           
                ResultSet rs4 = DbLoader.executeSQL("select * from vendor_table where Vendor_Email='"+email+"' ");
            String subserv="";
            String ph="";
            while(rs4.next())
            {
                subserv = rs4.getString("sub_service");
                ph = rs4.getString("phoneno");
            }
             int num = -1;

ArrayList<Integer> arNumber = new ArrayList<>();
for(int x = 0; x < 10; x++)
{
    arNumber.add(x);
}
Collections.shuffle(arNumber);

String strNum = "";
for(int i = 0; i < 4; i++)
    strNum = strNum + arNumber.get(new Random().nextInt(10));

num = Integer.parseInt(strNum);

            
            StringTokenizer st = new StringTokenizer(allslot, ",");
            while (st.hasMoreTokens()) {
                int stSlot = Integer.parseInt(st.nextToken());
                int endslot = stSlot +1;
                
                System.out.println(stSlot);
                System.out.println(endslot);
                
                ResultSet rs3 = DbLoader.executeSQL("select * from booking_detail");
                rs3.moveToInsertRow();
                rs3.updateInt("start_slot", stSlot);
                rs3.updateInt("end_slot", endslot);
                rs3.updateInt("bookingid", bookingid);
                rs3.insertRow();
            }
            
            
                       
//            sendWA.sendWA(phoneno,"hello how are you");
sendWA.sendWA(phoneno, "Hey "+useremail+". "
                    + "Thank you for placing"+subserv +" service at IMVICE! via cash payment for your payment id"+bookingid+". "
                            + "Your Grand Total is "+grandtotal+"."+" Thank you for choosing us! Have a great day. "
                                    + " Your OTP is "+num+"" );

sendWA.sendWA(ph, "Hey "+email+". "
                    + "You have been booked for "+subserv +" service at IMVICE! via cash payment for your client "+useremail+". "
                            + "Booking Amount is "+grandtotal+"."+" Thank you for choosing us! Have a great day. "
                                    + " Your OTP for service is "+num+"" );
            return "success";
          
}
           catch(Exception ex){
             return ex.toString();
          }
         
      
    }

@PostMapping("/online")
public String online(@RequestParam String email, @RequestParam String date, @RequestParam String allslot, @RequestParam String grandtotal, HttpSession session) throws Exception
    {
        String status = "Pending";
        String payment="online";
        System.out.println(email);
        System.out.println(date);
        System.out.println(allslot);
        System.out.println(grandtotal);

        
        int bookingid=0;
        String phoneno = "";
        String useremail=(String) session.getAttribute("useremail");
          System.out.println(useremail);
          try{
              
              
              
              ResultSet rs10 = DbLoader.executeSQL("select phoneno from users where email = '"+useremail+"' ");
              if(rs10.next()){
                  phoneno = rs10.getString("phoneno");
              }
              System.out.println(phoneno);
              
          ResultSet rs=DbLoader.executeSQL("select * from booking");
          rs.moveToInsertRow();
          rs.updateString("vendoremail",email);
           rs.updateString("useremail",useremail);
            rs.updateString("date",date);
             rs.updateString("totalprice",grandtotal);
             rs.updateString("status", "Pending");
             rs.updateString("paymenttype", "online");
             rs.insertRow();
             
             ResultSet rs2 = DbLoader.executeSQL("select MAX(bookingid) as bid from booking");
                if(rs2.next())
                {
                    bookingid = rs2.getInt("bid");
                    System.out.println(bookingid);
                }
                
                ResultSet rs4 = DbLoader.executeSQL("select * from vendor_table where Vendor_Email='"+email+"' ");
            String subserv="";
            String ph="";
            
            int num = -1;
            

ArrayList<Integer> arNumber = new ArrayList<>();
for(int x = 0; x < 10; x++)
{
    arNumber.add(x);
}
Collections.shuffle(arNumber);

String strNum = "";
for(int i = 0; i < 4; i++)
    strNum = strNum + arNumber.get(new Random().nextInt(10));

num = Integer.parseInt(strNum);

            while(rs4.next())
            {
                subserv = rs4.getString("sub_service");
                ph = rs4.getString("phoneno");
                
            }
            
            StringTokenizer st = new StringTokenizer(allslot, ",");
            while (st.hasMoreTokens()) {
                int stSlot = Integer.parseInt(st.nextToken());
                int endslot = stSlot +1;
                
                System.out.println(stSlot);
                System.out.println(endslot);
                
                ResultSet rs3 = DbLoader.executeSQL("select * from booking_detail");
                rs3.moveToInsertRow();
                rs3.updateInt("start_slot", stSlot);
                rs3.updateInt("end_slot", endslot);
                rs3.updateInt("bookingid", bookingid);
                rs3.insertRow();
            }
//            sendWA.sendWA(phoneno,"hello how are you");

sendWA.sendWA(ph, "Hey "+email+". "
                    + "You have been booked for "+subserv +" service at IMVICE! via Online payment for your client "+useremail+". "
                            + "Booking Amount is "+grandtotal+"."+" Thank you for choosing us! Have a great day. "
                                    + " Your OTP for service is "+num+"" );
                        sendWA.sendWA(phoneno, "Hey "+useremail+". "
                    + "Thank you for placing"+subserv +" service at IMVICE! via Online payment for your payment id"+bookingid+". "
                            + "Your Grand Total is "+grandtotal+"."+" Thank you for choosing us! Have a great day. "
                                    + " Your OTP is "+num+"" );
             return "success";
          }
          catch(Exception ex){
             return "failed";
          }
      
    }

    
    @GetMapping("/login_service_servlet")
    public String login_service_servlet() {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from service ");

        return ans;
    }
    
    @GetMapping("/login_subservice_servlet")
    public String login_subservice_servlet(@RequestParam int serviceid) {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from subservice where serviceid = '"+serviceid+"' ");

        return ans;
    }

    @PostMapping("/vendor_sign_up")
    String vendorSignup(@RequestParam String un, @RequestParam String pw, @RequestParam String em, @RequestParam String ph, @RequestPart MultipartFile f1, @RequestParam String serv, @RequestParam String subserv, @RequestParam String desc, @RequestParam String add, @RequestParam String st, @RequestParam String et, @RequestParam String sa, @RequestParam String lo, @RequestParam String la ) {
        String ans = null;



        // Now Save File On Server //
        try {
            File f = new File("src\\main\\webapp\\myuploads\\" + f1.getOriginalFilename());
            byte b[] = f1.getBytes();
            FileOutputStream fos = new FileOutputStream(f);
            fos.write(b);
            fos.close();

            ResultSet rs = DbLoader.executeSQL("select * from vendor_table where Vendor_Email='" + em + "'");
            if (rs.next()) {
                ans = "exists";
                return ans;
            } else {
                rs.moveToInsertRow();
                rs.updateString("Vendor_Name", un);
                rs.updateString("Password", pw);
                rs.updateString("Vendor_Email", em);
                rs.updateString("phoneno", ph);
                rs.updateString("Desc", desc);
                rs.updateString("serviceid", serv);
                rs.updateString("sub_service", subserv);
                rs.updateString("Address", add);
                rs.updateString("start_time", st);
                rs.updateString("end_time", et);
                rs.updateString("slot_amount", sa);
                rs.updateString("latitude", la);
                rs.updateString("longitude", lo);
                rs.updateString("status", "Pending");

                rs.updateString("Photo", "../myuploads/" + f1.getOriginalFilename());
                rs.insertRow();

                ans = "success";
                return ans;
            }

        } catch (Exception ex) {
            return ex.toString();
        }

    }
    
    @GetMapping("/photo")
    public String photo(@RequestParam String email) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from photo where vendoremail= '"+ email+"'");

        return ans;
    }
    
    @GetMapping("/getvendordata")
    String getvendordata(@RequestParam String email) 
    {
        
        
        String ans=new RDBMS_TO_JSON().generateJSON("select * from vendor_table where Vendor_Email='" + email +"'");
       

        return ans;
    }
//    
//    @PostMapping("/ownerShowPhotos")
//    String ownerShowPhotos(@RequestParam int photoid) 
//    {
//        
//        
//        String ans=new RDBMS_TO_JSON().generateJSON("select * from photo where photoid= '" + photoid +"'");
//        
//
//        return ans;
//    }
//    
//    @PostMapping("/ownerDeletePhoto")
//    String ownerDeletePhoto(@RequestParam String photoid) 
//    {
//         String ans="";
//        
//        try{
//        ResultSet rs = DbLoader.executeSQL("select * from  photo where photoid="+photoid);
//         
//        if(rs.next())
//        {
//            rs.deleteRow();
//            ans="success";
//            
//        }
//        else{
//            ans="photo with photoid  not present";
//        }
//        
//        }
//        catch(Exception ex)
//        {
//            return ex.toString();
//        }
//        return ans;
//    }
//    
//    
//    
//    @PostMapping("/vendor_AddPhoto")
//    String vendor_AddPhoto(@RequestParam MultipartFile photo, HttpSession session) throws Exception 
//    {
//        String vendoremail = (String) session.getAttribute("Vendor_Email");
//        
//        try{
//        ResultSet rs=DbLoader.executeSQL("select * from photo");
//         
//        rs.moveToInsertRow();
//        rs.updateString("vendoremail", vendoremail);
//        rs.updateString("photo", "../myuploads/" + photo.getOriginalFilename());
//        rs.insertRow();
//        return "success";
//        
//        }catch(Exception e){
//            return e.toString();
//        }
//        
//    }
//    
    
    @PostMapping("/vendorAddPhotos")
    String vendorAddPhotos(@RequestPart MultipartFile photo, HttpSession session) {
             
        String ans = "";

        long size = photo.getSize();
        String type = photo.getContentType();
        String orig_name = photo.getOriginalFilename();

        ans = ans + "<h3>File Received</h3>" + "<br>";
        ans = ans + "SIZE: " + size + "<br>";
        ans = ans + "type: " + type + "<br>";
        ans = ans + "orig name: " + orig_name + "<br>";
String vendoremail = (String) session.getAttribute("Vendor_Email");
        try {

            byte b[] = photo.getBytes();

            String abspath = "src/main/webapp/myuploads";

            FileOutputStream fos = new FileOutputStream(abspath + "/" + orig_name);

            fos.write(b);

            ResultSet rs = DbLoader.executeSQL("select * from photo");

 
                rs.moveToInsertRow();
               
                rs.updateString("vendoremail", vendoremail);
              
                rs.updateString("photo", "../myuploads/" + photo.getOriginalFilename());
                rs.insertRow();

                ans = "success";
                return ans;
            }

        
catch (Exception ex) {
            return ex.toString();
        }

       
    }
    
    @GetMapping("/vendorShowPhotos")
    String vendorShowPhotos(HttpSession session) {
        
String vendoremail = (String) session.getAttribute("Vendor_Email");
        String ans = new RDBMS_TO_JSON().generateJSON("select * from photo where vendoremail= '" + vendoremail + "'");

        return ans;
    }
    
     @GetMapping("/deleteVendorPhoto")
    String deleteVendorPhoto(@RequestParam int photoid) {
             
        String ans="";
        
        try{
        ResultSet rs = DbLoader.executeSQL("select * from  photo where photoid="+photoid);
         
        if(rs.next())
        {
            rs.deleteRow();
            ans="success";
            
        }
        else{
            ans="photo with photoid  not present";
        }
        
        }
        catch(Exception ex)
        {
            return ex.toString();
        }
        return ans;
    }



    
    @GetMapping("/vendor_edit_profile")
    String vendor_edit_profile(@RequestParam String email, @RequestParam String name, @RequestParam String description, @RequestParam String slot_amount) {

        String ans = "";

        try {
            ResultSet rs = DbLoader.executeSQL("select * from vendor_table where Vendor_Email='" + email + "'");

            if (rs.next()) {
                
                rs.updateString("Vendor_Name", name);
                rs.updateString("Desc", description);
                rs.updateString("slot_amount", slot_amount);
                
                rs.updateRow();
                ans = "edit successfull";
            } else {
                ans = "edit failed";
            }
        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    }
        
//    @GetMapping("/vendor_EditProfile")
////    String vendor_EditProfile(@RequestParam String email, @RequestParam String name, @RequestParam String description, @RequestParam String slot_amount) {
////
////        String ans = "";
////        
////        System.out.println(email);
////        System.out.println(name);
////        System.out.println(description);
////        System.out.println(slot_amount);
////        
////        try {
////            ResultSet rs = DbLoader.executeSQL("select * from vendor_table where Vendor_Email=" + email + " ");
////
////            if (rs.next()) {
////                
////                rs.updateString("Vendor_Name", name);
////                rs.updateString("Desc", description);
////                rs.updateString("slot_amount", slot_amount);
////                
////                rs.updateRow();
////                ans = "edit successfull";
////            } else {
////                ans = "edit failed";
////            }
////        } catch (Exception ex) {
////            return ex.toString();
////        }
////        return ans;
////    }
//    
//    
    
@GetMapping("/approvedslot_servlet")
    public String approvedslot_servlet(@RequestParam int bookingid) {
        String ans="";
        try{
        ResultSet rs=DbLoader.executeSQL("select * from booking where bookingid= '" + bookingid+"'");
        if(rs.next())
        {
        rs.updateString("status", "Approved");
        rs.updateRow();
        ans="success";
        }
        else
        {
            ans="booking id not present";
        }
        }
        catch(Exception ex)
        {
            return ex.toString();
        }
        return ans;
    }
    
@GetMapping("/pendingslot_servlet")
    public String pendingslot_servlet(@RequestParam int bookingid) {
    String ans="";
        try{
        ResultSet rs=DbLoader.executeSQL("select * from booking where bookingid= '" + bookingid+"'");
        if(rs.next())
        {
        rs.updateString("status", "Pending");
        rs.updateRow();
        ans="success";
        }
        else
        {
            ans="booking id not present";
        }
        }
        catch(Exception ex)
        {
            return ex.toString();
        }
        return ans;
    }    
    
    
@GetMapping("/show_vendorslots_servlet")
    public String show_vendorslots_servlet(HttpSession session) {
String vendoremail =(String) session.getAttribute("Vendor_Email");
        String ans = new RDBMS_TO_JSON().generateJSON("select * from booking where vendoremail = '" + vendoremail+"'");

        return ans;
    }
    
    
@PostMapping("/admin_login")
    public String admin_login(@RequestParam String email, @RequestParam String password, HttpSession session) throws Exception {

        var ans ="";
        try{
        ResultSet rs = DbLoader.executeSQL("select * from admin where email= '"+email+"' and password= '"+password+"'");
                if(rs.next())
                {
                session.setAttribute("email", email);
                    ans = "success";
                
                }
                else
                {
                    ans = "fail";
                }
        }catch(Exception e){
            e.toString();
        }
       return ans;
    }  
  
    
    @PostMapping("/admin_manageservice")
    String admin_manageservice(@RequestParam MultipartFile photo, @RequestParam String sn, @RequestParam String desc) throws Exception 
    {
        
        try{
        ResultSet rs=DbLoader.executeSQL("select * from service");
         
        rs.moveToInsertRow();
        rs.updateString("servicename", sn);
        rs.updateString("desc", desc);
        rs.updateString("photo", "../myuploads/" + photo.getOriginalFilename());
        rs.insertRow();
        return "success";
        
        }catch(Exception e){
            return e.toString();
        }
        
    }


@PostMapping("/addService")
    String addService(@RequestParam String servicename, @RequestParam String description, @RequestPart MultipartFile photo) {

        String ans = "";

        long size = photo.getSize();
        String type = photo.getContentType();
        String orig_name = photo.getOriginalFilename();

        ans = ans + "<h3>File Received</h3>" + "<br>";
        ans = ans + "SIZE: " + size + "<br>";
        ans = ans + "type: " + type + "<br>";
        ans = ans + "orig name: " + orig_name + "<br>";

        try {

            byte b[] = photo.getBytes();

            String abspath = "src/main/webapp/myuploads";

            FileOutputStream fos = new FileOutputStream(abspath + "/" + orig_name);

            fos.write(b);

            ResultSet rs = DbLoader.executeSQL("select * from service");

            rs.moveToInsertRow();

            rs.updateString("servicename",servicename);
            rs.updateString("desc",description);
            rs.updateString("photo", "../myuploads/" + photo.getOriginalFilename());
            rs.insertRow();

            ans = "success";
            return ans;
        } catch (Exception ex) {
            return ex.toString();
        }
}
     @PostMapping("/show_services_servlet")
      String show_already_added_services() {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from  service");

        return ans;
    }
     
     @PostMapping("/delete_services_servlet")
    String delete_services_servlet(@RequestParam int serviceid) {

        String ans = "";

        try {
            ResultSet rs = DbLoader.executeSQL("select * from  service where id=" + serviceid);

            if (rs.next()) {
                rs.deleteRow();
                ans = "success";

            } else {
                ans = "service with serviceid  not present";
            }

        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    }

    
    
    
  @PostMapping("/addSubService")
    String addSubService(@RequestParam int sid, @RequestParam String subservname, @RequestParam String desc, @RequestPart MultipartFile photo) {

        String ans = "";

        long size = photo.getSize();
        String type = photo.getContentType();
        String orig_name = photo.getOriginalFilename();

        ans = ans + "<h3>File Received</h3>" + "<br>";
        ans = ans + "SIZE: " + size + "<br>";
        ans = ans + "type: " + type + "<br>";
        ans = ans + "orig name: " + orig_name + "<br>";

        try {

            byte b[] = photo.getBytes();

            String abspath = "src/main/webapp/myuploads";

            FileOutputStream fos = new FileOutputStream(abspath + "/" + orig_name);

            fos.write(b);

            ResultSet rs = DbLoader.executeSQL("select * from subservice");

            rs.moveToInsertRow();

            rs.updateString("subservicename",subservname);
            rs.updateString("desc",desc);
            rs.updateInt("serviceid", sid);
            rs.updateString("photo", "../myuploads/" + photo.getOriginalFilename());
            rs.insertRow();

            ans = "success";
            return ans;
        } catch (Exception ex) {
            return ex.toString();
        }
}
   @PostMapping("/delete_subservices_servlet")
    String delete_subservices_servlet(@RequestParam String subservicename) {

        String ans = "";

        try {
            ResultSet rs = DbLoader.executeSQL("select * from  subservice where subservicename='" + subservicename+"'");

            if (rs.next()) {
                rs.deleteRow();
                ans = "success";

            } else {
                ans = "service with serviceid  not present";
            }

        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    } 
 
    
    
    


    
@GetMapping("/userAddReview_Servlet")
    public String userAddReview_Servlet(@RequestParam String comment, @RequestParam String vendoremail, @RequestParam int rating, HttpSession session) {

        String useremail = (String) session.getAttribute("useremail");

        System.out.println(useremail);

        try {

            System.out.println("select * from rating");
            ResultSet rs = DbLoader.executeSQL("select * from review");

            rs.moveToInsertRow();
            rs.updateString("useremail", useremail);
            rs.updateString("comment", comment);
            rs.updateString("vendoremail", vendoremail);
            rs.updateInt("rating", rating);

            rs.insertRow();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }
    
    @GetMapping("/userShowRatingsServlet")
    String userShowRatingsServlet(@RequestParam String vendoremail) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from review where vendoremail='"+vendoremail+"' ");
        return ans;
    }
    
    @GetMapping("/userShowAverageRatingsServlet")
    String userShowAverageRatingsServlet(@RequestParam String vendoremail) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select avg(rating) as r1 from review where vendoremail='"+vendoremail+"' ");
        return ans;
    }


@GetMapping("/getuserdata")
    String getuserdata(@RequestParam String email) 
    {
        
        
        String ans=new RDBMS_TO_JSON().generateJSON("select * from users where email='" + email +"'");
       

        return ans;
    }    
    
 @GetMapping("/user_edit_profile")
    String user_edit_profile(@RequestParam String email, @RequestParam String name,  @RequestParam String phoneno) {

        String ans = "";

        try {
            ResultSet rs = DbLoader.executeSQL("select * from users where email='" + email + "'");

            if (rs.next()) {
                
                rs.updateString("username", name);
                rs.updateString("email", email);
                rs.updateString("phoneno", phoneno);
                
                rs.updateRow();
                ans = "edit successfull";
            } else {
                ans = "edit failed";
            }
        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    }    
    

@GetMapping("/user_change_password")
    String user_change_password(@RequestParam String email, @RequestParam String oldpassword, @RequestParam String newpassword) {

        String ans = "";

        try {
            ResultSet rs = DbLoader.executeSQL("select * from users where email='" + email + "'and password='"+oldpassword+"'");

            if (rs.next()) {
                
                rs.updateString("password", newpassword);
               
               
                
                rs.updateRow();
                ans = "successfull";
            } else {
                ans = "failed";
            }
        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    }    
    
@GetMapping("/vendor_change_password")
    String vendor_change_password(@RequestParam String email, @RequestParam String oldpassword, @RequestParam String newpassword) {

        String ans = "";

        try {
            ResultSet rs = DbLoader.executeSQL("select * from vendor_table where Vendor_Email='" + email + "'and Password='"+oldpassword+"'");

            if (rs.next()) {
                
                rs.updateString("password", newpassword);
               
               
                
                rs.updateRow();
                ans = "edit successfull";
            } else {
                ans = "edit failed";
            }
        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    }     
 
    
@PostMapping("/show_vendors_servlet")
    public String show_vendors_servlet() {

      //  System.out.println("--->" + name);
        String ans = new RDBMS_TO_JSON().generateJSON("select * from vendor_table");

        return ans;
    }
    
     @PostMapping("/approve_vendors_servlet")
    String approve_vendors_servlet(@RequestParam String email) {

        String ans = "";

        try {

            ResultSet rs = DbLoader.executeSQL("select * from vendor_table where Vendor_Email='" + email+"'");
            if (rs.next()) {
                rs.updateString("status", "Approved");
                rs.updateRow();
                ans = "success";
            } else {
                ans = "vendor email not present";
            }
        } catch (Exception ex) {
            return ex.toString();
        }

        return ans;
    }

    @PostMapping("/pending_vendors_servlet")
    String pending_vendors_servlet(@RequestParam String email) {

        String ans = "";

        try {

            ResultSet rs = DbLoader.executeSQL("select * from vendor_table where Vendor_Email='" + email+"'");
            if (rs.next()) {
                rs.updateString("status", "Pending");
                rs.updateRow();
                ans = "success";
            } else {
                ans = "vendor email not present";
            }
        } catch (Exception ex) {
            return ex.toString();
        }

        return ans;
    }

@GetMapping("/viewbookings")
    String viewbookings(@RequestParam String useremail ) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from booking where useremail='"+useremail+"'");
        return ans;
    
        
        
    }
    
}

