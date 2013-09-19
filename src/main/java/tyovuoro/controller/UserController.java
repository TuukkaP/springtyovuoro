package tyovuoro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tyovuoro.model.User;
import tyovuoro.service.RoleService;
import tyovuoro.service.UserService;

@Controller
@RequestMapping({"/user"})
public class UserController {

    @Autowired
    private UserService userSer;
    @Autowired
    private RoleService roleSer;

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(method = RequestMethod.GET)
    public String showUsers(ModelMap model) {
        model.addAttribute("userList", userSer.getAllUsers());
        return "admin/users/index";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/{username}", method = RequestMethod.GET)
    public String editUser(@PathVariable String username, ModelMap model) {
        model.addAttribute("user", userSer.getUser(username));
        model.addAttribute("roleList", roleSer.getAllRoles());
        return "admin/users/edit";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/{username}", method = RequestMethod.PUT)
    public String updateUser(@RequestParam("role.id") int id, @ModelAttribute User user) {
        user.setRole(roleSer.getRole(id));
        userSer.updateUser(user);
        return "redirect:/user/";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createUser(ModelMap model) {
        model.addAttribute("user", new User());
        model.addAttribute("roleList", roleSer.getAllRoles());
        return "admin/users/create";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String saveUser(@RequestParam("assigned_role") int id, @ModelAttribute User user) {
        user.setRole(roleSer.getRole(id));
        userSer.saveUser(user);
        return "redirect:/user/";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public String deleteUser(@RequestParam("id") int id) {
        userSer.deleteUser(id);
        return "redirect:/user/";
    }
}
