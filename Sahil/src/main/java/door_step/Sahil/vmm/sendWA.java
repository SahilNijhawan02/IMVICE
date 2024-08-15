package door_step.Sahil.vmm;


import java.net.HttpURLConnection;
import java.net.URL;


public class sendWA {
   
    public static void sendWA(String phone , String message) {
       
        String mes = message.replace(" ", "%20");
        String api = "bc448d2051e148e2beb298c46b02fecf";
        try {
           
        String apiUrl = "http://wapi.tagdigitalsolutions.com/wapp/api/send?apikey="+api+"&mobile="+phone+"&msg="+mes;
        
        
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        
        if(connection.getResponseCode()==200)
        {
           String res = new String(connection.getInputStream().readAllBytes());
            System.out.println("--->"+res);
        }
        
    }
        catch (Exception ex) 
        {
        ex.printStackTrace();
        
        }
    }
    
    
}
