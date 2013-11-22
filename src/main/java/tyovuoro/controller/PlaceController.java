package tyovuoro.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tyovuoro.binder.UserBinder;
import tyovuoro.model.Place;
import tyovuoro.model.User;
import tyovuoro.service.PlaceService;
import tyovuoro.service.UserService;

@Controller

public class PlaceController {

    @Autowired
    private PlaceService placeSer;
    @Autowired
    private UserService userSer;
    
    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
		binder.registerCustomEditor(User.class, new UserBinder(this.userSer));
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping({"/admin/place"})
    public String showPlaces(ModelMap model) {
        model.addAttribute("placeList", placeSer.getAllPlaces());
        return "admin/places/index";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/place/{name}", method = RequestMethod.GET)
    public String editUser(@PathVariable String name, ModelMap model) {
        model.addAttribute("place", placeSer.getPlace(name));
        model.addAttribute("banList", placeSer.getBannedUsers(name));
        model.addAttribute("validUsers", placeSer.getValidUsers(name));
        model.addAttribute("userList", userSer.getAllUsers());
        return "admin/places/edit";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/place/{name}", method = RequestMethod.PUT)
    public String updateUser(@ModelAttribute Place place) {
//        Set<User> users = new HashSet<User>();
//        for (String name : bannedUsers) {
//            users.add(userSer.getUser(name));
//        }
//        place.setBannedUsers(users);
        placeSer.editPlace(place);
        return "redirect:/admin/place/";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/place/create", method = RequestMethod.GET)
    public String createUser(ModelMap model) {
        model.addAttribute("place", new Place());
        model.addAttribute("userList", userSer.getAllUsers());
        return "admin/places/create";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/place/create", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute Place place) {
        placeSer.addPlace(place);
        return "redirect:/admin/place";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/place/delete", method = RequestMethod.DELETE)
    public String deleteUser(@RequestParam("id") int id) {
        placeSer.deletePlace(id);
        return "redirect:/admin/place/";
    }
    
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin/place/{id}/users.json", method = RequestMethod.GET)
    @ResponseBody
    public List getPlacesValidUsers(@RequestParam("id") int id) {
        return placeSer.getBannedUsers(placeSer.getValidUsers(name));
    }
}
