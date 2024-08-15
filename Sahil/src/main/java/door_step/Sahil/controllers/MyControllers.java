package door_step.Sahil.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
@Controller
public class MyControllers {
    @GetMapping("/")
    String go(){
        return "index.jsp";
    }
}
