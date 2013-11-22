package tyovuoro.service;

import java.util.List;
import tyovuoro.DAO.RoleDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tyovuoro.model.Role;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    @PreAuthorize("isAuthenticated()")
    @Override
    public Role getRole(int id) {
        return roleDAO.getRole(id);
    }

    @PreAuthorize("hasRole('ROLE_MODERATOR')")
    @Override
    public void editRole(Role role) {
        roleDAO.editRole(role);
    }

    @PreAuthorize("hasRole('ROLE_MODERATOR')")
    @Override
    public void addRole(Role role) {
        roleDAO.addRole(role);
    }

    @PreAuthorize("hasRole('ROLE_MODERATOR')")
    @Override
    public void deleteRole(int id) {
        roleDAO.deleteRole(id);
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getAllRoles() {
       return roleDAO.getAllRoles();
    }

}
