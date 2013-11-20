package tyovuoro.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import tyovuoro.model.Order;
import tyovuoro.model.User;
import tyovuoro.service.OrderService;
import tyovuoro.service.PlaceService;
import tyovuoro.service.UserService;

@Controller
@RequestMapping({"/order"})
public class OrderController {

    @Autowired
    private UserService userSer;
    @Autowired
    private OrderService orderSer;
    @Autowired
    private PlaceService placeSer;
    private DateTimeFormatter day = DateTimeFormat.forPattern("dd.MM.yyyy");
    private DateTimeFormatter hour = DateTimeFormat.forPattern("HH:mm");
    private String[] viikko = {"Viikonpäivät", "Maanantai", "Tiistai", "Keskiviikko", "Torstai", "Perjantai", "Lauantai", "Sunnuntai"};
    private String[] kuukausi = {"Kuukaudet", "Tammikuu", "Helmikuu", "Maaliskuu", "Huhtikuu", "Toukokuu", "Kesäkuu", "Heinäkuu",
        "Elokuu", "Syyskuu", "Lokakuu", "Marraskuu", "Joulukuu"};

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(method = RequestMethod.GET)
    public String showOrders(ModelMap model) {
        DateTime dt = new DateTime().withTimeAtStartOfDay();
        DateTime first = new DateTime(dt).withDayOfMonth(1);
        DateTime last = new DateTime(first).withDayOfMonth(first.dayOfMonth().getMaximumValue());
        model.addAttribute("firstDate", dt);
        model.addAttribute("orderList", listFormation(dt, orderSer.getOrdersDate(first, last)));
        model.addAttribute("viikko", viikko);
        model.addAttribute("kuukausi", kuukausi);
        return "admin/orders/index";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/{date}.{month}.{year}", method = RequestMethod.GET)
    public String showFromDate(@PathVariable int date, @PathVariable int month, @PathVariable int year, ModelMap model) {
        DateTime dt = new DateTime(year, month, date, 0, 0);
        DateTime first = new DateTime(dt).withDayOfMonth(1);
        DateTime last = new DateTime(first).withDayOfMonth(first.dayOfMonth().getMaximumValue());
        model.addAttribute("dt", dt);
        model.addAttribute("orderList", listFormation(dt, orderSer.getOrdersDate(first, last)));
        model.addAttribute("viikko", viikko);
        model.addAttribute("kuukausi", kuukausi);
        return "admin/orders/index";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editOrder(@PathVariable int id, ModelMap model) {
        Order order = orderSer.getOrderId(id);
        model.addAttribute("order", order);
        model.addAttribute("OrdersForToday", orderSer.getOrdersDate(order.getDate().toDateTime()));
        model.addAttribute("placeList", placeSer.getAllPlaces());
        model.addAttribute("vacantUsers", orderSer.getVacantUsersForOrder(order));
        return "admin/orders/edit";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.PUT)
    public String updateOrder(@ModelAttribute Order order) {
        orderSer.editOrder(order);
        return "redirect:/order/";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createUser(ModelMap model) {
        model.addAttribute("user", new User());
        return "admin/users/create";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String saveUser(@RequestParam("assigned_role") int id, @ModelAttribute User user) {
        userSer.saveUser(user);
        return "redirect:/user/";
    }

    @Secured("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public String deleteUser(@RequestParam("id") int id) {
        userSer.deleteUser(id);
        return "redirect:/user/";
    }

    private Map listFormation(DateTime dt, List<Order> orders) {
        DateTime first = new DateTime(dt).withDayOfMonth(1);
        DateTime last = new DateTime(first).withDayOfMonth(first.dayOfMonth().getMaximumValue());
        TreeMap<DateTime, List> map = new TreeMap<DateTime, List>();
        addOrdersToTreeMap(orders, map);
        addDaysToTreeMap(first, last, map);
        return map;
    }

    private void addDaysToTreeMap(DateTime first, DateTime last, TreeMap<DateTime, List> map) {
        while (first.compareTo(last) <= 0) { // Kuun ensimmäinen päivä <= kuun viimeinen päivä
            if (!map.containsKey(first)) {
                map.put(first, null);
            }
            first = first.plusDays(1);
        }
    }

    private void addOrdersToTreeMap(List<Order> orders, TreeMap<DateTime, List> map) {
        if (!orders.isEmpty()) {
            ArrayList<Order> lista = new ArrayList<Order>();
            lista = loopOrders(orders, lista, map);
            map.put(lista.get(0).getDate().toDateTime(), lista);
        }
    }

    private ArrayList<Order> loopOrders(List<Order> orders, ArrayList<Order> lista, TreeMap<DateTime, List> map) {
        for (Order order : orders) { // tarkistetaan onko sama päivämäärä ja eri id
            if (lista.isEmpty() || lista.get(0).getDate().toDateTime().equals(order.getDate().toDateTime()) && !lista.contains(order)) {
                lista.add(order);
            } else {
                map.put(lista.get(0).getDate().toDateTime(), lista);
                lista = new ArrayList<Order>();
                lista.add(order);
            }
        }
        return lista;
    }
}
