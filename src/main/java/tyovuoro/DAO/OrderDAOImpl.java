/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tyovuoro.DAO;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tyovuoro.model.Order;
import tyovuoro.model.User;

@Repository
public class OrderDAOImpl implements OrderDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Order getOrderId(int id) {
        return (Order) sessionFactory.getCurrentSession().get(Order.class, id);
    }

    @Override
    public List getOrdersDate(DateTime date) {
        return sessionFactory.getCurrentSession().createQuery("from Order o where o.date = :date").setParameter("date", date.toLocalDateTime()).list();
    }

    @Override
    public List getOrdersPlace(int id) {
        return sessionFactory.getCurrentSession().createQuery("from Order o where o.place_id = :id order by o.date").setParameter("id", id).setMaxResults(50).list();
    }

    @Override
    public List getOrdersPlace(List<Integer> place_ids) {
        return sessionFactory.getCurrentSession().createQuery("from Order o where o.place_id in (:id) order by o.date").setParameter("id", place_ids).setMaxResults(200).list();
    }

    @Override
    public void editOrder(Order order) {
        sessionFactory.getCurrentSession().update(order);
    }

    @Override
    public void addOrder(Order order) {
        sessionFactory.getCurrentSession().save(order);
    }

    @Override
    public void deleteOrder(int id) {
        sessionFactory.getCurrentSession().delete(getOrderId(id));
    }

    @Override
    public List getOrdersDate(DateTime from, DateTime to) {
        return sessionFactory.getCurrentSession().createQuery("from Order o where o.date between :start and :end order by o.date")
                .setParameter("start", from.toLocalDateTime()).setParameter("end", to.toLocalDateTime()).list();
    }

    @Override
    public List getVacantUsersForOrder(Order order) {
        int user = 0;
        if (order.getUser() != null) {
            user = order.getUser().getId();
        }
        List list = getBannedUserIds(order);
        return sessionFactory.getCurrentSession()
                .createQuery("from User as u where u.id not in (:bannedUsers)")
                .setParameterList("bannedUsers", list).list();
//        return sessionFactory.getCurrentSession().createQuery("from User u where "
//                + "u.id not in (:bannedUsers) and u not in (select o.user from Order o where o.date = :date and o.user.id != :user_id)")
//                .setParameterList("bannedUsers", list).setParameter("date", order.getDate()).setParameter("user_id", user).list();
    }

    @Override
    public List getOrdersPlaceAndDay(List<Integer> places, DateTime from, DateTime to) {
        return sessionFactory.getCurrentSession().createQuery("from Order o where o.date between :start and :end and o.place in (:place_ids) order by o.date")
                .setParameter("start", from.toLocalDateTime()).setParameter("end", to.toLocalDateTime()).setParameter("place_ids", places).list();
    }

    @Override
    public List getOrdersPlaceAndDayForUser(User user, List<Integer> places, DateTime from, DateTime to) {
        return sessionFactory.getCurrentSession().createQuery("from Order o where o.date between :start and :end and o.place in (:place_ids) and o.user_id = :user order by o.date")
                .setParameter("start", from.toLocalDateTime()).setParameter("end", to.toLocalDateTime()).setParameter("place_ids", places)
                .setParameter("user", user.getId()).list();
    }

    private List getBannedUserIds(Order order) throws HibernateException {
        List list = sessionFactory.getCurrentSession().createSQLQuery("SELECT user_id FROM banned_users WHERE place_id = :id")
                .setInteger("id", order.getPlace().getId())
                .list();
        if (list.isEmpty()) {
            list.add(0);
        }
        return list;
    }

    @Override
    public List getVacantUsersForDate(DateTime date) {
        return sessionFactory.getCurrentSession().createQuery("from User u where u not in (select o.user from Order o where o.date = :date)")
                .setParameter("date", date.toLocalDateTime()).list();
    }
}
