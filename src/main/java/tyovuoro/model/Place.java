package tyovuoro.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "places")
public class Place {

    @Id
    @GeneratedValue
    private Integer id;
    @NotBlank
    @Length(min = 2, max = 15)
    private String name;
    @Length(max = 15)
    private String phone;
    @Length(max = 25)
    private String contact;
    @Length(min = 2, max = 50)
    private String address;
    @Length(max = 500)
    private String info;
    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "banned_users",
            joinColumns = {
                @JoinColumn(name = "place_id")},
            inverseJoinColumns = {
                @JoinColumn(name = "user_id")})
    private Set<User> bannedUsers;
    @OneToMany(mappedBy = "place", cascade = CascadeType.PERSIST)
    private Set<Order> orders;
    @OneToMany(mappedBy = "organization", cascade = CascadeType.PERSIST)
    private Set<User> organization_users;

    public Place() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Set<User> getBannedUsers() {
        return bannedUsers;
    }

    public void setBannedUsers(Set<User> BannedUsers) {
        this.bannedUsers = BannedUsers;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public Set<User> getOrganization_users() {
        return organization_users;
    }

    public void setOrganization_users(Set<User> organization_users) {
        this.organization_users = organization_users;
    }

}
