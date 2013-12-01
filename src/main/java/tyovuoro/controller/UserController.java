package tyovuoro.controller;


import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tyovuoro.model.User;
import tyovuoro.service.PlaceService;
import tyovuoro.service.RoleService;
import tyovuoro.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userSer;
    @Autowired
    private RoleService roleSer;
    @Autowired
    private PlaceService placeSer;

    @PreAuthorize("isAuthenticated()")
    @RequestMapping({"/user", "/user/{username}"})
    public String showUsers(ModelMap model) {
        model.addAttribute("user", userSer.getUser(SecurityContextHolder.getContext().getAuthentication().getName()));
        return "user/index";
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/user/{username}", method = RequestMethod.PUT)
    public String updateUser(@RequestParam("role.id") int id, @ModelAttribute @Valid User user, BindingResult result, RedirectAttributes redirectAttributes,  ModelMap model) {
        user.setRole(roleSer.getRole(id));
        if (result.hasErrors()) {
            return "user/index";
        }
        userSer.updateUser(user);
        redirectAttributes.addFlashAttribute("message", "Käyttäjätiedot päivitetty!");
        return "redirect:/user/";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user", method = RequestMethod.GET)
    public String adminShowUsers(ModelMap model) {
        model.addAttribute("userList", userSer.getAllUsers());
        return "admin/users/index";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/{username}", method = RequestMethod.GET)
    public String adminEditUser(@PathVariable String username, ModelMap model) {
        model.addAttribute("user", userSer.getUser(username));
        model.addAttribute("roleList", roleSer.getAllRoles());
        model.addAttribute("placeList", placeSer.getAllPlaces());
        return "admin/users/edit";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/{username}", method = RequestMethod.PUT)
    public String adminUpdateUser(@RequestParam("role.id") int id, @ModelAttribute @Valid User user, BindingResult result, ModelMap model) {
        user.setRole(roleSer.getRole(id));
        if (result.hasErrors()) {
            model.addAttribute("roleList", roleSer.getAllRoles());
            return "admin/users/edit";
        }
        userSer.updateUser(user);
        return "redirect:/admin/user/";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String adminCreateUser(ModelMap model) {
        model.addAttribute("user", new User());
        model.addAttribute("roleList", roleSer.getAllRoles());
        return "admin/users/create";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String adminSaveUser(@RequestParam("assigned_role") int id, @ModelAttribute @Valid User user, BindingResult result, ModelMap model) {
        user.setRole(roleSer.getRole(id));
        if (result.hasErrors()) {
            model.addAttribute("roleList", roleSer.getAllRoles());
            return "admin/users/create";
        }
        userSer.saveUser(user);
        return "redirect:/user/";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/user/delete", method = RequestMethod.DELETE)
    public String deleteUser(@RequestParam("id") int id) {
        userSer.deleteUser(id);
        return "redirect:/user/";
    }
}
