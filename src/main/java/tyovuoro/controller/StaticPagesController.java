package tyovuoro.controller;

import java.util.Collection;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StaticPagesController {

    @PreAuthorize("isAuthenticated()")
    @RequestMapping({"/", "/home"})
    public String showHomePage(ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        Collection role = auth.getAuthorities();
        model.addAttribute("username", name);
        model.addAttribute("role", role.toString());
        return "static/home";
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping({"/info"})
    public String showInfoPage() {
        return "static/info";
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping({"/404"})
    public String errorPage() {
        return "static/error";
    }
}
