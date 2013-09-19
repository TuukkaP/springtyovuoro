package tyovuoro.controller;

import java.util.Collection;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StaticPagesController {

    @Secured("isAuthenticated()")
    @RequestMapping({"/", "/home"})
    public String showHomePage(ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        Collection role = auth.getAuthorities();
        model.addAttribute("username", name);
        model.addAttribute("role", role.toString());
        return "static/home";
    }

    @Secured("isAuthenticated()")
    @RequestMapping({"/info"})
    public String showInfoPage() {
        return "static/info";
    }

    @Secured("hasRole('ROLE_ANONYMOUS')")
    @RequestMapping({"/404"})
    public String errorPage() {
        return "static/error";
    }
}
