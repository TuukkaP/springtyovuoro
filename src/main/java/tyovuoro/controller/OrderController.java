package tyovuoro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.validation.Valid;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tyovuoro.model.Order;
import tyovuoro.model.Place;
import tyovuoro.model.User;
import tyovuoro.service.OrderService;
import tyovuoro.service.PlaceService;
import tyovuoro.service.UserService;

@Controller
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

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String userShowOrders(ModelMap model) {
        DateTime dt = new DateTime().withTimeAtStartOfDay();
        DateTime first = new DateTime(dt).withDayOfMonth(1);
        DateTime last = new DateTime(first).withDayOfMonth(first.dayOfMonth().getMaximumValue());
        User user = userSer.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
        List orders = null;
        if (user.getOrganization() == null) {
            orders = orderSer.getOrdersUser(userSer.getUser(SecurityContextHolder.getContext().getAuthentication().getName()), first, last);
        } else {
            orders = orderSer.getOrdersPlaceAndDay(new ArrayList(user.getOrganization().getId()), first, last);
        }
        model.addAttribute("user", user);
        model.addAttribute("dt", dt);
        model.addAttribute("orderList", listFormation(dt, orders));
        model.addAttribute("viikko", viikko);
        model.addAttribute("kuukausi", kuukausi);
        return "order/index";
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/order/show/{day}.{month}.{year}", method = RequestMethod.GET)
    public String userShowFromDate(@PathVariable int day, @PathVariable int month, @PathVariable int year, ModelMap model) {
        DateTime dt = new DateTime(year, month, day, 0, 0);
        DateTime first = new DateTime(dt).withDayOfMonth(1);
        DateTime last = new DateTime(first).withDayOfMonth(first.dayOfMonth().getMaximumValue());
        User user = userSer.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
        model.addAttribute("user", user);
        model.addAttribute("dt", dt);
        model.addAttribute("orderList", listFormation(dt, orderSer.getOrdersUser(userSer.getUser(SecurityContextHolder.getContext().getAuthentication().getName()), first, last)));
        model.addAttribute("viikko", viikko);
        model.addAttribute("kuukausi", kuukausi);
        return "order/index";
    }

    @PreAuthorize("hasAnyRole('ROLE_ORDERADMIN', 'ROLE_ADMIN')")
    @RequestMapping(value = "/admin/order", method = RequestMethod.GET)
    public String adminShowOrders(ModelMap model) {
        DateTime dt = new DateTime().withTimeAtStartOfDay();
        DateTime first = new DateTime(dt).withDayOfMonth(1);
        DateTime last = new DateTime(first).withDayOfMonth(first.dayOfMonth().getMaximumValue());
        model.addAttribute("dt", dt);
        model.addAttribute("orderList", listFormation(dt, orderSer.getOrdersDate(first, last)));
        model.addAttribute("viikko", viikko);
        model.addAttribute("kuukausi", kuukausi);
        return "admin/orders/index";
    }

    @PreAuthorize("hasAnyRole('ROLE_ORDERADMIN', 'ROLE_ADMIN')")
    @RequestMapping(value = "/admin/order/show/{day}.{month}.{year}", method = RequestMethod.GET)
    public String adminShowFromDate(@PathVariable int day, @PathVariable int month, @PathVariable int year, ModelMap model) {
        DateTime dt = new DateTime(year, month, day, 0, 0);
        DateTime first = new DateTime(dt).withDayOfMonth(1);
        DateTime last = new DateTime(first).withDayOfMonth(first.dayOfMonth().getMaximumValue());
        model.addAttribute("dt", dt);
        model.addAttribute("orderList", listFormation(dt, orderSer.getOrdersDate(first, last)));
        model.addAttribute("viikko", viikko);
        model.addAttribute("kuukausi", kuukausi);
        return "admin/orders/index";
    }

    @PreAuthorize("hasAnyRole('ROLE_ORDERADMIN', 'ROLE_ADMIN')")
    @RequestMapping(value = "/admin/order/{id}", method = RequestMethod.GET)
    public String adminEditOrder(@PathVariable int id, ModelMap model) {
        Order order = orderSer.getOrderId(id);
        model.addAttribute("order", order);
        model.addAttribute("OrdersForToday", orderSer.getOrdersDate(order.getDate().toDateTime()));
        model.addAttribute("placeList", placeSer.getAllPlaces());
        model.addAttribute("vacantUsers", placeSer.getValidUsers(order.getPlace().getName()));
        return "admin/orders/edit";
    }

    @PreAuthorize("hasAnyRole('ROLE_PHARMACY', 'ROLE_ORDERADMIN', 'ROLE_ADMIN')")
    @RequestMapping(value = "/admin/order/show/{day}.{month}.{year}/orders.json", method = RequestMethod.GET)
    public @ResponseBody
    List getJsonOrdersForDate(@PathVariable int day, @PathVariable int month, @PathVariable int year) {
        List<Order> orderList = orderSer.getOrdersDate(new DateTime(year, month, day, 0, 0));
        ArrayList<Map> list = new ArrayList<Map>();
        for (Order order : orderList) {
            HashMap<String, String> temp = new HashMap<String, String>();
            temp.put("id", order.getId().toString());
            if (order.getUser() == null) {
                temp.put("user", null);
            } else {
                temp.put("user", order.getUser().getFirstname() + ", " + order.getUser().getLastname());
            }
            temp.put("place", order.getPlace().getName());
            temp.put("date", order.getDate().toString("dd.MM.yyyy"));
            temp.put("time", order.getOrder_start().toString("HH:mm") + "-" + order.getOrder_end().toString("HH:mm"));
            list.add(temp);
        }
        return list;
    }

    @PreAuthorize("hasAnyRole('ROLE_PHARMACY', 'ROLE_ORDERADMIN', 'ROLE_ADMIN')")
    @RequestMapping(value = "/admin/order/{id}", method = RequestMethod.PUT)
    public String adminUpdateOrder(@PathVariable int id, @ModelAttribute @Valid Order order, BindingResult bind, ModelMap model, RedirectAttributes redirectAttributes) {
        if (bind.hasErrors()) {
            Order o = orderSer.getOrderId(id);
            model.addAttribute("OrdersForToday", orderSer.getOrdersDate(o.getDate().toDateTime()));
            model.addAttribute("placeList", placeSer.getAllPlaces());
            model.addAttribute("vacantUsers", placeSer.getValidUsers(o.getPlace().getName()));
            return "admin/orders/edit";
        }
        if (order.getUser().getId() == 0) {
            order.setUser(null);
        }
        orderSer.editOrder(order);
        redirectAttributes.addFlashAttribute("message", "Vuoroa muokattu " + order.getDate().toString("dd.MM.yyyy"));
        return "redirect:/admin/order/show/" + order.getDate().toString("dd.MM.yyyy");
    }

    @PreAuthorize("hasAnyRole('ROLE_PHARMACY', 'ROLE_ORDERADMIN', 'ROLE_ADMIN')")
    @RequestMapping(value = "/admin/order/create/{day}.{month}.{year}", method = RequestMethod.GET)
    public String adminCreateOrder(@PathVariable int day, @PathVariable int month, @PathVariable int year, ModelMap model) {
        DateTime dt = new DateTime(year, month, day, 0, 0);
        Order order = new Order();
        order.setDate(dt.toLocalDateTime());
        model.addAttribute("order", order);
        model.addAttribute("OrdersForToday", orderSer.getOrdersDate(dt));
        model.addAttribute("placeList", placeSer.getAllPlaces());
        model.addAttribute("vacantUsers", placeSer.getValidUsers(((Place) placeSer.getAllPlaces().get(0)).getName()));
        return "admin/orders/create";
    }

    @PreAuthorize("hasAnyRole('ROLE_PHARMACY', 'ROLE_ORDERADMIN', 'ROLE_ADMIN')")
    @RequestMapping(value = "/admin/order/create/{day}.{month}.{year}", method = RequestMethod.POST)
    public String adminSaveOrder(@PathVariable int day, @PathVariable int month, @PathVariable int year, @ModelAttribute @Valid Order order, BindingResult bind, @RequestParam("place.id") int place_id, ModelMap model, RedirectAttributes redirectAttributes) {
        if (bind.hasErrors()) {
            model.addAttribute("OrdersForToday", orderSer.getOrdersDate(new DateTime(year, month, day, 0, 0)));
            model.addAttribute("placeList", placeSer.getAllPlaces());
            model.addAttribute("vacantUsers", placeSer.getValidUsers(placeSer.getPlace(place_id).getName()));
            return "admin/orders/create";
        }
        if (order.getUser().getId() == 0) {
            order.setUser(null);
        }
        orderSer.addOrder(order);
        redirectAttributes.addFlashAttribute("message", "Vuoro lisätty " + order.getDate().toString("dd.MM.yyyy"));
        return "redirect:/admin/order/show/" + order.getDate().toString("dd.MM.yyyy");
    }

    @PreAuthorize("hasAnyRole('ROLE_PHARMACY', 'ROLE_ORDERADMIN', 'ROLE_ADMIN')")
    @RequestMapping(value = "/admin/order/delete", method = RequestMethod.DELETE)
    public String adminDeleteOrder(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        DateTime dt = orderSer.getOrderId(id).getDate().toDateTime();
        orderSer.deleteOrder(id);
        redirectAttributes.addFlashAttribute("message", "Vuoro poistettu!");
        return "redirect:/admin/order/show/" + dt.toString("dd.MM.yyyy");
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
