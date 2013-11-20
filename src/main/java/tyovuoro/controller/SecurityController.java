package tyovuoro.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import tyovuoro.DAO.UserDAO;
import tyovuoro.service.CustomUserDetailsService;

@Controller
public class SecurityController {
    
    @Autowired
    private UserDAO userSer;

    @Secured("hasRole('ROLE_ANONYMOUS')")
    @RequestMapping({"/login"})
    public String login(ModelMap model) {
        return "login/login";
    }

    @Secured("hasRole('ROLE_ANONYMOUS')")
    @RequestMapping({"/login-error"})
    public String loginError(ModelMap model) {
        model.addAttribute("error", "Käyttäjätunnus tai salasana väärin");
        return "login/login";
    }

    @Secured("hasRole('ROLE_PHARMACY')")
    @RequestMapping({"/logout"})
    public String logout(ModelMap model) {
        model.addAttribute("message", "Kirjauduit ulos!");
        return "login/login";
    }
}
