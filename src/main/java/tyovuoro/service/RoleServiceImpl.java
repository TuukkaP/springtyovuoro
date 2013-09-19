package tyovuoro.service;

import java.util.List;
import tyovuoro.DAO.RoleDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tyovuoro.model.Role;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    @Override
    public Role getRole(int id) {
        return roleDAO.getRole(id);
    }

    @Override
    public void editRole(Role role) {
        roleDAO.editRole(role);
    }

    @Override
    public void addRole(Role role) {
        roleDAO.addRole(role);
    }

    @Override
    public void deleteRole(int id) {
        roleDAO.deleteRole(id);
    }

    @Override
    public List getAllRoles() {
       return roleDAO.getAllRoles();
    }

}
