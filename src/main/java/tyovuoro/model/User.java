package tyovuoro.model;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.annotations.NaturalId;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue
    private Integer id;
    @NaturalId
    private String username;
    private String password;
    @OneToOne(cascade = CascadeType.PERSIST)
    @JoinTable(name = "user_roles",
            joinColumns = {
        @JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {
        @JoinColumn(name = "role_id", referencedColumnName = "id")})
    private Role role;
    private String firstname;
    private String lastname;
    private String email;
    private String address;
    @OneToMany(cascade = CascadeType.PERSIST)
    @JoinTable(name = "banned_users",
            joinColumns = {
        @JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {
        @JoinColumn(name = "place_id", referencedColumnName = "id")})
    private Set<Place> bannedPlaces;

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

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

    public Set<Place> getBannedPlaces() {
        return bannedPlaces;
    }

    public void setBannedPlaces(Set<Place> bannedPlaces) {
        this.bannedPlaces = bannedPlaces;
    }

    @Override
    public String toString() {
        return username + ", " + firstname + " " + lastname ;
    }
}
