package tyovuoro.service;

import java.util.List;
import tyovuoro.model.User;

public interface UserService {

    public User getUser(String username);
    public User getUser(int id);
    public List getUser(int[] user_ids);
    public void saveUser(User user);
    public void updateUser(User user);
    public void deleteUser(int id);
    public List getAllUsers();
}
