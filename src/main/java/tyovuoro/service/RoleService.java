package tyovuoro.service;

import java.util.List;
import tyovuoro.model.Role;

public interface RoleService {

    public Role getRole(int id);
    public void editRole(Role role);
    public void addRole(Role role);
    public void deleteRole(int id);
    public List getAllRoles();
}
