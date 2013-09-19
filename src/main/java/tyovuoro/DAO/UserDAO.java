package tyovuoro.DAO;

import java.util.List;
import java.util.Set;
import org.springframework.security.access.annotation.Secured;
import tyovuoro.model.User;

public interface UserDAO {

    @Secured("isAuthenticated()")
    public User getUser(String username);

    @Secured("isAuthenticated()")
    public User getUser(int id);

    @Secured("hasRole('ROLE_ADMIN')")
    public void saveUser(User user);

    @Secured("isAuthenticated()")
    public void updateUser(User user);

    @Secured("hasRole('ROLE_ADMIN')")
    public void deleteUser(int id);

    @Secured("hasRole('ROLE_ADMIN')")
    public List getAllUsers();
    
    public Set getValidPlaces(String username);
    
    public Set getBannedPlaces(String username);
}
