package tyovuoro.service;

import java.util.List;
import org.springframework.security.access.annotation.Secured;
import tyovuoro.model.Role;

public interface RoleService {

    @Secured({"isAuthenticated()", "authentication"})
    public Role getRole(int id);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void editRole(Role role);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void addRole(Role role);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void deleteRole(int id);

    @Secured("isAuthenticated()")
    public List getAllRoles();
}
