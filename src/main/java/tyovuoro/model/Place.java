package tyovuoro.model;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NaturalId;

@Entity
@Table(name = "places")
public class Place {

    @Id
    @GeneratedValue
    private Integer id;
    @NaturalId
    private String name;
    private String address;
    private String info;
    @OneToMany(cascade = CascadeType.PERSIST)
    @JoinTable(name = "banned_users",
            joinColumns = {
        @JoinColumn(name = "place_id", referencedColumnName = "id")},
            inverseJoinColumns = {
        @JoinColumn(name = "user_id", referencedColumnName = "id")})
    private Set<User> bannedUsers;

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
    
    
}
