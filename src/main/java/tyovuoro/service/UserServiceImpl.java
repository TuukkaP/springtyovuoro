package tyovuoro.service;

import java.util.List;
import tyovuoro.DAO.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tyovuoro.model.User;

@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;
    @Autowired
    private StandardPasswordEncoder encoder;

    @PreAuthorize("isAuthenticated()")
    @Override
    public User getUser(String username) {
        return userDAO.getUser(username);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    @Transactional(readOnly = false)
    public void saveUser(User user) {
        user.setPassword(encoder.encode(user.getPassword()));
        userDAO.saveUser(user);
    }

//    @PreAuthorize("hasRole('ROLE_ADMIN') or #user.username == authentication.name")
    @PreAuthorize("isAuthenticated()")
    @Override
    @Transactional(readOnly = false)
    public void updateUser(User user) {
        System.out.println(user);
        userDAO.updateUser(user);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    @Transactional(readOnly = false)
    public void deleteUser(int id) {
//        if (!userDAO.getUser(id).getRole().getRole_name().equals("ROLE_MODERATOR")) {
        userDAO.deleteUser(id);
//        }
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    public List getAllUsers() {
        return userDAO.getAllUsers();
    }

    @PreAuthorize("authentication or hasRole('ROLE_ADMIN')")
    @Override
    public User getUser(int id) {
        return userDAO.getUser(id);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    public List getUser(int[] user_ids) {
        return userDAO.getUser(user_ids);
    }
}
