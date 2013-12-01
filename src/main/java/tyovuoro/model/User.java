package tyovuoro.model;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue
    private Integer id;
    @NotBlank @Length(min=3, max=15)
    private String username;
    @NotBlank @Length(min=8)
    private String password;
    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinTable(name = "user_roles",
            joinColumns = {
                @JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {
                @JoinColumn(name = "role_id", referencedColumnName = "id")})
    private Role role;
    @NotBlank @Length(min=2, max=25)
    private String firstname;
    @NotBlank @Length(min=2, max=25)
    private String lastname;
    @NotBlank @Email
    private String email;
    @Length(max=50)
    private String address;
    @ManyToMany(mappedBy = "bannedUsers")
//    @JoinTable(name = "banned_users",
//            joinColumns = {
//        @JoinColumn(name = "user_id")},
//            inverseJoinColumns = {
//        @JoinColumn(name = "place_id")})
    private Set<Place> bannedPlaces;
    @OneToMany(mappedBy = "user", cascade = CascadeType.PERSIST)
    private Set<Order> orders;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @JsonIgnore
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @JsonIgnore
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @JsonIgnore
    public Set<Place> getBannedPlaces() {
        return bannedPlaces;
    }

    public void setBannedPlaces(Set<Place> bannedPlaces) {
        this.bannedPlaces = bannedPlaces;
    }

    @JsonIgnore
    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return lastname + ", " + firstname;
    }
}
