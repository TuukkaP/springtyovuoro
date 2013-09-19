package tyovuoro.DAO;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tyovuoro.model.Role;

@Repository
public class RoleDAOImpl implements RoleDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Role getRole(int id) {
        return (Role) sessionFactory.getCurrentSession().get(Role.class, id);
    }

    //Sivustolla on vain yhdet moderaattoritunnukset tai ne pitää lisätä manuaalisesti, käyttäjät eivät voi luoda moderaattoria.
    @Override
    public List getAllRoles() {
        return sessionFactory.getCurrentSession().createQuery("from Role r where r.id is not 0").list();
    }

    @Override
    public void editRole(Role role) {
        sessionFactory.getCurrentSession().update(role);
    }

    @Override
    public void addRole(Role role) {
        sessionFactory.getCurrentSession().save(role);
    }

    @Override
    public void deleteRole(int id) {
        sessionFactory.getCurrentSession().delete(getRole(id));
    }

}
