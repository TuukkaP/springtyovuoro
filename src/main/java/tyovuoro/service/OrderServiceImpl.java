/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tyovuoro.service;

import java.util.Calendar;
import java.util.List;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tyovuoro.DAO.OrderDAO;
import tyovuoro.model.Order;
import tyovuoro.model.User;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    public Order getOrderId(int id) {
        return orderDAO.getOrderId(id);
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getOrdersDate(DateTime date) {
        return orderDAO.getOrdersDate(date.withTimeAtStartOfDay());
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getOrdersDate(DateTime from, DateTime to) {
        return orderDAO.getOrdersDate(from.withTimeAtStartOfDay(), to.withTimeAtStartOfDay());
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getOrdersPlace(int id) {
        return orderDAO.getOrdersPlace(id);
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getOrdersPlace(List<Integer> places) {
        return orderDAO.getOrdersPlace(places);
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getOrdersPlaceAndDay(List<Integer> places, DateTime from, DateTime to) {
        return orderDAO.getOrdersPlaceAndDay(places, from.withTimeAtStartOfDay(), to.withTimeAtStartOfDay());
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    public void editOrder(Order order) {
        orderDAO.editOrder(order);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    public void addOrder(Order order) {
        orderDAO.addOrder(order);
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @Override
    public void deleteOrder(int id) {
        orderDAO.deleteOrder(id);
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getVacantUsersForOrder(Order order) {
        return orderDAO.getVacantUsersForOrder(order);
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getOrdersPlaceAndDayForUser(User user, List<Integer> places, DateTime from, DateTime to) {
        return orderDAO.getOrdersPlaceAndDayForUser(user, places, from.withTimeAtStartOfDay(), to.withTimeAtStartOfDay());
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getVacantUsersForDate(DateTime date) {
        return orderDAO.getVacantUsersForDate(date);
    }

    @PreAuthorize("isAuthenticated()")
    @Override
    public List getOrdersUser(User user, DateTime from, DateTime to) {
        return orderDAO.getOrdersUser(user, from.withTimeAtStartOfDay(), to.withTimeAtStartOfDay());
    }
}
