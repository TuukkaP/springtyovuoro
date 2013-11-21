package tyovuoro.DAO;

import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Repository;
import tyovuoro.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public User getUser(String username) {
        return (User) sessionFactory.getCurrentSession().createQuery("from User u where u.username = :username").setParameter("username", username).list().get(0);
    }

    @Override
    public void saveUser(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public void updateUser(User user) {
        sessionFactory.getCurrentSession().merge(user);
    }

    @Override
    public void deleteUser(int id) {
        sessionFactory.getCurrentSession().delete(getUser(id));
    }

    @Override
    public List getAllUsers() {
        return sessionFactory.getCurrentSession().createQuery("from User u order by u.lastname").list();
    }

    @Override
    public User getUser(int id) {
        return (User) sessionFactory.getCurrentSession().get(User.class, id);
    }

    @Override
    public List getUser(int[] user_ids) {
        return sessionFactory.getCurrentSession().createQuery("from User u where o.id in (:id)").setParameter("id", user_ids).list();
    }
}
