package tyovuoro.DAO;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tyovuoro.model.Place;

@Repository
public class PlaceDAOImpl implements PlaceDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Place getPlace(int id) {
        return (Place) sessionFactory.getCurrentSession().get(Place.class, id);
    }

    @Override
    public Place getPlace(String name) {
        return (Place) sessionFactory.getCurrentSession().createQuery("from Place p where p.name = :name").setParameter("name", name).list().get(0);
    }

    @Override
    public void editPlace(Place place) {
        sessionFactory.getCurrentSession().merge(place);
    }

    @Override
    public void addPlace(Place place) {
        sessionFactory.getCurrentSession().save(place);
    }

    @Override
    public void deletePlace(int id) {
        sessionFactory.getCurrentSession().delete(getPlace(id));
    }

    @Override
    public List getAllPlaces() {
        return sessionFactory.getCurrentSession().createQuery("from Place p order by p.name").list();
    }
}
