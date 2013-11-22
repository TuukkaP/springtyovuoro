package tyovuoro.service;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import tyovuoro.model.Role;

public interface RoleService {

//    @PreAuthorize("isAuthenticated()")
    public Role getRole(int id);

//    @PreAuthorize("hasRole('ROLE_MODERATOR')")
    public void editRole(Role role);

//    @PreAuthorize("hasRole('ROLE_MODERATOR')")
    public void addRole(Role role);

//    @PreAuthorize("hasRole('ROLE_MODERATOR')")
    public void deleteRole(int id);

//    @PreAuthorize("isAuthenticated()")
    public List getAllRoles();
}
