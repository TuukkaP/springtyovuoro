package tyovuoro.service;

import java.util.Calendar;
import java.util.List;
import org.joda.time.DateTime;
import tyovuoro.model.Order;
import tyovuoro.model.User;

public interface OrderService {

    public Order getOrderId(int id);

    public List getOrdersDate(DateTime date);

    public List getOrdersDate(DateTime from, DateTime to);

    public List getOrdersPlace(int id);

    public List getOrdersPlace(List<Integer> places);

    public List getOrdersPlaceAndDay(List<Integer> places, DateTime from, DateTime to);

    public void editOrder(Order order);

    public void addOrder(Order order);

    public void deleteOrder(int id);

    public List getVacantUsersForOrder(Order order);

    public List getOrdersPlaceAndDayForUser(User user, List<Integer> places, DateTime from, DateTime to);

    public List getVacantUsersForDate(DateTime date);

    public List getOrdersUser(User user, DateTime from, DateTime to);

    public List getUnconfirmedOrders(User user, DateTime from);

    public List getConfirmedOrders(User user, DateTime from);

}
