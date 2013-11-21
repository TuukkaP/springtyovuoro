package tyovuoro.DAO;

import java.util.List;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import tyovuoro.model.User;

public interface UserDAO {

    @PreAuthorize("isAuthenticated()")
    public User getUser(String username);

    @PreAuthorize("isAuthenticated()")
    public User getUser(int id);

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void saveUser(User user);

    @PreAuthorize("isAuthenticated()")
    public void updateUser(User user);

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public void deleteUser(int id);

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public List getAllUsers();
    
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public List getUser(int[] user_ids);
}
