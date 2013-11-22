package tyovuoro.service;

import java.util.List;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import tyovuoro.model.User;

public interface UserService {

//    @PreAuthorize("#contact.name == authentication.name")
//    @PreAuthorize("authentication or hasRole('ROLE_ADMIN') or #username == authentication.name")
    public User getUser(String username);

//    @PreAuthorize("authentication or hasRole('ROLE_ADMIN')")
    public User getUser(int id);

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void saveUser(User user);

//    @PreAuthorize("hasRole('ROLE_ADMIN') or #user.username == authentication.name")
    public void updateUser(User user);

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void deleteUser(int id);

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public List getAllUsers();
    
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public List getUser(int[] user_ids);
}
